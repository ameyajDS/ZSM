declare @max int, @startcode int, @society_id int, @working_unit_entity_id int, @group_working_unit_id int, @counter int, @dept_nm varchar(1000)

select @society_id = society_id from societies where society_cd = 'MJSMRS'
select @working_unit_entity_id = entity_id from working_unit_entities where entity_singular_nm = 'Department'

select @group_working_unit_id = working_unit_id from working_units where working_unit_nm  = 'Beas Hospital'

declare @t table 
(
	dept_nm varchar(1000), 
	seq		int	identity(1,1)	
)

set @startcode = 73

insert into @t values ('Cycle & Bistra Shed')
insert into @t values ('Dermatology')
insert into @t values ('Emergency O.T.')
insert into @t values ('Eye O.T.')
insert into @t values ('Eye OPD')
insert into @t values ('Eye Ward - I')
insert into @t values ('Genrel OPD')
insert into @t values ('Labour Room')
insert into @t values ('OPD Dispensary')
insert into @t values ('Pre & Post OP Room')
insert into @t values ('Surgery - OT')

select @max = max(seq) from @t
set	@counter = 1

while (@counter <= @max)
begin
	set @dept_nm = null
	
	select @dept_nm = dept_nm from @t where seq = @counter
	
	insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('BeasDep'+convert(varchar,@startcode), @dept_nm, 'No', 'Yes', @society_id, 'yes',@working_unit_entity_id, @group_working_unit_id, getdate(), '31 dec 9999')
				
	set	@counter = @counter+1
	set @startcode = @startcode+1
end		



select * from working_units
--where working_unit_nm = 'Dermatology'
 where society_id = 3 and group_working_unit_id = 75 order by working_unit_id

update working_units 
set group_working_unit_id = 75
where group_working_unit_id  = 337


insert into working_units (working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till)	
	values  ('BeasDep84', 'Leave Reserve', 'No', 'Yes', 3, 'yes',4, 75, getdate(), '31 dec 9999')
	