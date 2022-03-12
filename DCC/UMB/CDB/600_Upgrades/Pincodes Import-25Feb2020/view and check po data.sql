update po
set po.level1_id = a.level_1_address_component_id
, po.level2_id = a.level_2_address_component_id
, po.level3_id = a.level_3_address_component_id
from poimport po
join
 (
	select i.id
		, l1.level_1_address_component_id--, l1.level_1_address_component_nm
		, l2.level_2_address_component_id--, l2.level_2_address_component_nm, l2.level_1_address_component_id as l2_parent_id
		, l3.level_3_address_component_id--, l3.level_3_address_component_nm, l3.level_2_address_component_id as l3_parent_id
	from poimport i
	join level_1_address_components l1 on (l1.level_1_address_component_nm = i.level1_nm)
	join v_level_2_address_components l2 on (l2.level_2_address_component_nm = i.level2_nm and l2.level_1_address_component_nm = i.level1_nm)
	join v_level_3_address_components l3 on (l3.level_3_address_component_nm = i.level3_nm and l3.level_2_address_component_nm = i.level2_nm)
)a on (a.id = po.id)

update poimport set country_id = 1