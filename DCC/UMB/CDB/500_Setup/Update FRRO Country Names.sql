/*
--begin tran 

--update cc 
--set cc.frro_country_nm = hc.frro_cnt_name
--from cdb..countries cc 
--join hostels..t_country hc on (ltrim(rtrim(hc.cnt_name)) = ltrim(rtrim(cc.country_nm)))
--where hc.valid = 'Y'

----commit
----rollback

begin tran 

update cc 
set cc.frro_country_nm = hc.frro_cnt_name
from cdb..countries cc 
join h6..t_country hc on (cc.country_nm = hc.cnt_name)
where frro_cnt_name is not null and frro_cnt_name != '' and cc.frro_country_nm is null

----commit
----rollback


update cdb..countries set frro_country_nm = 'UNITED STATES OF AMERICA' where country_id = 86
*/

select * from cdb..countries 
where frro_country_nm is null --and is_authentic = 1
and country_id in 
(
	select distinct residence_country_id from ers..reservation_persons 
)
order by country_nm
/*
select * from h6..t_country 
where cnt_name like '%st%'
order by cnt_name

*/