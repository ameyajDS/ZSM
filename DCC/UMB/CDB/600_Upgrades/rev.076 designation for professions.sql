begin tran;
--rollback;
--commit;

declare
	@al	integer;	--	audit_log_id

insert into	audit_logs ([session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed])
	values (0, 'Script', 1, 'System', 'I', 'Script', 'Designations for Profession', GetDate(), 0);
	set @al	=	scope_identity ();

insert into designation_for_professions (designation_for_profession_cd, designation_for_profession_nm, effective_from_dt, effective_till_dt, audit_log_id) values 
	('Electrician', 'Electrician', GetDate(), '31 dec 9999', @al),
	('Painter', 'Painter', GetDate(), '31 dec 9999', @al),
	('Welder', 'Welder', GetDate(), '31 dec 9999', @al),
	('Plumber', 'Plumber', GetDate(), '31 dec 9999', @al);

insert into profession_designations (profession_id, designation_for_profession_id, effective_from_dt, effective_till_dt, audit_log_id)
	select p.profession_id, d.designation_for_profession_id, GetDate(), '31 dec 9999', @al
	from professions p
	join designation_for_professions d on d.designation_for_profession_nm in ('Electrician', 'Painter', 'Welder', 'Plumber')
	where p.profession_nm = 'Engineering';


