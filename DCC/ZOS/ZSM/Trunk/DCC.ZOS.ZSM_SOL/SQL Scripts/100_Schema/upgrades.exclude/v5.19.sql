/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 09 11:48 IST 2011
    Version			:	1.00
    Last updated	:	Mar 09, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.19
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.19,			---- build / release 164??
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 09-Mar-2011			-- [
-- =============================================================================
ALTER	TABLE	credit_specifications
	ADD		last_appointment_dt			SMALLDATETIME				NULL;
GO

UPDATE	credit_specifications
	SET		last_appointment_dt	=	credit_specification_dt - 50;
GO

ALTER	TABLE	credit_specifications
	ALTER COLUMN	last_appointment_dt		SMALLDATETIME		NOT	NULL;
GO

-- =============================================================================
--	Changes dated 08-Mar-2011			-- ]
-- =============================================================================

