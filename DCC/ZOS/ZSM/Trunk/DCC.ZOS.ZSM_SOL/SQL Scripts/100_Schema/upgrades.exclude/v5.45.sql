/* ==================================================================================
    Source File		:	v5.45.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Jan 12 11:23 IST 2012
    Version			:	1.00
    Last updated	:	Jan 12, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.45
		*	Column are_outstation_sewadars_allowed has been added to table badge_templates.
		*	We should not be keeping transfer records for Open and Trainee Sewadars.
		*	The data integrity checks on Sewadars Particulars screen.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.45,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================

ALTER	TABLE	badge_templates
	ADD	are_outstation_sewadars_allowed	Boolean	NOT NULL	CONSTRAINT	BadgeTemplates_DF_AreOutstationSewadarsAllowed
																	DEFAULT	'Yes';
GO

UPDATE	badge_templates
	SET	are_outstation_sewadars_allowed	=	'No'
WHERE	badge_template_id	=	'ConstSB'

GO

-- =============================================================================

DELETE	tr
FROM	sewadars_transfers	tr
	JOIN	sewadars_registrations	rg
		ON	(	tr.satsang_centre_id	=	rg.satsang_centre_id
			AND	tr.sewadar_grno			=	rg.sewadar_grno
			AND	rg.sewadar_type		!=	'R'
			);

-- =============================================================================

SELECT	'Entry exists in sewadars_attributes for Boolean attributes with value as No', *
FROM	sewadars_attributes
WHERE	boolean_value	=	'No';

SELECT	'Entry exists in sewadars_particulars but not in sewadars_attributes', *
FROM	sewadars_particulars  p
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_attributes a
						WHERE	a.satsang_centre_id = p.satsang_centre_id	AND
								a.sewadar_grno		= p.sewadar_grno
					);

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
