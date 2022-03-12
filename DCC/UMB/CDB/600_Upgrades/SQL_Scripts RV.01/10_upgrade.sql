/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Nov 27 21:18 IST 2013
    Last updated	:	Nov 27, 2013
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade CDB to Revision.01
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

-- =============================================================================
--	Table post_offices
-- =============================================================================
ALTER	TABLE	post_offices 
	ALTER COLUMN	pin_or_zip_code		pin_or_zip_code		NULL;
GO

-- =============================================================================
--	Table countries
-- =============================================================================

ALTER	TABLE	countries
	DROP COLUMN	old_code;			--- This is insignificant now
GO

--	Column is_authentic is added along with a default constraint.
-- =============================================================================

ALTER	TABLE	countries
    ADD	is_authentic		BIT			NULL;
GO

ALTER	TABLE	countries
	ADD	CONSTRAINT	Countries_DF_IsAuthentic
		DEFAULT	0
			FOR is_authentic;
GO

UPDATE	countries
	SET	is_authentic	=	0;
GO

ALTER	TABLE	countries
    ALTER COLUMN	is_authentic	BIT		NOT NULL;
GO

--	Columns for names of address components have been added
-- =============================================================================

EXEC	sp_addtype	'address_component_nm',	'VARCHAR (40)',	'NULL'
GO

ALTER	TABLE	countries
    ADD level_1_address_component	address_component_nm	    NULL
GO

ALTER	TABLE	countries
    ADD level_2_address_component	address_component_nm	    NULL
GO

ALTER	TABLE	countries
    ADD level_3_address_component	address_component_nm	    NULL
GO

ALTER	TABLE	countries
    ADD level_4_address_component	address_component_nm	    NULL
GO

ALTER	TABLE	countries
	ADD CONSTRAINT	Countries_CK_AddressComponents
		CHECK	(   (	level_1_address_component IS NOT NULL
					AND	(	level_2_address_component IS NOT NULL
						AND	(   (	level_3_address_component IS NOT NULL	)
							OR  (   level_3_address_component IS NULL	AND	level_4_address_component IS NULL )
							)
						)
					OR 	(   level_2_address_component IS NULL
						AND level_3_address_component IS NULL
						AND level_4_address_component IS NULL
						)
			    )
			    OR 	(   level_1_address_component IS NULL
				AND level_2_address_component IS NULL
				AND level_3_address_component IS NULL
				AND level_4_address_component IS NULL
			    )
			)
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
