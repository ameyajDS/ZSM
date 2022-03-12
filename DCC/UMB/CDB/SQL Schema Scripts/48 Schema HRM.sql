-- ====================================================================================================
---  nationalities
--	====================================================================================================
CREATE	TABLE	nationalities
(
	nationality_id				int					not null		identity(1,1)
																		constraint	Nationalities_PK_NationalityID
																			primary	key	nonclustered,
																			
	nationality_nm				varchar(200)		not null		constraint	Nationalities_U1_NationalityName
																		unique clustered,
	effective_from_dt			date				not null,
	
	effective_till_dt			date				not null,
	
	txn_ts						rowversion			not null,
	
	audit_log_id				audit_log_id		not null		constraint Nationalities_FK_AuditLogID
																	references	audit_logs,
		constraint	Nationalities_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'Nationalities_U1_NationalityName','Nationality Name must be unique.','USER','dbo','TABLE','nationalities'	
exec sp_addextendedproperty 'Nationalities_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'nationalities'
GO

-- ====================================================================================================
---  religions 
--	====================================================================================================
CREATE	TABLE	religions
(
	religion_id					int					not null		identity(1,1)
																		constraint	Religions_PK_ReligionID
																			primary	key	nonclustered,
																			
	religion_nm					varchar(200)		not null		constraint	Religions_U1_ReligionName
																		unique clustered,
	effective_from_dt			date				not null,
	
	effective_till_dt			date				not null,
	
	txn_ts						rowversion			not null,
	
	audit_log_id				audit_log_id		not null		constraint Religions_FK_AuditLogID
																	references	audit_logs,
		constraint	Religions_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'Religions_U1_ReligionName','Religion must be unique.','USER','dbo','TABLE','religions'	
exec sp_addextendedproperty 'Religions_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'religions'
GO


--	====================================================================================================
---  castes 
--	====================================================================================================
CREATE	TABLE	castes
(
	caste_id					int					not null		identity(1,1)
																		constraint	Castes_PK_CasteID
																			primary	key	nonclustered,
																			
	caste_nm					varchar(200)		not null		constraint	Castes_U1_CasteName
																		unique clustered,
	effective_from_dt			date				not null,
	
	effective_till_dt			date				not null,
	
	txn_ts						rowversion			not null,
	
	audit_log_id				audit_log_id		not null		constraint Castes_FK_AuditLogID
																	references	audit_logs,
		constraint	Castes_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'Castes_U1_CasteName','Casete Name must be unique.','USER','dbo','TABLE','castes'	
exec sp_addextendedproperty 'Castes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'castes'
GO


create table org_roles
(
	org_role_id				int						not null	identity (1, 1)
																	constraint OrgRoles_PK_OrgRoleId
																		primary key	nonclustered,
	org_role_nm				varchar (200)			not null,

	is_root					bit						not null,
	
	is_leaf					bit						not null,

	--- this is the parent node of the current role. it is not specified for root nodes.
	group_org_role_id		int							null	constraint OrgRoles_FK_GroupOrgRoleId
																	references org_roles,
																	
	designation_id			smallint					null	constraint OrgRoles_FK_DesignationId
																	references designations, 																	

	org_role_flat_name		varchar(1000)				null,

	effective_from			datetime				not null,
	
	effective_till			datetime				not null,
	
	txn_ts					rowversion				not null,

		constraint	Roles_U1_RoleNm_GroupRoleId
			unique nonclustered	(org_role_nm, group_org_role_id),

		constraint	Roles_CK1_GroupOrgRoleId_IsRoot
			check	(	(	is_root = 1		and	group_org_role_id	is null		)
					or	(	is_root = 0		and	group_org_role_id	is not null	)
					),
					
		constraint	Roles_CK2_IsRoot_IsLeaf_Relations
			check	(	(	is_root = 1		and	is_leaf = 0	)
					or	(	is_root = 0		and	is_leaf = 0	)
					or	(	is_root = 0		and	is_leaf = 1	)
					),

		constraint	Roles_CK3_Designation_Only_On_Leaf
			check	(	(	is_root = 1 and	 is_leaf = 0 and designation_id	is null		)
					or  (	is_root = 0	and	 is_leaf = 1 and designation_id	is not null	)
					or  (	is_root = 0	and	 is_leaf = 0 and designation_id	is null	)
					),

		constraint	Roles_CK4_EffectiveDates
				check	(effective_from <= effective_till)

)

exec sp_addextendedproperty 'Roles_U1_RoleNm_GroupRoleId','Role name must be unique with-in a group.','USER','dbo','TABLE','roles'	
exec sp_addextendedproperty 'Roles_CK1_GroupRoleId_IsRoot','Root nodes cannot have Group Role ID defined.','USER','dbo','TABLE','roles'	
exec sp_addextendedproperty 'Roles_CK2_IsRoot_IsLeaf_Relations','A node cannot be Root & Leaf both.','USER','dbo','TABLE','roles'	
exec sp_addextendedproperty 'Roles_CK3_Designation_Only_On_Leaf','Only a leaf node can have a designation assigned to it.','USER','dbo','TABLE','roles'	
exec sp_addextendedproperty 'Roles_CK4_EffectiveDates','Effective From Date must be before Effective Till Date.','USER','dbo','TABLE','roles'	



create table org_role_applicability
(
	org_role_applicability_id		int		not null	identity(1,1)
														constraint OrgRolesApplicability_PK_OrgRoleApplicabilityID
															primary key clustered,
	
	society_id					smallint	not null	constraint	OrgRolesApplicability_FK_SocietyId
															references societies,

	working_unit_id				smallint	not null	constraint	OrgRolesApplicability_FK_WorkingUnitId
															references working_units,

	org_role_id						int		not null	constraint	OrgRolesApplicability_FK_OrgRoleId
															references org_roles,
																	
	txn_ts					rowversion		not null
																		
)
