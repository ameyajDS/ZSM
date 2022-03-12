BEGIN TRAN

UPDATE level_2_address_components SET level_2_address_component_nm = RTRIM (level_2_address_component_nm)	where level_2_address_component_nm like '% '
UPDATE level_3_address_components SET level_3_address_component_nm = RTRIM (level_3_address_component_nm)	where level_3_address_component_nm like '% '

COMMIT


/*

   Output records....


(134 rows affected)

(0 rows affected)

(97 rows affected)

(97 rows affected)

(134 rows affected)

(134 rows affected)

(62516 rows affected)

(62516 rows affected)

(62516 rows affected)

*/

