
--	====================================================================================================
--	Connect to MPB database
--		It is set initially to the audit_log_id of the row of the base address component
--	====================================================================================================


ALTER	TABLE	CDB.alternate_address_component_names
	ADD	audit_log_id	INTEGER;

