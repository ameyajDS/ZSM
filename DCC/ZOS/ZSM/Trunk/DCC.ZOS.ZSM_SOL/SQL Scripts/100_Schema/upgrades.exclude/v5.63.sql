/* ==================================================================================
    Source File		:	upgrade_v5.63.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	14 Feb, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.63
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
	SET	version_no = 5.63,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER TABLE sewadars_attributes
	ADD CONSTRAINT	SewadarsAttributes_FK_AttributeId_ListValue
			FOREIGN KEY	(	attribute_id, list_value	)
				REFERENCES	generic_attributes_list_values
GO
-- =============================================================================
