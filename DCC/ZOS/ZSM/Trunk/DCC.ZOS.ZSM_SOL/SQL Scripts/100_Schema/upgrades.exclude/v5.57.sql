/* ==================================================================================
    Source File		:	upgrade_v5.57.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	Sat, Oct 13, 2012
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.57
				....
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	Corrected RGB values in Colours table
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.57,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

UPDATE colours
SET	green_component = blue_component,
	blue_component = green_component

-- =============================================================================
