
insert into mpb..bridge_sync_records (database_nm, table_nm, operation_type, operation_dtm) 
						values ('cdb','pincodes','S', getdate())
select * from mpb..bridge_sync_records where sync_dtm is null;
