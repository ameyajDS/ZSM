/* ==================================================================================
    Source File		:	upgrade_v5.66.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	17 Mar, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.66
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
	SET	version_no = 5.66,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Aadhaar UID'	,	9	);

GO
-- =============================================================================
