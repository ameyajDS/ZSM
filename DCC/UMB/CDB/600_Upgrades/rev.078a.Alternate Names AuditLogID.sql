
--	====================================================================================================
--	Column audit_log_id added to table alternate_address_component_names
--		It is set initially to the audit_log_id of the row of the base address component
--	====================================================================================================

ALTER	TABLE	alternate_address_component_names	DISABLE	TRIGGER	trg_sync_alternate_address_component_names_i;
ALTER	TABLE	alternate_address_component_names	DISABLE	TRIGGER	trg_sync_alternate_address_component_names_u;
ALTER	TABLE	alternate_address_component_names	DISABLE	TRIGGER	trg_sync_alternate_address_component_names_d;

ALTER	TABLE	alternate_address_component_names
	ADD	audit_log_id	INTEGER
		CONSTRAINT	AlternateAddressComponentNames_FK_AuditLogID
			REFERENCES	audit_logs;
GO

UPDATE	a
	SET	audit_log_id	=	t.audit_log_id
FROM	alternate_address_component_names	a
	JOIN	countries	t
		ON	(	t.country_id	=	a.country_id	);

UPDATE	a
	SET	audit_log_id	=	t.audit_log_id
FROM	alternate_address_component_names	a
	JOIN	level_1_address_components	t
		ON	(	t.level_1_address_component_id	=	a.level_1_address_component_id	);

UPDATE	a
	SET	audit_log_id	=	t.audit_log_id
FROM	alternate_address_component_names	a
	JOIN	level_2_address_components	t
		ON	(	t.level_2_address_component_id	=	a.level_2_address_component_id	);

UPDATE	a
	SET	audit_log_id	=	t.audit_log_id
FROM	alternate_address_component_names	a
	JOIN	level_3_address_components	t
		ON	(	t.level_3_address_component_id	=	a.level_3_address_component_id	);


ALTER	TABLE	alternate_address_component_names
	ALTER	COLUMN	audit_log_id	INTEGER	NOT	NULL;
GO

--	====================================================================================================

create table adt_alternate_address_component_names
(
	id										int						identity(1,1) constraint	AdtAlternateAddressComponentName_PK_Id primary key,
	alternate_address_component_id							address_component_id,
	country_id												country_id,
	level_1_address_component_id							address_component_id,
	level_2_address_component_id							address_component_id,
	level_3_address_component_id							address_component_id,
	alternate_address_component_nm							nvarchar(200),
	alternate_address_component_sq							smallint,
	audit_log_id											int constraint	AdtAlternateAddressComponentName_FK_AuditLogId references	audit_logs,
)
GO

--	====================================================================================================

