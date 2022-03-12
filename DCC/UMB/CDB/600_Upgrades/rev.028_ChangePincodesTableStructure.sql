--alter table pincodes drop constraint Pincodes_CK_PinCodeL2L3
--alter table pincodes drop constraint Pincodes_FK_CountryID
alter table pincodes drop column country_id
alter table adt_pincodes drop column country_id

exec sp_addextendedproperty 'Pincodes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'pincodes'

alter table pincodes add constraint	Pincodes_UK_Level2Level3Pincode
			unique (pincode_number, level_2_component_id, level_3_component_id)

exec sp_addextendedproperty 'Pincodes_UK_Level2Level3Pincode', 'Level 2 + Level 3 Component + Pincode must be unique', 'USER', 'dbo', 'TABLE', 'pincodes'

update pincodes set level_2_component_id = null where level_3_component_id is not null

alter table pincodes add constraint Pincodes_CK_Level2Level3
			check (
							(level_2_component_id is not null and level_3_component_id is null) 
							or 
							(level_2_component_id is null and level_3_component_id is not null) 
					)

exec sp_addextendedproperty 'Pincodes_CK_Level2Level3', 'Either Level 2 or Level 3 Component should be entered', 'USER', 'dbo', 'TABLE', 'pincodes'

--select * from pincodes where level_3_component_id is null
--select * from v_level_3_address_components where level_2_address_component_id = 141
--select * from pincodes where pincode_number = '110005'
--update pincodes set level_3_component_id = 46736 where pincode_id = 1
--delete from pincodes where pincode_id in (630, 650)

update pincodes set effective_till_dt = getdate() where pincode_id in (629, 651, 635, 640, 644, 647, 687, 688, 704, 719)

