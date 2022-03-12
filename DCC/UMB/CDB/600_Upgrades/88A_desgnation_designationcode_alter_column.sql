alter table designations drop constraint UK_Designations_Code
alter table designations alter column designation_cd varchar(50) not null
alter table designations add CONSTRAINT	UK_Designations_Code UNIQUE	NONCLUSTERED	(designation_cd)


alter table designations alter column designation_nm varchar(100) not null
