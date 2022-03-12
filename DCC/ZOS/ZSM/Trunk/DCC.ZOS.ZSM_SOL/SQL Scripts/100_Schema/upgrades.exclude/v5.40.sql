/* ==================================================================================
    Source File		:	upgrade_v5.40.sql.exclude
    Author(s)		:	Ameya Jadhav
    Started On		:	Tue Dec 14 19:11 IST 2011
    Last updated	:	Dec 17, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.40
			..... Drop adt_sewadars_photos and adt_sewadars_photos from ZSM db
			..... These have been migrated to ZSM_Photos db in v5.36
		IMPORTANT.
			1. Uncomment these steps after confirming the Photo migration to ZSM_Photos
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
	SET	version_no = 5.40,				---- Revision 18596 released to Live
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM
GO

DROP TABLE sewadars_photos
GO

DROP TABLE adt_sewadars_photos
GO

-- vim:sw=4 ht=4 ai ts=4
