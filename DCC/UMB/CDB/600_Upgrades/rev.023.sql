alter table passport_types add audit_log_id		INTEGER		 NULL    CONSTRAINT	PassportTypes_FK_AuditLogID
								REFERENCES	audit_logs

update passport_types set audit_log_id = 2

alter table passport_types alter column audit_log_id		INTEGER	 not	 NULL   

create table adt_passport_types
(
	id										int						identity(1,1) constraint	AdtPassportType_PK_Id primary key,
	passport_type_id										int,
	passport_type_cd										varchar(10),
	passport_type_nm										varchar(50),
	remarks													varchar(500),
	effective_from_dt										date,
	effective_till_dt										date,
	audit_log_id											int constraint	AdtPassportType_FK_AuditLogId references	audit_logs,
)
GO

create table adt_document_issue_places
(
	id										int						identity(1,1) constraint	AdtDocumentIssuePlace_PK_Id primary key,
	document_issue_place_id									int,
	document_issue_place_nm									varchar(50),
	document_issue_country_id								country_id,
	remarks													varchar(500),
	effective_from_dt										date,
	effective_till_dt										date,
	audit_log_id											int constraint	AdtDocumentIssuePlace_FK_AuditLogId references	audit_logs,
)
GO