use osc_web

--	====================================================================================================
--  We will add the Patron Representatives from this script here
--	====================================================================================================

declare @temp table(
	  given_name varchar(200)
	, middle_name varchar(200)
	, sur_name varchar(200)
)

insert into @temp
	select distinct oh.given_name, oh.middle_name, oh.family_name
	from office_holder_assignments oha
	join assignment_types at on (at.assignment_type_id = oha.type)
	join office_holders oh on (oh.office_holder_id = oha.office_holder)
	where at.assignment_code='rep'

insert into cdb..patron_representatives
	select 
	 given_name + coalesce(' ' + middle_name,'') + coalesce(' ' + sur_name,'') as representative_name from @temp




--	====================================================================================================
