	---	No front-end for this table
	--	Objective is to allow only the permissible rates for IGST, CGST, etc in the front-end; in that sense it is a configuration table

CREATE	TABLE	gst_permissible_tax_rates
(
		--	Current Values are IGST, CGST, SGST, Cess
	tax_type	VARCHAR (20)		NOT	NULL,
	tax_rate	DECIMAL (10, 6)		NOT	NULL	CONSTRAINT	PermissibleTaxRates_CK_TaxRate
													CHECK	(	tax_rate	>	0	),
	tax_seq		INTEGER				NOT	NULL,

		CONSTRAINT	PermissibleTaxRates_UK_TaxType_TaxRate
			UNIQUE	(	tax_type, tax_rate	)
);


CREATE	TABLE	gst_rates
(
	gst_rate_id				INTEGER			NOT	NULL	IDENTITY (1, 1)
														CONSTRAINT	GSTRates_PK_GSTRateID
															PRIMARY	KEY,
 	hsn_cd					VARCHAR (8)		NOT	NULL,	CONSTRAINT	GSTRates_CK_HSNCode
															CHECK	(	LEN (hsn_cd) IN ( 4, 6, 8 ) ),
	igst_rate				DECIMAL (10, 6)	NOT	NULL	CONSTRAINT	GSTRates_CK_IGSTRate
															CHECK	(	igst_rate	>	0	),
	cgst_rate				DECIMAL (10, 6)	NOT	NULL	CONSTRAINT	GSTRates_CK_CGSTRate
															CHECK	(	cgst_rate	>	0	),
	sgst_rate				DECIMAL (10, 6)	NOT	NULL	CONSTRAINT	GSTRates_CK_SGSTRate
															CHECK	(	sgst_rate	>	0	),
	cess_rate				DECIMAL (10, 6)		NULL	CONSTRAINT	GSTRates_CK_CessRate
															CHECK	(	cess_rate	>	0	),

		--	LATER. Trigger ensures that the effective periods are NOT overlapping for an HSN Code
	effective_from_dt		DATE			NOT NULL,

	effective_till_dt		DATE			NOT NULL,

	txn_ts					TIMESTAMP		NOT NULL,
	audit_log_id			INTEGER			NOT	NULL	CONSTRAINT	GSTRates_FK_AuditLogID
															REFERENCES	audit_logs,

		CONSTRAINT	GSTRates_UK_HSNCode_IGST_EffectiveFromDate
			UNIQUE	(	hsn_cd, igst_rate, effective_from_dt	),

		CONSTRAINT	GSTRates_CK_IGST_CGST_SGST
			CHECK	(	igst_rate	=	cgst_rate * 2
					AND	sgst_rate	=	cgst_rate
					),

		CONSTRAINT	GSTRates_CK_EffectiveFromDate_EffectiveTillDate
			CHECK	(	effective_from_dt	<=	effective_till_dt	)
);


INSERT	INTO	gst_permissible_tax_rates	VALUES
				(	'IGST',	5,	1	),
				(	'IGST',	12,	2	),
				(	'IGST',	18,	3	),
				(	'IGST',	28,	4	),

				(	'CGST',	2.5,	1	),
				(	'CGST',	6,		2	),
				(	'CGST',	9,		3	),
				(	'CGST',	14,		4	),

				(	'SGST',	2.5,	1	),
				(	'SGST',	6,		2	),
				(	'SGST',	9,		3	),
				(	'SGST',	14,		4	),

				(	'Cess',	12,		1	);
GO

DECLARE
	@a	INT;

INSERT INTO audit_logs
		(	session_id, application_id, user_no, user_role_id, operation, screen_id, object_id, operation_dts, is_consumed	)
	VALUES
		(	0, 'SETUP', 1, 'System', 'I', 'SETUP', 'GST Rates', GETDATE(), 0	);
	SET @a = SCOPE_IDENTITY();
	
INSERT INTO	gst_rates
		(	hsn_cd, igst_rate, cgst_rate, sgst_rate, cess_rate, effective_from_dt, effective_till_dt, audit_log_id	)
	SELECT	hsn_code, MAX (igst), MAX (cgst), MAX (sgst), MAX (gst_cess), effective_from_dt, effective_till_dt
	, @a
	FROM	CDB..hsn_gst_rates	x
	WHERE	GETDATE()		BETWEEN	x.effective_from_dt	AND	x.effective_till_dt
	AND		LEN (hsn_code)	IN (4,6,8)
	AND		igst			>	0
	GROUP BY	x.hsn_code, x.effective_from_dt, x.effective_till_dt;
GO
