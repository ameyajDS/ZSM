/* ==================================================================================
    Source File		:	upgrade_v5.61.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	22 Jan, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.61
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
	SET	version_no = 5.61,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER TABLE credit_specifications
	ADD	credit_group_nm				gnc_nm		NULL;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'credit_specifications_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER credit_specifications_a_iu_DML
GO
	

ALTER TABLE adt_credit_specifications
	ADD	presence_sewa_id	sewa_id		NULL;
GO

ALTER TABLE adt_credit_specifications
	ADD	credit_group_nm				gnc_nm		NULL;
GO

ALTER TABLE adt_credit_specifications
	ADD	last_appointment_dt			SMALLDATETIME		NULL;
GO

UPDATE	adt_credit_specifications
	SET		last_appointment_dt	=	credit_specification_dt - 50;
GO

ALTER	TABLE	adt_credit_specifications
	ALTER COLUMN	last_appointment_dt		SMALLDATETIME		NOT	NULL;
GO

ALTER	TABLE	adt_badge_templates
	ADD	is_expiry_year_check		Boolean				NULL;
GO

UPDATE	adt_badge_templates
	SET	is_expiry_year_check	=	'No'
WHERE	badge_template_id	=	'Retired';

UPDATE	adt_badge_templates
	SET	is_expiry_year_check	=	'Yes'
WHERE	badge_template_id	!=	'Retired';

ALTER	TABLE	adt_badge_templates
	ALTER COLUMN	is_expiry_year_check		Boolean		NOT NULL;
GO

ALTER	TABLE	adt_badge_templates
	ADD	are_outstation_sewadars_allowed	Boolean	NULL;
GO

UPDATE	adt_badge_templates
	SET	are_outstation_sewadars_allowed	=	'No'
WHERE	badge_template_id	=	'ConstSB'

UPDATE	adt_badge_templates
	SET	are_outstation_sewadars_allowed	=	'Yes'
WHERE	badge_template_id	!=	'ConstSB'
GO

ALTER	TABLE	adt_badge_templates
	ALTER COLUMN	are_outstation_sewadars_allowed	Boolean	NOT NULL;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemption_applicable_sewas' AND xtype = 'U')
	DROP TABLE	adt_sewa_exemption_applicable_sewas;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	ALTER	TABLE	adt_sewa_exemptions_applicable_sewas
		ADD tmp_column		CreditCntF			NULL;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	UPDATE	adt_sewa_exemptions_applicable_sewas
		SET	tmp_column	=	exemption_days;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	ALTER	TABLE	adt_sewa_exemptions_applicable_sewas
		DROP COLUMN exemption_days;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	ALTER	TABLE	adt_sewa_exemptions_applicable_sewas
		ADD	exemption_days		CreditCntF				NULL;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	UPDATE	adt_sewa_exemptions_applicable_sewas
		SET	exemption_days	=	tmp_column;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
	ALTER	TABLE	adt_sewa_exemptions_applicable_sewas
		DROP COLUMN tmp_column;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'adt_sewa_exemptions_applicable_sewas' AND xtype = 'U')
CREATE	TABLE	adt_sewa_exemptions_applicable_sewas
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtSewaExemptionsApplicableSewas_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_exemption_id	sewa_exemption_id	NOT NULL,
	sewa_id				sewa_id				NOT NULL,
	exemption_days		CreditCntF				NULL,

		CONSTRAINT	AdtSewaExemptionsApplicableSewas_PK_AuditLogId_SewaExemptionId_SewaId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_exemption_id, sewa_id	)
)
GO


-- =============================================================================
