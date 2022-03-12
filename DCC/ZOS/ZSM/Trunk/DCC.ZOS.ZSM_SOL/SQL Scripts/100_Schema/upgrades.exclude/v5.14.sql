/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 07 11:29 IST 2011
    Version			:	1.00
    Last updated	:	Mar 07, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.14 (current version is v5.13)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.14,			---- build / release 164??
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 07-Mar-2011			-- [
-- =============================================================================

UPDATE	badge_templates
	SET	top_line_font_size			=	10,
		top_line_part_1_type		=	'Text',
		top_line_part_1_text		=	'RSSB',
		top_line_parts_separator	=	'-',
		top_line_part_2_type		=	'Satsang Centre',
		top_line_part_2_text		=	NULL,

		middle_line_font_size		=	9,
		middle_line_part_1_type		=	'Department',
		middle_line_part_1_text		=	NULL,
		middle_line_parts_separator	=	'()',
		middle_line_part_2_type		=	'Sub-Department',
		middle_line_part_2_text		=	NULL

WHERE	badge_template_id	=	'ConstSB';

-- =============================================================================
--	Changes dated 07-Mar-2011			-- ]
-- =============================================================================

