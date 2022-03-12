
drop table poimport
create table poimport
(
	id				int identity(1,1),
	pincode			int,
	level1_nm		varchar(1000),
	level2_nm		varchar(1000),
	level3_nm		varchar(1000),
	country_id		int,
	level1_id		int,
	level2_id		int,
	level3_id		int
)
/*
alter table poimport add country_id		int
alter table poimport add level1_id		int
alter table poimport add 	level2_id		int
alter table poimport add 	level3_id		int
*/