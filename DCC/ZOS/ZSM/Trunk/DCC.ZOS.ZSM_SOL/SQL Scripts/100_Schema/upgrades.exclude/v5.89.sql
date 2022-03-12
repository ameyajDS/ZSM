/* ==================================================================================
    Source File		:	upgrade_v5.89.sql
    Author(s)		:	Jiten
    Started On		:	05 Mar, 2017
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
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
	SET	version_no = 5.89,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================

GRANT EXECUTE ON TYPE::FingerPrintData			TO	ZSM_CU, ZSM_PC, ZSM_ADM, ZSM_SUP, ZSM_ATM, ZSM_RDR, ZSM_USR
GRANT EXECUTE ON TYPE::GRNoList					TO	ZSM_CU, ZSM_PC, ZSM_ADM, ZSM_SUP, ZSM_ATM, ZSM_RDR, ZSM_USR
GRANT EXECUTE ON TYPE::SewadarRegistrationType	TO	ZSM_CU, ZSM_PC, ZSM_ADM, ZSM_SUP, ZSM_ATM, ZSM_RDR, ZSM_USR

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
