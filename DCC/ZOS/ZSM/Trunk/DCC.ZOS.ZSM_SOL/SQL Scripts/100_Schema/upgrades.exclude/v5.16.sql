/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 07 11:29 IST 2011
    Version			:	1.00
    Last updated	:	Mar 08, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.16
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.16,			---- build / release 16453
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 08-Mar-2011			-- [
-- =============================================================================
DROP	TABLE	sewa_exemptions_applicable_sewas
GO

CREATE	TABLE	sewa_exemptions_applicable_sewas
(
	sewa_exemption_id	sewa_exemption_id	NOT NULL	CONSTRAINT	SewaExemptionApplicableSewas_FK_SewaExemptionID
															REFERENCEs	sewa_exemptions,

		--- LATER: Trigger ensures that the sewa.attendance_marking != Computed
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewaExemptionApplicableSewas_FK_SewaID
															REFERENCEs	sewas,

		--- LATER: Trigger ensures that the exemption_days are ONLY specified when sewa_exemptions.is_computed = Yes
		---		   The days specified here are used for giving these days of exemptions to respective sewadars.
	exemption_days		CreditCntF				NULL,

		CONSTRAINT	SewaExemptionApplicableSewas_PK_SewaExemptionID_SewaID
			PRIMARY KEY	NONCLUSTERED	(	sewa_exemption_id, sewa_id	)
)
GO



-- =============================================================================
--	Changes dated 08-Mar-2011			-- ]
-- =============================================================================

