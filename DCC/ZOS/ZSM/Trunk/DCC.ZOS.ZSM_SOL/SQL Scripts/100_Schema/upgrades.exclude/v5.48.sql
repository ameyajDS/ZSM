/* ==================================================================================
    Source File		:	upgrade_v5.48.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Feb 23 2012
    Last updated	:	Feb 23, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.48
			..... Table manually_exported_sewadars added.
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
	SET	version_no = 5.48,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'


-- =============================================================================

USE ZSM
GO


-- =============================================================================
CREATE	TABLE	manually_exported_sewadars
(
	exported_to_centre_id 	satsang_centre_id	NOT NULL	CONSTRAINT	ManuallyExported_FK_ExportedToCentreID
																REFERENCES	satsang_centres_details,

	sewadar_id				sewadar_id			NOT NULL	CONSTRAINT	ManuallyExported_FK_SewadarID
																REFERENCES	sewadars,

	satsang_centre_id 		satsang_centre_id		NOT NULL,
	sewadar_grno			sewadar_grno			NOT NULL,
	
		CONSTRAINT	ManuallyExported_PK_ExportedToCentreID_SewadarGRNo_SewaID
			PRIMARY KEY	NONCLUSTERED	(	exported_to_centre_id, sewadar_id	),

		CONSTRAINT	ManuallyExported_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
