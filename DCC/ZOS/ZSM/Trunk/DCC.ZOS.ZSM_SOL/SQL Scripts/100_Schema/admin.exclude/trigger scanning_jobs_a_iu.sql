--This procedure is used when we have to to change sewa dates in Sewas & Scanning Jobs after creations of Scanning Job

USE zsm
go
alter table scanning_jobs disable trigger scanning_jobs_a_iu


-- Now update dates for Sewa and Scanning Jobs 

alter table scanning_jobs enable trigger scanning_jobs_a_iu


