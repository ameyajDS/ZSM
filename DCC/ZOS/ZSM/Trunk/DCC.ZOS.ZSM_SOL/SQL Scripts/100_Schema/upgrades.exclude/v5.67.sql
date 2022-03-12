/* ==================================================================================
    Source File		:	upgrade_v5.67.sql
    Author(s)		:	Manish Saluja / Jiten Loyal
    Started On		:	11 Apr, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.67
				....
		
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
	SET	version_no = 5.67,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

CREATE	TABLE	_sample_images
(
	sample_id		gnc_short_nm	NOT NULL		CONSTRAINT	_SampleImages_PK_SampleId
														PRIMARY KEY	NONCLUSTERED,
	sample_image	IMAGE			NOT NULL
)

GO
-- =============================================================================
