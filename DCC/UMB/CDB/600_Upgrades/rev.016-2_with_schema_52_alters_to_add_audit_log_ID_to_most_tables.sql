
alter table audit_logs add is_consumed bit not null constraint AuditLogs_DF_AuditLogs default 0
alter table audit_logs add action_id varchar(50) null 
alter table audit_logs drop column qualification_id

alter table org_roles add audit_log_id	 audit_log_id		null		
update org_roles set audit_log_id = 2
alter table org_roles alter column  audit_log_id	 audit_log_id		not null	
alter table org_roles add constraint OrgRoles_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table org_role_applicability add audit_log_id	 audit_log_id		null		
update org_role_applicability set audit_log_id = 2
alter table org_role_applicability alter column  audit_log_id	 audit_log_id		not null	
alter table org_role_applicability add constraint OrgRolesApplicability_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table countries add audit_log_id	 audit_log_id		null		
update countries set audit_log_id = 2
alter table countries alter column  audit_log_id	 audit_log_id		not null	
alter table countries add constraint Countries_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table designations add audit_log_id	 audit_log_id		null		
update designations set audit_log_id = 2
alter table designations alter column  audit_log_id	 audit_log_id		not null	
alter table designations add constraint Designations_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table level_1_address_components add audit_log_id	 audit_log_id		null		
update level_1_address_components set audit_log_id = 2
alter table level_1_address_components alter column  audit_log_id	 audit_log_id		not null	
alter table level_1_address_components add constraint Level1AddressComponent_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table level_2_address_components add audit_log_id	 audit_log_id		null		
update level_2_address_components set audit_log_id = 2
alter table level_2_address_components alter column  audit_log_id	 audit_log_id		not null	
alter table level_2_address_components add constraint Level2AddressComponent_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table level_3_address_components add audit_log_id	 audit_log_id		null		
update level_3_address_components set audit_log_id = 2
alter table level_3_address_components alter column  audit_log_id	 audit_log_id		not null	
alter table level_3_address_components add constraint Level3AddressComponent_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table qlfctn_subjects add audit_log_id	 audit_log_id		null		
update qlfctn_subjects set audit_log_id = 2
alter table qlfctn_subjects alter column  audit_log_id	 audit_log_id		not null	
alter table qlfctn_subjects add constraint QlfctnSubjects_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table qualifications add audit_log_id	 audit_log_id		null		
update qualifications set audit_log_id = 2
alter table qualifications alter column  audit_log_id	 audit_log_id		not null	
alter table qualifications add constraint Qualifications_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table skills add audit_log_id	 audit_log_id		null		
update skills set audit_log_id = 2
alter table skills alter column  audit_log_id	 audit_log_id		not null	
alter table skills add constraint Skills_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table societies add audit_log_id	 audit_log_id		null		
update societies set audit_log_id = 2
alter table societies alter column  audit_log_id	 audit_log_id		not null	
alter table societies add constraint Society_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)

alter table working_units add audit_log_id	 audit_log_id		null		
update working_units set audit_log_id = 2
alter table working_units alter column  audit_log_id	 audit_log_id		not null	
alter table working_units add constraint WorkingUnits_FK_AuditLogID FOREIGN KEY (audit_log_id) references	audit_logs(audit_log_id)
