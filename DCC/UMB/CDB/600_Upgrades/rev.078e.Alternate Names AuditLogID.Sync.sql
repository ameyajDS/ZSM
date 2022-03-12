
--	====================================================================================================
--	Column audit_log_id added to table alternate_address_component_names
--	====================================================================================================

ALTER	TABLE	alternate_address_component_names	ENABLE	TRIGGER	trg_sync_alternate_address_component_names_i;
ALTER	TABLE	alternate_address_component_names	ENABLE	TRIGGER	trg_sync_alternate_address_component_names_u;
ALTER	TABLE	alternate_address_component_names	ENABLE	TRIGGER	trg_sync_alternate_address_component_names_d;

INSERT	INTO	MPB..bridge_sync_records
		(	database_nm, table_nm, operation_type, operation_dtm	)
	VALUES
		(	'CDB', 'alternate_address_component_names',	'S', GetDate()	);


