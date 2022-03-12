BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev083', 'FRRO NULLable-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();
--	==================================================

ALTER	TABLE	level_1_address_components
	ALTER	COLUMN	frro_level1_nm	VARCHAR (50)	NULL;

ALTER	TABLE	level_2_address_components
	ALTER	COLUMN	frro_level2_nm	VARCHAR (50)	NULL;

ALTER	TABLE	level_3_address_components
	ALTER	COLUMN	frro_level3_nm	VARCHAR (50)	NULL;

--	==================================================

ALTER	TABLE	countries					DISABLE	TRIGGER	trg_sync_countries_u;
ALTER	TABLE	level_1_address_components	DISABLE	TRIGGER	trg_sync_level_1_address_components_u;
ALTER	TABLE	level_2_address_components	DISABLE	TRIGGER	trg_sync_level_2_address_components_u;
ALTER	TABLE	level_3_address_components	DISABLE	TRIGGER	trg_sync_level_3_address_components_u;

--	==================================================
--	Surkhet
--	==================================================

UPDATE	level_2_address_components
	SET	frro_level2_nm	=	NULL,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	=	51351
AND		frro_level2_nm	=	'Surkhet'
AND		GetDate()	NOT	BETWEEN	effective_from	AND	effective_till;

--	==================================================

UPDATE	countries
	SET	frro_country_nm	=	NULL,
		audit_log_id	=	@al
WHERE	country_nm	=	frro_country_nm;

--	==================================================

UPDATE	level_1_address_components
	SET	frro_level1_nm	=	NULL,
		audit_log_id	=	@al
WHERE	level_1_address_component_nm	=	frro_level1_nm;

--	==================================================

UPDATE	level_2_address_components
	SET	frro_level2_nm	=	NULL,
		audit_log_id	=	@al
WHERE	level_2_address_component_nm	=	frro_level2_nm;

--	==================================================

UPDATE	level_3_address_components
	SET	frro_level3_nm	=	NULL,
		audit_log_id	=	@al
WHERE	level_3_address_component_nm	=	frro_level3_nm;

--	==================================================

ALTER	TABLE	countries
	ADD	CONSTRAINT	Countries_CK_CountryName_FRROCountryName
				CHECK	(	country_nm	!=	frro_country_nm	)
GO


ALTER	TABLE	level_1_address_components
	ADD	CONSTRAINT	Level1AddressComponents_CK_Level1AddressComponentName_FRRO_Level1_Name
				CHECK	(	level_1_address_component_nm	!=	frro_level1_nm	);
GO


ALTER	TABLE	level_2_address_components
	ADD	CONSTRAINT	Level2AddressComponents_CK_Level2AddressComponentName_FRRO_Level2_Name
				CHECK	(	level_2_address_component_nm	!=	frro_level2_nm	);
GO


ALTER	TABLE	level_3_address_components
	ADD	CONSTRAINT	Level3AddressComponents_CK_Level3AddressComponentName_FRRO_Level3_Name
				CHECK	(	level_3_address_component_nm	!=	frro_level3_nm	);
GO

--	==================================================

ALTER	TABLE	countries					ENABLE	TRIGGER	trg_sync_countries_u;
ALTER	TABLE	level_1_address_components	ENABLE	TRIGGER	trg_sync_level_1_address_components_u;
ALTER	TABLE	level_2_address_components	ENABLE	TRIGGER	trg_sync_level_2_address_components_u;
ALTER	TABLE	level_3_address_components	ENABLE	TRIGGER	trg_sync_level_3_address_components_u;

--	==================================================

INSERT	INTO	MPB..bridge_sync_records
		(	database_nm, table_nm, operation_type, operation_dtm	)
	VALUES
		(	'CDB', 'countries',						'S', GetDate()	),
		(	'CDB', 'level_1_address_components',	'S', GetDate()	),
		(	'CDB', 'level_2_address_components',	'S', GetDate()	),
		(	'CDB', 'level_3_address_components',	'S', GetDate()	);

--	==================================================

