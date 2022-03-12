


ALTER	TABLE	working_units
    ADD	working_unit_short_cd	VARCHAR (10)		NULL
GO

-- =============================================================================
---	Trigger ensures that working_unit_short_cd is unique within a society
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE  xtype = 'TR' AND name = 'working_units_a_iu')
	DROP TRIGGER working_units_a_iu
GO

CREATE TRIGGER working_units_a_iu ON working_units
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						JOIN	working_units	w
							ON	(	i.working_unit_short_cd	=	w.working_unit_short_cd
								AND	i.society_id			=	w.society_id
								)
					WHERE	i.working_unit_short_cd	IS	NOT	NULL
					GROUP BY	i.working_unit_short_cd, i.society_id
						HAVING COUNT (*) > 1
				)
		BEGIN
			RAISERROR ('Working Unit Short Code should be unique within a Society (Trigger working_units_a_iu)', 16, 1);
			ROLLBACK
			RETURN
		END
END
GO


-- =============================================================================
/*		This data is being set only for development
UPDATE	working_units
    SET	working_unit_short_cd	=	working_unit_cd,
	audit_log_id = 2
WHERE	GETDATE() between effective_from and effective_till
AND	society_id =1
AND	working_unit_cd NOT IN ('DERA', 'TS');
*/


-- =============================================================================
--	Table document_types
-- =============================================================================
ALTER	TABLE	document_types
    ADD	are_multiple_allowed	BIT	NULL
GO

ALTER	TABLE	document_types
    ALTER COLUMN	document_type_nm	VARCHAR (25)
GO

UPDATE	document_types
    SET	are_multiple_allowed = 1;

UPDATE	document_types
    SET	are_multiple_allowed = 0
WHERE	document_type_nm	IN	(	'Aadhaar Card', 'IT PAN Card'	);

ALTER	TABLE	document_types
    ALTER	COLUMN	are_multiple_allowed	BIT	NOT	NULL
GO

INSERT INTO	document_types	
		(	document_type_nm, are_multiple_allowed	)
		VALUES	(	'Birth Certificate',		0	),
			(	'Marriage Certificate',		1	),
			(	'Death Certificate',		0	),
			(	'Rent Agreement',		0	),
			(	'Affidavit',			1	);
GO

-- =============================================================================