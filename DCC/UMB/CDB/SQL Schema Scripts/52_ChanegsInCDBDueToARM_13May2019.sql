create table master_satsangs
(
	master_satsang_id		int						not null	identity (1, 1)
																constraint MasterSatsangs_PK_MasterSatsangID
																	primary	key	nonclustered,

	satsang_session_id		smallint				not null	constraint MasterSatsangs_FK_SatsangSessoinId
																	references	satsang_sessions,

	master_satsang_dt		date					not null,

	is_cancelled			bit						not null,

	txn_ts					rowversion				not null,

	audit_log_id			audit_log_id			not null	constraint MasterSatsangs_FK_AuditLogID
																	references	audit_logs,

		constraint	MasterSatsangs_UK1_MasterSatsangDt
			unique	(master_satsang_dt)
)
go


-- =====================================================================================================================================================================
--	Pincode table is child of level 2 & level 3. 
--  We are going to save Pincodes only of INDIA / or any other country - so we are going to allow either L2 or L3 for saving pincode
--
--	There can be - one city and one pincode OR one city Many pincodes -- this is because in bigger cities there are many Post Offices - and pincodes are per Post Office
--
--	When auto filling details on screen by enterting just the pincode, if there is only one entry in this table that can be auto filled, 
--	Otherwise more details (C + L1 + L2 + L3 + Pincode) can be shown and the user can select the entry he wants
-- =====================================================================================================================================================================
create table pincodes
(
	pincode_id					int				not null	identity (1, 1)
															constraint Pincodes_PK_PincodeID
																primary key ,

	--[[ One of the 2 will have value 																	
	level_2_component_id		int					null	constraint Pincodes_FK_Level2ComponentId
																references level_2_address_components,

	level_3_component_id		int					null	constraint Pincodes_FK_Level3ComponentId
																references level_3_address_components,
	
	pincode_number				nvarchar(11)	not null,

	effective_from_dt			date			not null,
	
	effective_till_dt			date			not null,

	txn_ts						rowversion		not null,

	audit_log_id				audit_log_id	not null	constraint Pincodes_FK_AuditLogID 
																references audit_logs,

		constraint	Pincodes_CK_EffectiveDates
			check (effective_from_dt < effective_till_dt),

		constraint	Pincodes_UK_Level2Level3Pincode
			unique (pincode_number, level_2_component_id, level_3_component_id),

		constraint Pincodes_CK_Level2Level3
			check (
							(level_2_component_id is not null and level_3_component_id is null) 
							or 
							(level_2_component_id is null and level_3_component_id is not null) 
					)
);
exec sp_addextendedproperty 'Pincodes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'pincodes'
exec sp_addextendedproperty 'Pincodes_UK_Level2Level3Pincode', 'Level 2 + Level 3 Component + Pincode must be unique', 'USER', 'dbo', 'TABLE', 'pincodes'
exec sp_addextendedproperty 'Pincodes_CK_Level2Level3', 'Either Level 2 or Level 3 Component should be entered', 'USER', 'dbo', 'TABLE', 'pincodes'
GO


-- ====================================================================================================
---  professions
--	====================================================================================================
CREATE	TABLE	professions
(
	profession_id				int					not null		identity(1,1)
																	constraint Professions_PK_ProfessionID
																		primary	key	clustered,
																			
	profession_cd				varchar(50)			not null		constraint	Professions_U1_ProfessionCode
																		unique nonclustered,

	profession_nm				varchar(200)		not null		constraint	Professions_U2_ProfessionName
																		unique nonclustered,
	effective_from_dt			date				not null,
	
	effective_till_dt			date				not null,
	
	txn_ts						rowversion			not null,
	
	audit_log_id				audit_log_id		not null		constraint Professions_FK_AuditLogID
																	references	audit_logs,
		constraint	Professions_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'Professions_U1_ProfessionCode','Profession Code must be unique.','USER','dbo','TABLE','professions'	
exec sp_addextendedproperty 'Professions_U2_ProfessionName','Profession Name must be unique.','USER','dbo','TABLE','professions'	
exec sp_addextendedproperty 'Professions_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'professions'
GO


-- ====================================================================================================
-- designations for professions
-- ====================================================================================================
CREATE TABLE designation_for_professions
(
	designation_for_profession_id		int					not null	identity(1,1)
																		constraint DesignationForProfessions_PK_DesignationForProfessionID
																			primary	key	nonclustered,

	designation_for_profession_cd		varchar(50)			not null	constraint	DesignationForProfessions_U1_DesignationForProfessionCode
																		unique nonclustered,

	designation_for_profession_nm		varchar(200)		not null	constraint	DesignationForProfessions_U2_DesignationForProfessionName
																		unique nonclustered,

	effective_from_dt					date				not null,
	
	effective_till_dt					date				not null,
	
	txn_ts								rowversion			not null,
	
	audit_log_id						audit_log_id		not null	constraint DesignationForProfessions_FK_AuditLogID
																			references	audit_logs,
		
		constraint	DesignationForProfessions_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'DesignationForProfessions_U1_DesignationForProfessionCode','Designation Code must be unique.','USER','dbo','TABLE','designation_for_professions'	
exec sp_addextendedproperty 'DesignationForProfessions_U2_DesignationForProfessionName','Designation Name must be unique.','USER','dbo','TABLE','designation_for_professions'	
exec sp_addextendedproperty 'DesignationForProfessions_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'designation_for_professions'
GO


-- ====================================================================================================
-- profession_designations
-- ====================================================================================================
CREATE TABLE profession_designations
(
	profession_designation_id			int					not null	identity(1,1)
																		constraint ProfessionDesignations_PK_ProfessionDesignationID
																			primary	key	nonclustered,

	profession_id						int					not null	constraint ProfessionDesignations_FK_ProfessionID
																			references	professions,

	designation_for_profession_id		int					not null	constraint ProfessionDesignations_FK_DesignationForProfessionID
																			references	designation_for_professions,
																			
	effective_from_dt					date				not null,
	
	effective_till_dt					date				not null,
	
	txn_ts								rowversion			not null,
	
	audit_log_id						audit_log_id		not null	constraint ProfessionDesignations_FK_AuditLogID
																			references	audit_logs,

		constraint	ProfessionDesignations_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'ProfessionDesignations_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'profession_designations'
GO
