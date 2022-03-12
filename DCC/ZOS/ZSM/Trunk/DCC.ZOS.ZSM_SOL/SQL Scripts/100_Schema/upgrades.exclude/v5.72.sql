/* ==================================================================================
    Source File		:	upgrade_v5.72.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	11 Jan, 2014
    Last updated	:	11 Jan, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.72
			.... fixes in schema
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
	SET	version_no = 5.72,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


-- =============================================================================
-- Primary Key constraint for table sewas_satsang_centres was incorrectly named.
-- =============================================================================
ALTER	TABLE	sewas_satsang_centres
	DROP	CONSTRAINT	SewasSatsangCentres_FK_SatsangCentreID_PK_SewaID_SatsangCentreID;
GO

ALTER	TABLE	sewas_satsang_centres
	ADD	CONSTRAINT	SewasSatsangCentres_PK_SewaID_SatsangCentreID
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, satsang_centre_id	);
GO

-- =============================================================================
-- Primary Key constraint for table generic_attributes_satsang_centres was incorrectly named.
-- =============================================================================
ALTER	TABLE	generic_attributes_satsang_centres
	DROP	CONSTRAINT	GenericAttributesSatsangCentres_FK_SatsangCentreID_PK_GenericAttributeID_SatsangCentreID;
GO

ALTER	TABLE	generic_attributes_satsang_centres
	ADD	CONSTRAINT	GenericAttributesSatsangCentres_PK_GenericAttributeID_SatsangCentreID
			PRIMARY KEY	NONCLUSTERED	(	attribute_id, satsang_centre_id	);
GO

-- =============================================================================

