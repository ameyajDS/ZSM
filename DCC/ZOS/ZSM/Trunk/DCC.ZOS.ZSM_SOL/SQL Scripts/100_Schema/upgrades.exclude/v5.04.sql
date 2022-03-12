/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Feb 12 17:56 IST 2011
    Version			:	1.00
    Last updated	:	Feb 12, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.04 (current version is v5.03)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = '5.04',
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
-- =============================================================================
--	Changes dated 10-Feb-2011			-- [
-- =============================================================================
USE ZSM
Go

ALTER	TABLE	badge_templates
	ADD	is_expiry_year_check		Boolean				NOT NULL	CONSTRAINT	BadgeTemplates_DF_IsExpiryYearCheck
																	DEFAULT	'Yes';

GO

UPDATE	badge_templates
	SET	is_expiry_year_check	=	'No'
WHERE	badge_template_id	=	'Retired';

GO

-- =============================================================================
--	Changes dated 10-Feb-2011			-- ]
-- =============================================================================
