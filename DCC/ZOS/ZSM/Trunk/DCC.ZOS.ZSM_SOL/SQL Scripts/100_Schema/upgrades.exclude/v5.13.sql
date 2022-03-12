/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 06 12:33 IST 2011
    Version			:	1.00
    Last updated	:	Mar 06, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.13 (current version is v5.12)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.13,			---- build / release 16428
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 03-Mar-2011			-- [
-- =============================================================================

UPDATE	badge_templates
	SET	middle_line_part_2_text	=	'March 2011'
WHERE	badge_template_id	=	'SpecialZon';


-- =============================================================================
--	Changes dated 03-Mar-2011			-- ]
-- =============================================================================

