/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Jun 25 16:10 IST 2014
    Last updated	:	Jun 26, 2014
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Partial Script to upgrade CDB to Revision.02
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
		26-Jun-2014 : JL
			* Level 4 Address Components is dropped since the possibility was only India, where
			  up to 4 levels were expected to be used; currently, level 3 is found to be good enough.
			  All objects/references/instances related to Level 4 Address Components are dropped/removed.
		25-Jun-2014 : JL : Initial Version
			* A unique constraint of table level_1_address_components has now been correctly named.
   ==================================================================================*/

-- =============================================================================
--	Table post_offices
-- =============================================================================
ALTER	TABLE	level_1_address_components
	DROP	CONSTRAINT	Level1AddressComponents_U1_CountryID_Level1AddressComponentName
GO

ALTER	TABLE	level_1_address_components
	ADD	CONSTRAINT	Level1AddressComponents_U2_CountryID_Level1AddressComponentName
				UNIQUE	CLUSTERED	(	country_id, level_1_address_component_nm	)
GO

-- =============================================================================

ALTER	TABLE	countries
	DROP CONSTRAINT	Countries_CK_AddressComponents
GO

ALTER	TABLE	countries
    DROP COLUMN level_4_address_component
GO

ALTER	TABLE	countries
	ADD CONSTRAINT	Countries_CK_AddressComponents
		CHECK	(   (	level_1_address_component IS NOT NULL
					AND	(	(	level_2_address_component IS NOT NULL	)
						OR 	(   level_2_address_component IS NULL
							AND level_3_address_component IS NULL
							)
						)
					)
					OR 	(   level_1_address_component IS NULL
						AND level_2_address_component IS NULL
						AND level_3_address_component IS NULL
					)
				)
GO

-- =============================================================================

DROP TRIGGER level_3_address_components_a_i_DML
GO

DROP TRIGGER level_3_address_components_b_u_DML
GO

-- =============================================================================
DROP VIEW v_level_4_address_components
GO

-- =============================================================================

DROP TABLE	level_4_address_components
GO
-- =============================================================================

DECLARE
	@entity_nm				gnc_nm

SET	@entity_nm	=	'CDB Level 3 Address Component';

DELETE	k
FROM	md_entities_references_pk_columns	k
	JOIN	md_entities_references	r
		ON	(	k.entity_reference_id	=	r.entity_reference_id
			AND	r.reference_db			=	'CDB'
			AND	r.reference_tbl			=	'level_4_address_components'
			)
	JOIN	md_entities	e
		ON	(	e.entity_id		=	r.entity_id
			AND	e.entity_nm		=	@entity_nm
			);

DELETE	r
FROM	md_entities_references	r
	JOIN	md_entities	e
		ON	(	e.entity_id			=	r.entity_id
			AND	e.entity_nm			=	@entity_nm
			AND	r.reference_db		=	'CDB'
			AND	r.reference_tbl		=	'level_4_address_components'
			);

SET	@entity_nm	=	'CDB Level 4 Address Component';

DELETE	k
FROM	md_entities_references_pk_columns	k
	JOIN	md_entities_references	r
		ON	(	k.entity_reference_id	=	r.entity_reference_id	)
	JOIN	md_entities	e
		ON	(	e.entity_id		=	r.entity_id
			AND	e.entity_nm		=	@entity_nm
			);

DELETE	r
FROM	md_entities_references	r
	JOIN	md_entities	e
		ON	(	e.entity_id		=	r.entity_id
			AND	e.entity_nm		=	@entity_nm
			);

DELETE	p
FROM	md_preceding_entities	p
	JOIN	md_entities	e
		ON	(	e.entity_id		=	p.entity_id
			AND	e.entity_nm		=	@entity_nm
			);

DELETE
FROM	md_entities
WHERE	entity_nm	=	@entity_nm;

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
