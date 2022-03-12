/* ==================================================================================
    Source File		:	upgrade_v5.51.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Apr 17, 2012
    Last updated	:	Apr 21, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.51
			..... Remark Type "Old G.R.No." added.
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
	SET	version_no = 5.51,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================

INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Old G.R.No.',	6	);			--- It is used for Old G.R.No. that existed before migrating the data

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
