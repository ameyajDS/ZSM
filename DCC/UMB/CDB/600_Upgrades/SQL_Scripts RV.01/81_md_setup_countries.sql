/* =================================================================================================
	Author(s)     : Jitendra Loyal
	Started On    : Thu Nov 28 12:23 IST 2013
	Last updated  : Dec 09, 2013
	Module		  :	Meta-data (CDB)
 ===================================================================================================
                                                                                         Usage Notes
 ---------------------------------------------------------------------------------------------------
		Sets-up the meta-data for CDB..countries table
 ===================================================================================================
                                                                                    Revision History
 ---------------------------------------------------------------------------------------------------
 	JL : 09-Dec-2013
		* References of country_id in persons and persons_addresses tables added.
	JL : 28-Nov-2013
		* Initial Version
================================================================================================= */


DECLARE
	@entity_nm				gnc_nm,
	@entity_id				entity_id,
	@entity_reference_id	entity_reference_id;

SET	@entity_nm	=	'CDB Country';

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
		(	@entity_nm, 'CDB', 'countries', 'country_id', 'country_nm',
			'effective_from', 'effective_till', 'gmt_diff', 'GMT Difference'
		);
SET	@entity_id	=	SCOPE_IDENTITY();

-- ====================================================================================================
--	Entity References which actually get cleaned.
-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'CDB', 'states', 'country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'state_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'CDB', 'party_addresses', 'country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'party_address_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'CDB', 'level_1_address_components', 'country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'level_1_address_component_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons', 'id_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons', 'aadhar_no_or_ssn_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons', 'passport_issue_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons', 'driving_license_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons', 'mobile_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'persons_addresses', 'country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_address_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons', 'id_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons', 'aadhar_no_or_ssn_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons', 'passport_issue_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons', 'driving_license_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons', 'mobile_country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_id', 1	);

-- ====================================================================================================

INSERT INTO	md_entities_references
		(	entity_id, reference_db, reference_tbl, reference_column	)
	VALUES
		(	@entity_id, 'PDB', 'adt_persons_addresses', 'country_id'	);
SET	@entity_reference_id	=	SCOPE_IDENTITY();
		
INSERT INTO	md_entities_references_pk_columns
		(	entity_reference_id, pk_column_nm, pk_column_sq	)
	VALUES
		(	@entity_reference_id, 'person_address_id', 1	);

-- ====================================================================================================

EXEC	MD_ValidateEntity	@entity_id;

GO

-- vim:ts=4 sw=4 ht=4
