
ALTER	TABLE	address_types
	ADD	is_applicable_for_pdb_person	BIT;

ALTER	TABLE	address_types
    ADD	is_multiple_allowed				BIT;
GO


UPDATE	address_types
	SET	is_applicable_for_pdb_person	=	1
WHERE	address_type_cd	IN	(	'P', 'C'	);

UPDATE	address_types
	SET	is_applicable_for_pdb_person	=	0
WHERE	is_applicable_for_pdb_person	IS	NULL;
GO


UPDATE	address_types
	SET	is_multiple_allowed	=	1
WHERE	address_type_cd	IN	(	'C', '6', '2', '1', '5', '8'	);

UPDATE	address_types
	SET	is_multiple_allowed	=	0
WHERE	is_multiple_allowed	IS	NULL;
GO


ALTER	TABLE	address_types
	ALTER COLUMN	is_applicable_for_pdb_person	BIT			NOT NULL;

ALTER	TABLE	address_types
    ALTER COLUMN	is_multiple_allowed				BIT			NOT NULL;
GO