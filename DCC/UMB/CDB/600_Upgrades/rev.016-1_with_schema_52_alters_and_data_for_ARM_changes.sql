alter table level_1_address_components add frro_level1_nm varchar(50) null
update level_1_address_components set frro_level1_nm = level_1_address_component_nm
alter table level_1_address_components alter column frro_level1_nm varchar(50) not null

alter table level_2_address_components add frro_level2_nm varchar(50) null
update level_2_address_components set frro_level2_nm = level_2_address_component_nm
alter table level_2_address_components alter column frro_level2_nm varchar(50) not null

alter table level_3_address_components add frro_level3_nm varchar(50) null
update level_3_address_components set frro_level3_nm = level_3_address_component_nm
alter table level_3_address_components alter column frro_level3_nm varchar(50) not null


insert into master_satsangs (satsang_session_id, master_satsang_dt, is_cancelled, audit_log_id)
					 values (33,'2019-02-10',0,2),
							(33,'2019-02-17',0,2),
							(33,'2019-02-24',0,2),
							(34,'2019-03-17',0,2),
							(34,'2019-03-24',0,2),
							(34,'2019-03-31',0,2),
							(35,'2019-05-12',0,2),
							(35,'2019-05-19',0,2),
							(35,'2019-05-26',0,2),
							(36,'2019-06-23',0,2),
							(36,'2019-06-30',0,2),
							(37,'2019-09-01',0,2),
							(37,'2019-09-08',0,2),
							(37,'2019-09-15',0,2),
							(38,'2019-10-20',0,2),
							(38,'2019-10-27',0,2),
							(38,'2019-11-03',0,2),
							(39,'2019-12-08',0,2),
							(39,'2019-12-15',0,2),
							(39,'2019-12-22',0,2)
