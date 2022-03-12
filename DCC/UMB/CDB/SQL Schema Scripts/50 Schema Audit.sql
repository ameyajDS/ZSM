--CAUTION: THIS IS AN AUTO GENERATED FILE. DON'T ALTER THE COTENTS.
--USE BREEZE TO REGENERATE THIS FILE IF THERE ARE CHANGES IN THE SCHEMA
set quoted_identifier off
go
set ansi_nulls on
go
-----select 'drop table '+TABLE_NAME From INFORMATION_SCHEMA.TABLES where TABLE_NAME like 'adt_%'
--===================================================
create table adt_activities
(
	id										int						identity(1,1) constraint	AdtActivities_PK_Id primary key,
	activity_id								generic_entity_id,
	activity_cd								entity_medium_cd,
	activity_nm								entity_medium_nm,
	activity_print_nm						entity_medium_nm,
	activity_sq								smallint,
	activity_dsc							entity_dsc,
	is_at_dera								bit,
	is_at_india_centre						bit,
	is_at_abroad_centre						bit,
	related_activity_id						generic_entity_id,
	related_week_no							tinyint,
	offset_days								smallint,
	is_daily_activity						bit,
	activities_cnt							tinyint,
	winter_offset_days						smallint,
	winter_activities_cnt					tinyint,
	effective_from_dt						date,
	effective_till_dt						date,
	audit_log_id							audit_log_id constraint	AdtActivities_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_castes
(
	id										int						identity(1,1) constraint	AdtCastes_PK_Id primary key,
	caste_id								int,
	caste_nm								varchar(200),
	effective_from_dt						date,
	effective_till_dt						date,
	audit_log_id							audit_log_id constraint	AdtCastes_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_nationalities
(
	id										int						identity(1,1) constraint	AdtNationalities_PK_Id primary key,
	nationality_id							int,
	nationality_nm							varchar(200),
	effective_from_dt						date,
	effective_till_dt						date,
	audit_log_id							audit_log_id constraint	AdtNationalities_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_religions
(
	id										int						identity(1,1) constraint	AdtReligions_PK_Id primary key,
	religion_id								int,
	religion_nm								varchar(200),
	effective_from_dt						date,
	effective_till_dt						date,
	audit_log_id							audit_log_id constraint	AdtReligions_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_satsang_session_types
(
	id										int						identity(1,1) constraint	AdtSatsangSessionTypes_PK_Id primary key,
	satsang_session_type_id					generic_entity_id,
	satsang_session_type_cd					entity_tiny_cd,
	satsang_session_type_nm					entity_tiny_nm,
	satsang_session_type_print_nm			entity_tiny_nm,
	satsang_session_type_sq					smallint,
	satsang_session_type_dsc				entity_dsc,
	is_winter								bit,
	is_three_week_session					bit,
	effective_from_dt						date,
	effective_till_dt						date,
	audit_log_id							audit_log_id constraint	AdtSatsangSessionTypes_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_satsang_sessions
(
	id										int						identity(1,1) constraint	AdtSatsangSessions_PK_Id primary key,
	satsang_session_id						generic_entity_id,
	yr										smallint,
	satsang_session_type_id					generic_entity_id,
	session_cd								entity_small_cd,
	session_nm								entity_small_nm,
	session_print_nm						entity_small_nm,
	session_start_dt						date,
	session_end_dt							date,
	audit_log_id							audit_log_id constraint	AdtSatsangSessions_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_scheduled_activities
(
	id										int						identity(1,1) constraint	AdtScheduledActivities_PK_Id primary key,
	scheduled_activity_id					generic_entity_id,
	activity_id								generic_entity_id,
	activity_dt								date,
	satsang_session_type_id					generic_entity_id,
	venue									varchar(30),
	alternate_venue							varchar(30),
	is_cancelled							bit,
	audit_log_id							audit_log_id constraint	AdtScheduledActivities_FK_AuditLogId references	audit_logs,
)
GO
--===================================================
create table adt_setup_activities
(
	id										int						identity(1,1) constraint	AdtSetupActivities_PK_Id primary key,
	setup_activity_id						generic_entity_id,
	activity_id								generic_entity_id,
	week_no									tinyint,
	offset_days								smallint,
	satsang_session_type_id					generic_entity_id,
	venue									varchar(30),
	alternate_venue							varchar(30),
	audit_log_id							audit_log_id constraint	AdtSetupActivities_FK_AuditLogId references	audit_logs,
)
GO

--HASH:48561601931091381112393510142119822081