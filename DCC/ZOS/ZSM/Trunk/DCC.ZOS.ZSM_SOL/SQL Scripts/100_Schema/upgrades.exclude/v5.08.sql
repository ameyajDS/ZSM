/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Feb 27 13:12 IST 2011
    Version			:	1.00
    Last updated	:	Feb 27, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.08 (current version is v5.07)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.08,			---- build / release 16267
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 03-Mar-2011			-- [
-- =============================================================================

EXEC	SysAdmin..DropAllTriggers	'ZSM';
GO

UPDATE	sewadars_registrations
	SET	appointment_dt	=	CAST (FLOOR (CAST (appointment_dt AS FLOAT)) AS DATETIME)
WHERE	CAST (appointment_dt AS FLOAT)	>	CAST (CAST (FLOOR (CAST (appointment_dt AS FLOAT)) AS DATETIME) AS FLOAT);

UPDATE	sewadars_registrations
	SET	department_dt	=	CAST (FLOOR (CAST (department_dt AS FLOAT)) AS DATETIME)
WHERE	CAST (department_dt AS FLOAT)	>	CAST (CAST (FLOOR (CAST (department_dt AS FLOAT)) AS DATETIME) AS FLOAT);

DELETE
FROM	sewadars_transfers
WHERE	satsang_centre_id	=	6015
AND		sewadar_grno		=	'L02832'
AND		effective_dt		=	'23 Nov 2002';

IF (@@ROWCOUNT = 1)
	UPDATE	sewadars_transfers
		SET	old_department_id		=	129,
			old_sub_department_id	=	53
	WHERE	satsang_centre_id	=	6015
	AND		sewadar_grno		=	'L02832'
	AND		effective_dt		=	'23 Nov 2002 18:15';

UPDATE	sewadars_transfers
	SET	effective_dt	=	CAST (FLOOR (CAST (effective_dt AS FLOAT)) AS DATETIME)
WHERE	CAST (effective_dt AS FLOAT)	>	CAST (CAST (FLOOR (CAST (effective_dt AS FLOAT)) AS DATETIME) AS FLOAT);

GO

-- =============================================================================
--	Changes dated 03-Mar-2011			-- ]
-- =============================================================================

