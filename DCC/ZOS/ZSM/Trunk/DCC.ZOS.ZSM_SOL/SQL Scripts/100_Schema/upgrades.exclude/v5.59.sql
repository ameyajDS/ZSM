/* ==================================================================================
    Source File		:	upgrade_v5.59.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	01 Jan, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.59
				....
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		Updating Mobile Phone Report to support Sewadar List
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.59,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER TABLE credit_specifications
	ADD	presence_sewa_id	sewa_id		NULL;
GO
	
ALTER TABLE credit_specifications
	ADD	CONSTRAINT	CreditSpecifications_FK_PresenceSewaID
		FOREIGN KEY	(	presence_sewa_id	)
			REFERENCES	sewas;
GO

ALTER TABLE credit_specifications
	ADD	CONSTRAINT	CreditSpecifications_CK_IsExemptionAllowed_PresenceSewaID
			CHECK	(	(	is_exemption_considered	=	'Yes'	)
					OR	(	is_exemption_considered	=	'No'	AND	presence_sewa_id	IS NULL	)
					);
GO

-- =============================================================================
