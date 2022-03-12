
alter table pincodes drop constraint Pincodes_CK_PinCodeL2L3

alter table pincodes alter column	pincode_number	nvarchar (11)	not null

alter table pincodes add constraint Pincodes_CK_PinCodeL2L3
			unique (pincode_number, level_2_component_id, level_3_component_id)

alter table adt_pincodes alter column pincode_number	nvarchar (11)	
