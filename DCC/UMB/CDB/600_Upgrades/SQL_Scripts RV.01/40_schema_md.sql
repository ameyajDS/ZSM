/* =================================================================================================
	Author(s)     : Jitendra Loyal
	Started On    : Thu Mar 28 14:23 IST 2013
	Last updated  : Nov 28, 2013
	Module		  :	Meta-data (CDB)
	Reviewed By   : 
	Reviewed On   : 
 ===================================================================================================
                                                                                         Usage Notes
 ---------------------------------------------------------------------------------------------------
		Schema for the Data Fixing as well as for managing Address Component changes (viz., rename, merge and split).
		Therefore, the tables comprise of
			(a) meta-information about the entities involved,
			(b) log information of operations, and
			(c) user-roles permitted for managing entities.
		Refer following Wiki pages for details:
				https://www.dccapps.org/pm/issues/999
				https://www.dccapps.org/pm/projects/cdb/wiki/Data_Fixing	
				https://www.dccapps.org/pm/projects/cdb/wiki/Procedure_for_configuring_it_for_an_Entity
 ===================================================================================================
                                                                                    Revision History
 ---------------------------------------------------------------------------------------------------
 	JL : 26, 27, 28-Nov-2013
		* Moved to CDB so as to also manage the Address Components operations.
		* Storing affected instances before operation for posterity.
	JL : 28, 29-Mar-2013
		* Initial Version
================================================================================================= */



-- ====================================================================================================
--	Entities whose references are to be affected.
-- ====================================================================================================

CREATE TABLE	md_entities
(
	entity_id					entity_id		NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	Entities_PK_EntityID
																PRIMARY KEY,
	entity_nm					gnc_nm			NOT NULL	CONSTRAINT	Entities_UK_EntityNm
																UNIQUE	NONCLUSTERED,
	entity_db					database_nm		NOT NULL,
	entity_tbl					table_nm		NOT NULL,
	entity_id_column			column_nm		NOT NULL,
	entity_nm_column			column_nm		NOT NULL,
	effective_from_dt_column	column_nm			NULL,
	effective_till_dt_column	column_nm			NULL,
	active_column				column_nm			NULL,
	active_value				column_value		NULL,
	inactive_value				column_value		NULL,
	additional_info_column		column_nm			NULL,
	additional_info_label		gnc_nm				NULL,
	
		CONSTRAINT	Entities_CK_EffectiveFromDateColumn_ActiveColumn
			CHECK	(	(	effective_from_dt_column	IS NOT NULL	AND	active_column	IS NULL		)
					OR	(	effective_from_dt_column	IS NULL		AND	active_column	IS NOT NULL	)
					OR	(	effective_from_dt_column	IS NULL		AND	active_column	IS NULL		)
					),

		CONSTRAINT	Entities_CK_EffectiveDateColumns
			CHECK	(	(	effective_from_dt_column	IS NOT NULL	AND	effective_till_dt_column	IS NOT NULL	)
					OR	(	effective_from_dt_column	IS NULL		AND	effective_till_dt_column	IS NULL		)
					),

		CONSTRAINT	Entities_CK_ActiveColumnsInformation
			CHECK	(	(	active_column	IS NOT NULL	AND	active_value	IS NOT NULL	AND	inactive_value	IS NOT NULL	)
					OR	(	active_column	IS NULL		AND	active_value	IS NULL		AND	inactive_value	IS NULL		)
					),

		CONSTRAINT	Entities_CK_AdditionalColumnsInformation
			CHECK	(	(	additional_info_column	IS NOT NULL	AND	additional_info_label	IS NOT NULL	)
					OR	(	additional_info_column	IS NULL		AND	additional_info_label	IS NULL		)
					),
)
GO


-- ====================================================================================================
--	Entity References which actually get affected.
-- ====================================================================================================

CREATE TABLE	md_entities_references
(
	entity_reference_id		entity_reference_id	NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	EntitiesReferences_PK_EntityReferenceID
																PRIMARY KEY,
	entity_id				entity_id			NOT NULL	CONSTRAINT	EntitiesReferences_FK_EntityID
																REFERENCES	md_entities,
	reference_db			database_nm			NOT NULL,
	reference_tbl			table_nm			NOT NULL,
	reference_column		column_nm			NOT NULL,

		--- Following bits signify whether the Entity's Reference is to be changed on (a) Rename, (b) Merge, and (c) Split, 
		--- or the Original Value is to be retained. One of the two BITs is set only for geographical locations (or address components).
	reflect_change			BIT					NOT NULL	CONSTRAINT	EntitiesReferences_DF_ReflectChange
																DEFAULT	0,
	retain_original			BIT					NOT NULL	CONSTRAINT	EntitiesReferences_DF_RetainOriginal
																DEFAULT	0,
		
		CONSTRAINT	EntitiesReferences_UK_EntityID_ReferenceDB_ReferenceTable_ReferenceColumn
			UNIQUE	NONCLUSTERED	(	entity_id, reference_db, reference_tbl, reference_column	),

		CONSTRAINT	EntitiesReferences_CK_ReflectChange_RetainOriginal
			CHECK	(	(	reflect_change	=	0	AND	retain_original	=	0	)		--- Entity reference is kept only for data fix
					OR	(	reflect_change	=	1	AND	retain_original	=	0	)
					OR	(	reflect_change	=	0	AND	retain_original	=	1	)
				)
)
GO

-- ====================================================================================================
--	Primary Key Columns of Entity References, which are stored for posterity when any operation is done.
-- ====================================================================================================

CREATE TABLE	md_entities_references_pk_columns
(
	entity_reference_id			entity_reference_id	NOT NULL	CONSTRAINT	EntitiesReferencesPKColumns_FK_EntityID
																	REFERENCES	md_entities_references,
	pk_column_nm				column_nm			NOT NULL,
	pk_column_sq				TINYINT				NOT NULL,


		CONSTRAINT	EntitiesReferencesPKColumns_PK_EntityReferenceID_PKColumnName
			PRIMARY KEY		(	entity_reference_id, pk_column_nm	),

		CONSTRAINT	EntitiesReferencesPKColumns_PK_EntityReferenceID_PKColumnSequence
			UNIQUE NONCLUSTERED		(	entity_reference_id, pk_column_sq	)
)
GO

-- ====================================================================================================
-- Preceding Entities that may be required for the user to give the context of the Entity
-- ====================================================================================================

CREATE TABLE	md_preceding_entities
(
	entity_id					entity_id		NOT NULL	CONSTRAINT	PrecedingEntities_FK_EntityID
																REFERENCES	md_entities,
		--- This is the column that is referred. For example, country_id in states table; so this column exists
		--- in the entity table, if there is only one preceding entity; otherwise this column exists in the next
		--- preceding entity (obtained by adding 1 to the display_order). The column of the last (with the highest
		--- display_order value) will always be in the entity table.
	entity_id_column			column_nm		NOT NULL,

		--- This is the information about the preceding entity
	preceding_entity_nm			gnc_nm			NOT NULL,
	preceding_entity_db			database_nm		NOT NULL,
	preceding_entity_tbl		table_nm		NOT NULL,
	preceding_entity_id_column	column_nm		NOT NULL,
	preceding_entity_nm_column	column_nm		NOT NULL,

		--- This signifies the order of preceding entities; lower number signifies the topmost referenced entity like countries.
		--- Higher number signifies the next level of entities. For example, level 1 entity will be countries, 2 will be states,
		--- and 3 will be districts.
	display_order				SMALLINT		NOT NULL,
		
		CONSTRAINT	EntitiesReferences_PK_EntityID_DisplayOrder
			PRIMARY KEY		(	entity_id, display_order	),
		
		CONSTRAINT	EntitiesReferences_U1_EntityID_PrecedingEntityName
			UNIQUE	NONCLUSTERED
				(	entity_id, preceding_entity_nm	),
		
		CONSTRAINT	EntitiesReferences_U2_EntityID_PrecedingEntityDB_PrecedingEntityTable_PrecedingEntityIDColumn
			UNIQUE	NONCLUSTERED
				(	entity_id, preceding_entity_db, preceding_entity_tbl, preceding_entity_id_column	)
)
GO

-- ====================================================================================================
-- This table stores log of operations carried out
-- ====================================================================================================

CREATE TABLE	md_entities_operations_log
(
 	entity_operation_id			INTEGER			NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	EntitiesOperationsLog_PK_EntityOperationID
																PRIMARY KEY,
	entity_id					entity_id		NOT NULL	CONSTRAINT	EntitiesOperationsLog_FK_EntityID
																REFERENCES	md_entities,
	user_no						INTEGER			NOT NULL,
	user_role_id				user_role_id	NOT NULL,
	operation					VARCHAR (10)	NOT NULL	CONSTRAINT	EntitiesOperationsLog_CK_Operation
																CHECK	(	operation	IN	(	'Fix',		--- Here the old "dirty" value is replaced with new "clean" value.
																								'Rename',	--- The entity has been renamed, and thus wherever reflect_change is set, the references are changed.
																								'Split',	--- The entity (geographical location) has been split, and thus wherever reflect_change is set, the affected references are changed.
																								'Merge'		--- The entity (geographical location) has been merged, and thus wherever reflect_change is set, the affected references are changed.
																							)
																		),
	operation_start_dtm			DATETIME		NOT NULL	CONSTRAINT	EntitiesOperationsLog_DF_OperationStartDTM
																DEFAULT	GetDate(),
	operation_finish_dtm		DATETIME			NULL,

	old_value					column_value	NOT	NULL,
	new_value					column_value	NOT	NULL,

	occurrences_replaced		INTEGER				NULL,
	references_affected			VARCHAR (6000)		NULL,
		
		CONSTRAINT	EntitiesOperationsLog_UK_EntityID_OperationStartDateTime
			UNIQUE	NONCLUSTERED
				(	entity_id, operation_start_dtm	)
)
GO


-- ====================================================================================================
-- This table stores the affected entities before the operation is carried out.
-- ====================================================================================================

CREATE TABLE	md_entities_operations_instances_log
(
	entity_operation_id			INTEGER			NOT NULL	CONSTRAINT	EntitiesOperationsInstancesLog_FK_EntityOperationID
																	REFERENCES	md_entities_operations_log,
	entity_reference_id			INTEGER			NOT NULL	CONSTRAINT	EntitiesOperationsInstancesLog_FK_EntityReferenceID
																	REFERENCES	md_entities_references,
	pk_column_1_value			column_value	NOT NULL,
	pk_column_2_value			column_value		NULL,
	pk_column_3_value			column_value		NULL,
	pk_column_4_value			column_value		NULL,
	pk_column_5_value			column_value		NULL,
	pk_column_6_value			column_value		NULL,
	pk_column_7_value			column_value		NULL,
	pk_column_8_value			column_value		NULL,
	pk_column_9_value			column_value		NULL,

		CONSTRAINT	EntitiesOperationsInstancesLog_UK_EntityOperationID_EntityReferenceID_PKColumns
			UNIQUE
				(	entity_operation_id, entity_reference_id, pk_column_1_value, pk_column_2_value, pk_column_3_value,
					pk_column_4_value, pk_column_5_value, pk_column_6_value, pk_column_7_value, pk_column_8_value, pk_column_9_value
				)
)

-- ====================================================================================================
-- Entities that are assigned to User-roles
-- ====================================================================================================

CREATE TABLE	md_user_roles_entities
(
	user_role_id		user_role_id	NOT NULL,
	entity_id			entity_id		NOT NULL	CONSTRAINT	UserRoleEntities_FK_EntityID
														REFERENCES	md_entities,
		
		CONSTRAINT	UserRolesEntities_PK_UserRoleID_EntityID
			PRIMARY KEY		(	user_role_id, entity_id	)
)
GO

-- ====================================================================================================

-- vim:ts=4 sw=4 ht=4
