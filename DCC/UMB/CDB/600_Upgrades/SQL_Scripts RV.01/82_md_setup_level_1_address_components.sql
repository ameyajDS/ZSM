/* =================================================================================================
	Author(s)     : Jitendra Loyal
	Started On    : Thu Nov 28 15:28 IST 2013
	Last updated  : Dec 09, 2013
	Module		  :	Meta-data (CDB)
	Reviewed By   : 
	Reviewed On   : 
 ===================================================================================================
                                                                                         Usage Notes
 ---------------------------------------------------------------------------------------------------
		Sets-up the meta-data for CDB..level_1_address_components table
 ===================================================================================================
                                                                                    Revision History
 ---------------------------------------------------------------------------------------------------
 	JL : 09-Dec-2013
		* Reference in persons_addresses table added.
	JL : 28-Nov-2013
		* Initial Version
================================================================================================= */


DECLARE
	@entity_nm				gnc_nm,
	@entity_id				entity_id,
	@entity_reference_id	entity_reference_id;

SET	@entity_nm	=	'CDB Level 1 Address Component';

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


INSERT INTO	md_entities
		(	entity_nm, entity_db, entity_tbl, entity_id_column, entity_nm_column,
			effective_from_dt_column, effective_till_dt_column, additional_info_column, additional_info_label
		)
	VALUES
		(	@entity_nm, 'CDB', 'level_1_address_components', 'level_1_address_component_id', 'level_1_address_component_nm',
			'effective_from', 'effective_till', 'is_authentic', 'Is Authentic'
		);
SET	@entity_id	=	SCOPE_IDENTITY();

-- ====================================================================================================
--	Entity References which actually get cleaned.
-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'CDB', 'level_2_address_components', 'level_1_address_component_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'level_2_address_component_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons_addresses', 'level_1_address_component_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_address_id', 1	);

-- ====================================================================================================
--	Preceding Entity References
-- ====================================================================================================

INSERT INTO	md_preceding_entities
		(	entity_id, entity_id_column, display_order, preceding_entity_nm,
			preceding_entity_db, preceding_entity_tbl, preceding_entity_id_column, preceding_entity_nm_column
		)
	VALUES
		(	@entity_id, 'country_id', 1, 'Country',
			'CDB', 'countries', 'country_id', 'country_nm'
		);

-- ====================================================================================================

EXEC	MD_ValidateEntity	@entity_id;

GO

-- vim:ts=4 sw=4 ht=4
