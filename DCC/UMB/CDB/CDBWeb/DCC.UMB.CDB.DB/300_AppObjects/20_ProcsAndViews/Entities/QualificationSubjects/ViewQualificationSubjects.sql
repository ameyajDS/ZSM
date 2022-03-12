if exists(select top 1 1 from INFORMATION_SCHEMA.views where TABLE_NAME='ViewQualificationSubjects')
begin
	drop view dbo.ViewQualificationSubjects
end
go
create view dbo.ViewQualificationSubjects
as
select s.*, qs.qualification_id 
from qlfctn_subjects s
join qualifications_qlfctn_subjects qs on (qs.qlfctn_subject_id=s.qlfctn_subject_id)
go

--select * from audit_logs