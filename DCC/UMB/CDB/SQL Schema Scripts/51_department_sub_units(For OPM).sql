USE [CDB]
GO
USE [CDB]
GO

ALTER TABLE [dbo].[adt_department_sub_units] DROP CONSTRAINT [AdtDepartmentSubUnit_FK_AuditLogId]
GO

/****** Object:  Table [dbo].[adt_department_sub_units]    Script Date: 08/10/2018 11:28:06 AM ******/
DROP TABLE [dbo].[adt_department_sub_units]
GO

/****** Object:  Table [dbo].[adt_department_sub_units]    Script Date: 08/10/2018 11:28:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[adt_department_sub_units](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department_sub_unit_id] [int] NULL,
	[department_sub_unit_nm] [varchar](500) NULL,
	[print_nm] [varchar](500) NULL,
	[effective_from_dt] [date] NULL,
	[effective_till_dt] [date] NULL,
	[audit_log_id] [dbo].[audit_log_id] NULL,
	[working_unit_id] [int] NULL,
 CONSTRAINT [AdtDepartmentSubUnit_PK_Id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[adt_department_sub_units]  WITH CHECK ADD  CONSTRAINT [AdtDepartmentSubUnit_FK_AuditLogId] FOREIGN KEY([audit_log_id])
REFERENCES [dbo].[audit_logs] ([audit_log_id])
GO

ALTER TABLE [dbo].[adt_department_sub_units] CHECK CONSTRAINT [AdtDepartmentSubUnit_FK_AuditLogId]
GO



drop table department_sub_units

create table department_sub_units
(
	department_sub_unit_id		int					not null		identity(1,1)
																		constraint	DepartmentSubUnits_PK_DepartmentSubUnitID
																			primary	key	nonclustered,
																			
	department_sub_unit_nm		varchar(500)		not null		constraint	DepartmentSubUnits_U1_DepartmentSubUnitName
																		unique clustered,

	print_nm					varchar(500)		not null,

	effective_from_dt			date				not null,
	
	effective_till_dt			date				not null,

	working_unit_id				smallint			not null		constraint DepartmentSubUnits_FK_WorkingUnits
																		references working_units,
	
	txn_ts						rowversion			not null,
	
	audit_log_id				audit_log_id		not null		constraint DepartmentSubUnits_FK_AuditLogID
																	references	audit_logs,
		constraint	DepartmentSubUnits_CK_EffectiveDates
				check (effective_from_dt <= effective_till_dt)
)
go

exec sp_addextendedproperty 'DepartmentSubUnits_U1_DepartmentSubUnitName','Department Sub-Unit Name must be unique.','USER','dbo','TABLE','department_sub_units'	
exec sp_addextendedproperty 'DepartmentSubUnits_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date', 'USER', 'dbo', 'TABLE', 'department_sub_units'
GO

