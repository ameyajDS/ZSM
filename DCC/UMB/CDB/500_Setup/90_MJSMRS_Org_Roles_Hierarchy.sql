delete from org_roles 


insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till, org_role_flat_name) 
			   values ('Medical',    1,         0,     null,                null,         getdate(),      '31 dec 9999', 'Medical')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till, org_role_flat_name) 
			   values ('Non Medical',    1,         0,     null,                null,         getdate(),      '31 dec 9999', 'Non Medical')			   
			   
declare @i int 

select @i = org_role_id from org_roles where org_role_nm = 'Medical'

insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Doctor',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Nursing Staff',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Paramedical Staff',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Helpers',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Ungraded',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Non Medical'

insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Ungraded',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Engineer',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Supervisor/Incharge',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Technical',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Clerical',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Skilled',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Semi- Skilled',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Helper NM',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
insert into org_roles (org_role_nm, is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values ('Security Guard',     0,         0,     @i,                null,           getdate(),      '31 dec 9999')
	   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Doctor'

declare @seq int = 150
declare @desig_id int 
declare @add_name varchar(1000)

set @seq = @seq + 1
set @add_name = 'Consultant'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   

set @seq = @seq + 1
set @add_name = 'Deputy Medical Supdt'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Director'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   

set @seq = @seq + 1
set @add_name = 'Advisor'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


set @seq = @seq + 1
set @add_name = 'G.D.M.O.'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
	
	
set @seq = @seq + 1
set @add_name = 'Head of Department'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Jr. Specialist'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Medical Officer'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Medical Superintendant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
set @seq = @seq + 1
set @add_name = 'Senior Medical Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
set @seq = @seq + 1
set @add_name = 'Specialist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
			   
set @seq = @seq + 1
set @add_name = 'Sr. Consultant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Sr. Specialist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Staff Physician'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')




select @i = org_role_id from org_roles where org_role_nm = 'Nursing Staff'


set @seq = @seq + 1
set @add_name = 'Matron'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Warden'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Nursing Sisters'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Staff Nurse'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Paramedical Staff'

set @add_name = 'Other Paramedical Staff'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Other Paramedical Staff'		   
set @seq = @seq + 1
set @add_name = 'Supervisor Hospital Pharmacy'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Physiotherapist'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Dietician'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Audiologist cum Speech Therapist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Paramedical Staff'

set @add_name = 'Sr. Technician'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')

			   
select @i = org_role_id from org_roles where org_role_nm = 'Sr. Technician'
set @seq = @seq + 1
set @add_name = 'Sr. Technician'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Sr. Radiographer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Sr. Refractionist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Sr. Pharmacist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'O.T. Master'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Ortho Technician'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Paramedical Staff'

set @add_name = 'Jr.Technician Staff'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')

			   
select @i = org_role_id from org_roles where org_role_nm = 'Jr. Technician'
   
			   
set @seq = @seq + 1
set @add_name = 'Junior Technician'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Jr. Radiographer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Opthalmology Assistant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Junior Pharmacist'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'O.T.Assistant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   

set @seq = @seq + 1
set @add_name = 'Jr. Data Technologist'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Helpers'


set @seq = @seq + 1
set @add_name = 'Ward Helper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Helper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Caretaker'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Ungraded'


set @seq = @seq + 1
set @add_name = 'OPD Sewadar'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
--declare @i int 
			   
select @i = org_role_id from org_roles where org_role_nm = 'Non Medical'
			   
select @i = org_role_id from org_roles where org_role_nm = 'Ungraded' and group_org_role_id = @i

--declare @seq int = 150
--declare @desig_id int 
--declare @add_name varchar(1000)

set @seq = @seq + 1
set @add_name = 'Chief Administrator'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   

set @seq = @seq + 1
set @add_name = 'Administrator'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
	
set @seq = @seq + 1
set @add_name = 'Administrative Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Officer Incharge Internal Audit'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   

set @seq = @seq + 1
set @add_name = 'Finance Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
	
	
set @seq = @seq + 1
set @add_name = 'SIC Engineering'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Patient Welfare Officer'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Asst. PWO(lady)'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'OIC Purchase'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
set @seq = @seq + 1
set @add_name = 'OIC Stores'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
set @seq = @seq + 1
set @add_name = 'OPD Sewadar'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

			   
			   
set @seq = @seq + 1
set @add_name = 'Cycle & Bistra Shed Sewadar'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999') 


set @seq = @seq + 1
set @add_name = 'Sewadar'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Engineer'

set @seq = @seq + 1
set @add_name = 'Engineer (Electrical)'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Electronics Engineer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'OIC  AC/Mechanical'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'I/C Computer Cell'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Supervisor/Incharge'


set @seq = @seq + 1
set @add_name = 'Supervisor CME'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Personnel Officer'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Office Superintendent'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Superintendent(G)'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Accounts Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'I/c Creche'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Store Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Purchase Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Security Officer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


set @seq = @seq + 1
set @add_name = 'Security Supervisor'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


set @seq = @seq + 1
set @add_name = 'Supvr cum Store Keeper'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Librarian'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Supvr cum Accountant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Supervisor'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Fire Officer Cum I/C Housekeeping'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Technical'

set @add_name = 'Sr. Technician'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Sr. Technician'	and group_org_role_id = @i
	   
set @seq = @seq + 1
set @add_name = 'Sr. Technician'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Sr. Comp. Programmer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
			   
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Technical'

set @add_name = 'Jr. Technician'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Jr. Technician'	and group_org_role_id = @i	   
set @seq = @seq + 1
set @add_name = 'Junior Technician'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
set @seq = @seq + 1
set @add_name = 'Boiler Attendant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Jr. Comp. Programmer'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   


			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Technical'

set @add_name = 'Assistant'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')

select @i = org_role_id from org_roles where org_role_nm = 'Assistant'		   
set @seq = @seq + 1
set @add_name = 'Electronics Assistant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   

			   
select @i = org_role_id from org_roles where org_role_nm = 'Technical'

set @add_name = 'Helper'
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         0,     @i,                null,           getdate(),      '31 dec 9999')

select @i = org_role_id from org_roles where org_role_nm = 'Helper'	and group_org_role_id = @i
	   
set @seq = @seq + 1
set @add_name = 'Helper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Clerical'


set @seq = @seq + 1
set @add_name = 'PA to Chief'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Stenographer'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Accountant'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Audit Assistant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Clerk cum Typist'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Clerk (Accounts)'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Cashier'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

		   
set @seq = @seq + 1
set @add_name = 'Purchase Executive'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


set @seq = @seq + 1
set @add_name = 'Counter Clerk'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'R & D Clerk'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Store Keeper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Receptionist'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Stationery Billing & Despatch Clerk'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


select @i = org_role_id from org_roles where org_role_nm = 'Security Guard'


set @seq = @seq + 1
set @add_name = 'Security Guard'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')	




select @i = org_role_id from org_roles where org_role_nm = 'Skilled'


set @seq = @seq + 1
set @add_name = 'Plumber'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')			   

set @seq = @seq + 1
set @add_name = 'Carpenter'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')			   

set @seq = @seq + 1
set @add_name = 'Mason'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Painter'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')			   

			   
			   
select @i = org_role_id from org_roles where org_role_nm = 'Semi-Skilled'


set @add_name = 'Cook'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')			   

set @add_name = 'Driver'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')			   

set @add_name = 'Cleaner'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Tailor'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')


set @seq = @seq + 1
set @add_name = 'Washerman'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')




select @i = org_role_id from org_roles where org_role_nm = 'Non Medical'
select @i = org_role_id from org_roles where org_role_nm = 'Helper' and group_org_role_id = @i


set @seq = @seq + 1
set @add_name = 'Helper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @seq = @seq + 1
set @add_name = 'Office Attendant'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Ward Helper'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Fireman'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Operator Scrubbing Machine'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Caretaker'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Warden'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')

set @add_name = 'Mali'
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')
			   
set @seq = @seq + 1
set @add_name = 'Sewerman'
insert into designations (designation_cd,				designation_nm, effective_from, effective_till) 
				  values ('Mg'+convert(varchar,@seq),		@add_name,  getdate(), '31 dec 9999')
select @desig_id = designation_id from designations where designation_nm = @add_name
insert into org_roles (org_role_nm,				 is_root, is_leaf, group_org_role_id, designation_id, effective_from, effective_till) 
			   values (@add_name,					0,         1,     @i,                @desig_id,           getdate(),      '31 dec 9999')	




