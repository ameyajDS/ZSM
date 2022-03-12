	
insert into cdb..working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)
					    values ('PSMain',		 'Pathseekers Beas',          'No',		'No',	 2,			'Yes',			 3,							2,					'1 jan 2010',	'31 dec 9999')					


declare @group_working_unit_id int

select @group_working_unit_id  = working_unit_id from cdb..working_units where working_unit_cd = 'PSMain'

--print @group_working_unit_id
					
insert into cdb..working_units (working_unit_cd, working_unit_nm,     is_root,    is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)
					    values ('PS',		     'Pathseekers School', 'No',		'Yes',	2,			'Yes',			 4,					   @group_working_unit_id, '1 jan 2010',	'31 dec 9999')					


update cdb..working_units 
set group_working_unit_id = @group_working_unit_id
where working_unit_cd = 'RSSB(E&E)'