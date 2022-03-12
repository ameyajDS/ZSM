use cdb
go

--- set banks
set identity_insert banks on

insert into banks (bank_id,	bank_nm,	bank_cd,	effective_from_dt,	effective_till_dt)
select bank_id,	bank_nm,	bank_cd,	effective_from_dt,	effective_till_dt from ce..banks

set identity_insert banks off

--- set bank_centres
set identity_insert bank_centres on

insert into bank_centres(bank_centre_id,	bank_centre_nm,	district_id,	level_2_address_component_id)
select * from ce..bank_centres

set identity_insert bank_centres off

--- set branches
set identity_insert branches on

insert into branches (branch_id,	bank_id,	bank_centre_id,	branch_nm,	branch_cd,	address,	effective_from_dt,	effective_till_dt)
select branch_id,	bank_id,	bank_centre_id,	branch_nm,	branch_cd,	address,	effective_from_dt,	effective_till_dt from ce..branches

set identity_insert branches off