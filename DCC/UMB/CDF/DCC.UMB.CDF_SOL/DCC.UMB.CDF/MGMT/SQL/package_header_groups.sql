if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ApplicationMenuGroups_ApplicationMenuGroups]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[package_menu_groups] DROP CONSTRAINT FK_ApplicationMenuGroups_ApplicationMenuGroups
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ApplicationMenuGroups_ApplicationMenus]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[package_menus] DROP CONSTRAINT FK_ApplicationMenuGroups_ApplicationMenus
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[package_menu_groups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[package_menu_groups]
GO

CREATE TABLE [dbo].[package_menu_groups] (
	[group_id] [int] IDENTITY (1, 1) NOT NULL ,
	[package_id] [package_id] NOT NULL ,
	[parent_group_id] [int] NULL ,
	[group_nm] [gnc_nm] NOT NULL ,
	[group_desc] [gnc_description] NULL ,
	[ctrl_key_accessor] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[display_order] [smallint] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[package_menu_groups] WITH NOCHECK ADD 
	CONSTRAINT [PK_application_menu_groups] PRIMARY KEY  CLUSTERED 
	(
		[group_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[package_menu_groups] ADD 
	CONSTRAINT [UK_applicationid_groupnm] UNIQUE  NONCLUSTERED 
	(
		[package_id],
		[group_nm]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[package_menu_groups] ADD 
	CONSTRAINT [FK_ApplicationMenuGroups_ApplicationMenuGroups] FOREIGN KEY 
	(
		[parent_group_id]
	) REFERENCES [dbo].[package_menu_groups] (
		[group_id]
	),
	CONSTRAINT [FK_PackageMenuGroups_Packages_PackageId] FOREIGN KEY 
	(
		[package_id]
	) REFERENCES [dbo].[packages] (
		[package_id]
	)
GO

