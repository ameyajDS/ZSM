

insert into cdb..designations (designation_cd, designation_nm, effective_from, effective_till)
		                select designation_cd, designation_nm, effective_from, effective_till 
						from rms..person_types_designations 
						where designation_nm not in (select designation_nm from cdb..designations)

update rms..person_types_designations
set designation_nm = 'Mali' 
where designation_nm = 'Malis'

update rms..person_types_designations
set designation_nm = 'Store keeper' 
where designation_nm = 'Storekeeper'