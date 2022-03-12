-- ====================================================================================================
-- working_unit_groups
-- Lot of reoprts require clubbing of departments - some like Shopping complex has so mnay units / sections 
-- OR the closed department names still have retirees in them and the reporting should be by current active department
-- SO - this table will define a group and the chidl table will tell us the others included in them
-- ===================================================================================================================

--drop table working_unit_group_members
--drop table working_unit_groups

CREATE TABLE working_unit_groups
(
	working_unit_group_id				int					not null	identity(1,1)
																		constraint WorkingUnitGroups_PK_WorkingUnitGroupID
																			primary	key	nonclustered,

	parent_working_unit_id				smallint			not null	constraint WorkingUnitGroups_FK_ParentWorkingUnitID
																			references working_units,

	working_unit_group_nm				varchar(200)		not null	constraint WorkingUnitGroups_U2_WorkingUnitGroupName
																		unique nonclustered,

	effective_from_dt					date				not null,
	
	effective_till_dt					date				not null,
	
	txn_ts								rowversion			not null,
	
	audit_log_id						audit_log_id		not null	constraint WorkingUnitGroups_FK_AuditLogID
																			references	audit_logs,
		
		constraint	WorkingUnitGroups_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'WorkingUnitGroups_U2_WorkingUnitGroupName','Working Unit Group Name must be unique.','USER','dbo','TABLE','working_unit_groups'	
exec sp_addextendedproperty 'WorkingUnitGroups_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'working_unit_groups'
GO


-- ====================================================================================================
-- working_unit_group_members
-- This table will store the departments that should be part of a workign unit group 
-- =====================================================================================================
CREATE TABLE working_unit_group_members
(
	working_unit_group_member_id		int					not null	identity(1,1)
																		constraint WorkingUnitGroupMembers_PK_WorkingUnitGroupMemberID
																			primary	key	nonclustered,

	working_unit_group_id				int					not null	constraint WorkingUnitGroupMembers_FK_WorkingUnitGroupID
																			references	working_unit_groups,

	member_working_unit_id				smallint			not null	constraint WorkingUnitGroupMembers_FK_MemberWorkingUnitID
																			references working_units,

	effective_from_dt					date				not null,
	
	effective_till_dt					date				not null,
	
	txn_ts								rowversion			not null,
	
	audit_log_id						audit_log_id		not null	constraint WorkingUnitGroupMembers_FK_AuditLogID
																			references	audit_logs,

		constraint	WorkingUnitGroupMembers_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt),

		constraint	WorkingUnitGroupMembers_UK_GroupAndMember
				unique (working_unit_group_id, member_working_unit_id)
)
go

exec sp_addextendedproperty 'WorkingUnitGroupMembers_UK_GroupAndMember','A Working Unit can be added to a Group only once!','USER','dbo','TABLE','working_unit_group_members'	
exec sp_addextendedproperty 'WorkingUnitGroupMembers_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'working_unit_group_members'
GO


--insert into working_unit_groups (parent_working_unit_id, working_unit_group_nm, effective_from_dt, effective_till_dt, audit_log_id)
--							select working_unit_id, working_unit_nm, effective_from, effective_till, 2 from working_units where society_id = 1 and working_unit_entity_id = 4 and effective_till > getdate()

select * from working_unit_groups

--insert into working_unit_group_members (working_unit_group_id, member_working_unit_id, effective_from_dt, effective_till_dt, audit_log_id)
--							select (select working_unit_group_id from working_unit_groups where parent_working_unit_id = wu.working_unit_id), working_unit_id, effective_from, effective_till, 2 from working_units wu where society_id = 1 and working_unit_entity_id = 4 and effective_till > getdate()

select * from working_unit_group_members