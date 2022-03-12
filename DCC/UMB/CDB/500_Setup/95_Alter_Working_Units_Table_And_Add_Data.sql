alter table working_units add print_nm varchar(50)

update working_units
set print_nm = working_unit_nm

select print_nm from working_units 
order by working_unit_nm 

update working_units set print_nm = replace(print_nm,'Deptt.','')
update working_units set print_nm = replace(print_nm,'Department','')
update working_units set print_nm = 'AV' where print_nm = 'A.V.'
update working_units set print_nm = 'DCC' where print_nm = 'Data Computers & Communication'
update working_units set print_nm = 'Communication' where print_nm = 'Communication Section'

