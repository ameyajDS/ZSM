declare @max int, @society_id int, @working_unit_entity_id int, @counter int, @working_unit_id int, @org_role_id int, @max_org_ids int, @org_counter int

select @society_id = society_id from societies where society_cd = 'MJSMRS'
select @working_unit_entity_id = entity_id from working_unit_entities where entity_singular_nm = 'Department'

declare @wu table (
	wu_id	int, 
	seq		int	identity(1,1)
)

insert into @wu
	select working_unit_id from working_units where society_id = @society_id and working_unit_entity_id = @working_unit_entity_id


declare @or table (
	or_id	int, 
	seq		int	identity(1,1)
)

insert into @or
	select org_role_id from org_roles


set @counter = 1
select @max = max(seq) from @wu
select @max_org_ids = max(seq) from @or

while (@counter <= @max)
begin
	set @working_unit_id  = null
	
	select @working_unit_id  = wu_id from @wu where seq = @counter
	
	set @org_counter = 1
	
	while (@org_counter < @max_org_ids)
	begin 
		set @org_role_id = null 
		
		select @org_role_id = or_id from @or where seq = @org_counter
	
		insert into org_role_applicability (society_id,		working_unit_id,  org_role_id)
							  		values (@society_id,	@working_unit_id, @org_role_id)
							  		
		set @org_counter = @org_counter + 1
	end	
	
	set	@counter = @counter+1
end		


--