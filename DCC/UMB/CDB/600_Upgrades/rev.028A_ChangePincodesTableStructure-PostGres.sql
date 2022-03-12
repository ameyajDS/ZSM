drop view cdb.view_addresses cascade;
alter table cdb.pincodes drop column country_id;


--run the file view_addresses.sql
--run the file lkp_pincodes.sql
--run the file lkp_addresses.sql