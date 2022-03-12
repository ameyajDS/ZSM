update cdb..working_units
set is_leaf = 'No'
where working_unit_id in (74,75,76,77,78,81,82)

declare @max int, @society_id int, @working_unit_entity_id int, @group_working_unit_id int, @counter int, @dept_nm varchar(1000)

select @society_id = society_id from societies where society_cd = 'MJSMRS'
select @working_unit_entity_id = entity_id from working_unit_entities where entity_singular_nm = 'Department'

select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Beas Hospital'

declare @t table 
(
	dept_nm varchar(1000), 
	seq		int	identity(1,1)	
)

insert into @t values ('Air Conditioning')
insert into @t values ('Anaesthesia')
insert into @t values ('Bhojan Bhandar')
insert into @t values ('Blood Bank')
insert into @t values ('Boys Hostel')
insert into @t values ('CCU')
insert into @t values ('Central Pharmacy')
insert into @t values ('Central Store')
insert into @t values ('Chief Administrator Office')
insert into @t values ('Civil Maintenance Engineering ')
insert into @t values ('Computer Cell')
insert into @t values ('Creche')
insert into @t values ('CSSD')
insert into @t values ('Dark Room')
insert into @t values ('Dental')
insert into @t values ('Director Office')
insert into @t values ('ECG')
insert into @t values ('Electrical ')
insert into @t values ('Electronics')
insert into @t values ('Emergency')
insert into @t values ('ENT')
insert into @t values ('ENT,Ortho & Skin Ward')
insert into @t values ('Finance')
insert into @t values ('Fire Fighting/Housekeeping')
insert into @t values ('Girls Hostel')
insert into @t values ('GOPD')
insert into @t values ('Guest House')
insert into @t values ('Gynae & Obs. ')
insert into @t values ('Horticulture')
insert into @t values ('Hospital Kitchen')
insert into @t values ('Hospital Pharmacy')
insert into @t values ('Hostels (Nurses & Women)')
insert into @t values ('ICU')
insert into @t values ('Injection Room')
insert into @t values ('Internal Audit Cell')
insert into @t values ('Laboratory')
insert into @t values ('Laundry')
insert into @t values ('Library')
insert into @t values ('Main O.T.')
insert into @t values ('Maternity Ward')
insert into @t values ('Matron Office')
insert into @t values ('Mechanical')
insert into @t values ('Medical Supdt Office')
insert into @t values ('Medical Ward')
insert into @t values ('Medical Wing')
insert into @t values ('Medicine')
insert into @t values ('Mens Hostel')
insert into @t values ('Minor O.T')
insert into @t values ('Nurses Hostel')
insert into @t values ('Nursing')
insert into @t values ('Opthalmology ')
insert into @t values ('Orthopaedics ')
insert into @t values ('Paediatrics ')
insert into @t values ('Paediatrics Ward')
insert into @t values ('Patient Welfare Office')
insert into @t values ('Personnel ')
insert into @t values ('Physiotherapy')
insert into @t values ('Purchase')
insert into @t values ('R &M Store')
insert into @t values ('R&D Section')
insert into @t values ('Radiology ')
insert into @t values ('Reception')
insert into @t values ('Registration')
insert into @t values ('Security')
insert into @t values ('Staff Welfare Centre')
insert into @t values ('Stationery')
insert into @t values ('Stores')
insert into @t values ('Surgery ')
insert into @t values ('Surgical Ward - I')
insert into @t values ('Surgical Ward - II')
insert into @t values ('Transport')


select @max = max(seq) from @t
set	@counter = 1

while (@counter <= @max)
begin
	set @dept_nm = null
	
	select @dept_nm = dept_nm from @t where seq = @counter
	
	insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('BeasDep'+convert(varchar,@counter), @dept_nm, 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
				
	set	@counter = @counter+1
end		


select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Sikanderpur Hospital'

declare @t1 table 
(
	dept_nm varchar(1000), 
	seq		int	identity(1,1)	
)

insert into @t1 values ('Accounts')
insert into @t1 values ('Administrator Office')
insert into @t1 values ('Air Conditioning')
insert into @t1 values ('Anaesthesia')
insert into @t1 values ('Bhojan Bhandar')
insert into @t1 values ('Central Store')
insert into @t1 values ('Civil Maintenance Engineering ')
insert into @t1 values ('CMO Office')
insert into @t1 values ('Creche')
insert into @t1 values ('CSSD')
insert into @t1 values ('Dark Room')
insert into @t1 values ('Dental')
insert into @t1 values ('Dispensary')
insert into @t1 values ('ECG')
insert into @t1 values ('Electrical ')
insert into @t1 values ('Emergency')
insert into @t1 values ('Female Ward')
insert into @t1 values ('Fire Fighting/Housekeeping')
insert into @t1 values ('Guest House')
insert into @t1 values ('Gynae & Obs. ')
insert into @t1 values ('Horticulture')
insert into @t1 values ('ICU')
insert into @t1 values ('Injection Room')
insert into @t1 values ('Laboratory')
insert into @t1 values ('Laundry')
insert into @t1 values ('Library')
insert into @t1 values ('Main O.T.')
insert into @t1 values ('Male Ward')
insert into @t1 values ('Mechanical')
insert into @t1 values ('Medicine')
insert into @t1 values ('Minor O.T')
insert into @t1 values ('Opthalmology ')
insert into @t1 values ('Orthopaedics ')
insert into @t1 values ('Paediatrics ')
insert into @t1 values ('Patient Welfare Office')
insert into @t1 values ('Personnel ')
insert into @t1 values ('Pharmacy')
insert into @t1 values ('Physiotherapy')
insert into @t1 values ('R &M Store')
insert into @t1 values ('R&D Section')
insert into @t1 values ('Radiology ')
insert into @t1 values ('Reception')
insert into @t1 values ('Registration')
insert into @t1 values ('Security')
insert into @t1 values ('Staff Welfare Centre')
insert into @t1 values ('Stationery')
insert into @t1 values ('Sub Station')
insert into @t1 values ('Surgery ')
insert into @t1 values ('Transport')

set	@counter = 1
select @max = max(seq) from @t1

while (@counter <= @max)
begin
	set @dept_nm = null
	
	select @dept_nm = dept_nm from @t1 where seq = @counter
	
	insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('SkpDep'+convert(varchar,@counter), @dept_nm, 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
				
	set	@counter = @counter+1
end	



select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Bhota Hospital'
declare @t2 table 
(
	dept_nm varchar(1000), 
	seq		int	identity(1,1)	
)

insert into @t2 values ('AC/Mech')
insert into @t2 values ('Accounts')
insert into @t2 values ('Administrator Office')
insert into @t2 values ('Anaesthesia')
insert into @t2 values ('Bhojan Bhandar')
insert into @t2 values ('Blood Bank')
insert into @t2 values ('Central Store')
insert into @t2 values ('Civil Maintenance Engineering ')
insert into @t2 values ('CMO Office')
insert into @t2 values ('Creche')
insert into @t2 values ('CSSD')
insert into @t2 values ('Dark Room')
insert into @t2 values ('Dental')
insert into @t2 values ('Dispensary')
insert into @t2 values ('ECG')
insert into @t2 values ('Electrical ')
insert into @t2 values ('Emergency')
insert into @t2 values ('ENT')
insert into @t2 values ('Female Ward')
insert into @t2 values ('Fire Fighting/Housekeeping')
insert into @t2 values ('GOPD')
insert into @t2 values ('Guest House')
insert into @t2 values ('Gynae & Obs. ')
insert into @t2 values ('Horticulture')
insert into @t2 values ('Hostels (Nurses & Women)')
insert into @t2 values ('Housekeeping')
insert into @t2 values ('ICU')
insert into @t2 values ('Injection Room')
insert into @t2 values ('Laboratory')
insert into @t2 values ('Laundry')
insert into @t2 values ('Library')
insert into @t2 values ('Main O.T.')
insert into @t2 values ('Male Ward')
insert into @t2 values ('Maternity Ward')
insert into @t2 values ('Mechanical')
insert into @t2 values ('Medicine')
insert into @t2 values ('Mens Hostel')
insert into @t2 values ('Minor O.T')
insert into @t2 values ('Operation Theatre')
insert into @t2 values ('Opthalmology ')
insert into @t2 values ('Orthopaedics ')
insert into @t2 values ('Paediatrics ')
insert into @t2 values ('Patient Welfare Office')
insert into @t2 values ('Personnel ')
insert into @t2 values ('Pharmacy')
insert into @t2 values ('Physiotherapy')
insert into @t2 values ('R &M Store')
insert into @t2 values ('Radiology ')
insert into @t2 values ('Reception')
insert into @t2 values ('Registration')
insert into @t2 values ('Security')
insert into @t2 values ('Staff Welfare Centre')
insert into @t2 values ('Stores')
insert into @t2 values ('Surgery ')
insert into @t2 values ('Transport')


set	@counter = 1
select @max = max(seq) from @t2

while (@counter <= @max)
begin
	set @dept_nm = null
	
	select @dept_nm = dept_nm from @t2 where seq = @counter
	
	insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('BhDep'+convert(varchar,@counter), @dept_nm, 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
				
	set	@counter = @counter+1
end	

declare @t3 table 
(
	dept_nm varchar(1000), 
	seq		int	identity(1,1)	
)

insert into @t3 values ('Accounts')
insert into @t3 values ('CCU')
insert into @t3 values ('Central Pharmacy')
insert into @t3 values ('CMO Office')
insert into @t3 values ('CSSD')
insert into @t3 values ('Dental')
insert into @t3 values ('Dispensary')
insert into @t3 values ('ECG')
insert into @t3 values ('Emergency')
insert into @t3 values ('Girls Hostel')
insert into @t3 values ('Hospital Pharmacy')
insert into @t3 values ('Housekeeping')
insert into @t3 values ('Injection Room')
insert into @t3 values ('Laboratory')
insert into @t3 values ('Minor O.T')
insert into @t3 values ('Patient Welfare Office')
insert into @t3 values ('Personnel ')
insert into @t3 values ('Pharmacy')
insert into @t3 values ('Physiotherapy')
insert into @t3 values ('Radiology ')
insert into @t3 values ('Reception')
insert into @t3 values ('Registration')

select @max = max(seq) from @t3

select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Dera Hospital'

set	@counter = 1

while (@counter <= @max)
begin
	set @dept_nm = null
	
	select @dept_nm = dept_nm from @t3 where seq = @counter
	
	insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('DerDep'+convert(varchar,@counter), @dept_nm, 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
				
	set	@counter = @counter+1
end	


select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Homoeopathic Dispensary'

insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
values  ('HMPTH1', 'Homoeopathic Dispensary', 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')

select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Nature Cure Hospital'

insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
values  ('NTRCR1', 'Nature Cure Hospital', 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')


select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'MJSMRS'

insert into working_units (working_unit_cd, working_unit_nm,   is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
				  values  ('MJSMRS1',      'MJSMRS Department', 'No',   'Yes',   @society_id, 'yes',          @working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
