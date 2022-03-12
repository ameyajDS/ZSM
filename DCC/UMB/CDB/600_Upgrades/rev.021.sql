--- BEFORE YOU DO THIS --- do all steps from the Pincodes Import-25Feb2020 sub folder 

alter table pincodes add country_id					smallint		 null	constraint Pincodes_FK_CountryID
																references countries

update pincodes set country_id = 1

alter table pincodes alter column country_id		smallint		not null	

alter table pincodes add constraint	Pincodes_UK_PinCodeCountry
			unique (pincode_number, country_id)

alter table adt_pincodes add country_id				smallint		 null	

delete from pincodes

insert into pincodes (pincode_number, country_id, level_2_component_id, level_3_component_id, effective_from_dt, effective_till_dt, audit_log_id)
		select distinct  pincode,			1,			level2_id,				level3_id,			'26 feb 2020',	 '31 dec 9999', 2 from poimport order by level2_id, level3_id

--28519 records added 

