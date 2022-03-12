select * from professions
/*
insert into professions(profession_cd, profession_nm, effective_from_dt, effective_till_dt, audit_log_id)
				values ('MEDICAL', 'Medical', getdate(), '31 dec 9999', 2),
					   ('TEACHING', 'Teaching', getdate(), '31 dec 9999', 2),
					   ('AGRICULTURE', 'Agriculture', getdate(), '31 dec 9999',2),
					   ('CARPENTARY', 'Carpentary', getdate(), '31 dec 9999', 2),
					   ('IT_SERVICES', 'IT Services', getdate(), '31 dec 9999', 2),
					   ('ENGINEERING', 'Engineering', getdate(), '31 dec 9999', 2),
					   ('BUSINESS', 'Business', getdate(), '31 dec 9999', 2),
					   ('ARMED_FORCES', 'Armed Forces', getdate(), '31 dec 9999', 2),
					   ('MERCHANT_NAVY', 'Merchant Navy', getdate(), '31 dec 9999', 2)
*/

select * from designation_for_professions

insert into designation_for_professions(designation_for_profession_cd, designation_for_profession_nm, effective_from_dt, effective_till_dt,	audit_log_id)
								values ('DOCTOR',						'Doctor',						getdate(), '31 dec 9999', 2),
									   ('NURSE',						'Nurse',						getdate(), '31 dec 9999', 2),
									   ('TEACHER',						'Teacher',						getdate(), '31 dec 9999', 2),
									   ('PROFESSOR',					'Professor',					getdate(), '31 dec 9999', 2),
									   ('FARMER',						'Farmer',						getdate(), '31 dec 9999', 2),
									   ('CARPENTAR',					'Carpentar',					getdate(), '31 dec 9999', 2),
									   ('SOFTWARE_PROGRAMMER',			'Software Programmer',			getdate(), '31 dec 9999', 2),
									   ('HARDWARE_ENGINEER',			'Hardware Engineer',			getdate(), '31 dec 9999', 2),
									   ('CIVIL_ENGINEER',				'Civil Engineer',				getdate(), '31 dec 9999', 2),
									   ('MECHANICAL_ENGINEER',			'Mechanical Engineer',			getdate(), '31 dec 9999', 2),
									   ('SHOP_OWNER',					'Shop Owner',					getdate(), '31 dec 9999', 2),
									   ('MANUFACTURER',					'Manufacturer',					getdate(), '31 dec 9999', 2),
									  
									   ('GENERAL',						'General',						getdate(), '31 dec 9999', 2),
									   ('LIEUTENANT_GENERAL',			'Lieutenant General',			getdate(), '31 dec 9999', 2),
									   ('MAJOR_GENERAL',				'Major General',				getdate(), '31 dec 9999', 2),
									   ('BRIGADIER',					'Brigadier',					getdate(), '31 dec 9999', 2),
									   ('COLONEL',						'Colonel',						getdate(), '31 dec 9999', 2),
									   ('LIEUTENANT_COLONEL',			'Lieutenant Colonel',			getdate(), '31 dec 9999', 2),
									   ('MAJOR',						'Major',						getdate(), '31 dec 9999', 2),
									   ('CAPTAIN',						'Captain',						getdate(), '31 dec 9999', 2),
									   ('LIEUTENANT',					'Lieutenant',					getdate(), '31 dec 9999', 2),
									   
									   ('ADMIRAL',						'Admiral',						getdate(), '31 dec 9999', 2),
									   ('VICE_ADMIRAL',					'Vice Admiral',					getdate(), '31 dec 9999', 2),
									   ('REAR_ADMIRAL',					'Rear Admiral',					getdate(), '31 dec 9999', 2),
									   ('COMMODORE',					'Commodore',					getdate(), '31 dec 9999', 2),
									   ('COMMANDER',					'Commander',					getdate(), '31 dec 9999', 2),
									   ('LIEUTENANT_COMMANDER',			'Lieutenant Commander',			getdate(), '31 dec 9999', 2),
									   ('SUB_LIEUTENANT',				'Sub-Lieutenant',				getdate(), '31 dec 9999', 2),
									   
									   ('AIR_CHIEF_MARSHAL',			'Air Chief Marshal',			getdate(), '31 dec 9999', 2),
									   ('AIR_MARSHAL',					'Air Marshal',					getdate(), '31 dec 9999', 2),
									   ('AIR_VICE_MARSHAL',				'Air Vice Marshal',				getdate(), '31 dec 9999', 2),
									   ('AIR_COMMODORE',				'Air Commodore',				getdate(), '31 dec 9999', 2),
									   ('GROUP_CAPTAIN',				'Group Captain',				getdate(), '31 dec 9999', 2),
									   ('WING_COMMANDER',				'Wing Commander',				getdate(), '31 dec 9999', 2),
									   ('SQUADRON_LEADER',				'Squadron Leader',				getdate(), '31 dec 9999', 2),
									   ('FLIGHT_LIEUTENANT',			'Flight Lieutenant',			getdate(), '31 dec 9999', 2),
									   ('FLYING_OFFICER',				'Flying Officer',				getdate(), '31 dec 9999', 2),

									   ('Chief Officer',				'Chief Officer',				getdate(), '31 dec 9999', 2),
									   ('Second Officer',				'Second Officer',				getdate(), '31 dec 9999', 2),
									   ('Third Officer',				'Third Officer',				getdate(), '31 dec 9999', 2),
									   ('Deck Cadets',					'Deck Cadets',					getdate(), '31 dec 9999', 2)


insert into profession_designations(profession_id, designation_for_profession_id, effective_from_dt, effective_till_dt, audit_log_id)
							values  (1,1,        getdate(), '31 dec 9999', 2),
									(1,2,        getdate(), '31 dec 9999', 2),
									
									(2,3,        getdate(), '31 dec 9999', 2),
									(2,4,        getdate(), '31 dec 9999', 2),
									
									(3,5,        getdate(), '31 dec 9999', 2),
									
									(4,6,        getdate(), '31 dec 9999', 2),
									
									(5,7,        getdate(), '31 dec 9999', 2),
									(5,8,        getdate(), '31 dec 9999', 2),
									
									(6,9,        getdate(), '31 dec 9999', 2),
									(6,10,        getdate(), '31 dec 9999', 2),
									
									(7,11,        getdate(), '31 dec 9999', 2),
									(7,12,        getdate(), '31 dec 9999', 2),

									(8,13,        getdate(), '31 dec 9999', 2),
									(8,14,        getdate(), '31 dec 9999', 2),
									(8,15,        getdate(), '31 dec 9999', 2),
									(8,16,        getdate(), '31 dec 9999', 2),
									(8,17,        getdate(), '31 dec 9999', 2),
									(8,18,        getdate(), '31 dec 9999', 2),
									(8,19,        getdate(), '31 dec 9999', 2),
									(8,20,        getdate(), '31 dec 9999', 2),
									(8,21,        getdate(), '31 dec 9999', 2),
									(8,22,        getdate(), '31 dec 9999', 2),
									(8,23,        getdate(), '31 dec 9999', 2),
									(8,24,        getdate(), '31 dec 9999', 2),
									(8,25,        getdate(), '31 dec 9999', 2),
									(8,26,        getdate(), '31 dec 9999', 2),
									(8,27,        getdate(), '31 dec 9999', 2),
									(8,28,        getdate(), '31 dec 9999', 2),
									(8,29,        getdate(), '31 dec 9999', 2),
									(8,30,        getdate(), '31 dec 9999', 2),
									(8,31,        getdate(), '31 dec 9999', 2),
									(8,32,        getdate(), '31 dec 9999', 2),
									(8,33,        getdate(), '31 dec 9999', 2),
									(8,34,        getdate(), '31 dec 9999', 2),
									(8,35,        getdate(), '31 dec 9999', 2),
									(8,36,        getdate(), '31 dec 9999', 2),
									(8,37,        getdate(), '31 dec 9999', 2),

									(9,38,        getdate(), '31 dec 9999', 2),
									(9,39,        getdate(), '31 dec 9999', 2),
									(9,40,        getdate(), '31 dec 9999', 2),
									(9,41,        getdate(), '31 dec 9999', 2)