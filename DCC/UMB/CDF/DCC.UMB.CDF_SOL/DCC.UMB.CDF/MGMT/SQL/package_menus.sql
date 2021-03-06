if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[package_menus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[package_menus]
GO

CREATE TABLE [dbo].[package_menus] (
	[group_id] [int] NOT NULL ,
	[menu_nm] [gnc_nm] NOT NULL ,
	[menu_desc] [gnc_description] NULL ,
	[screen_params] [gnc_description] NULL ,
	[ctrl_key_accessor] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[display_order] [smallint] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[package_menus] ADD 
	CONSTRAINT [UK_ApplicationMenus_GroupId_MenuDesc] UNIQUE  NONCLUSTERED 
	(
		[group_id],
		[menu_desc]
	)  ON [PRIMARY] ,
	CONSTRAINT [UK_ApplicationMenus_MenuNm_GroupId] UNIQUE  NONCLUSTERED 
	(
		[menu_nm],
		[group_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[package_menus] ADD 
	CONSTRAINT [FK_ApplicationMenuGroups_ApplicationMenus] FOREIGN KEY 
	(
		[group_id]
	) REFERENCES [dbo].[package_menu_groups] (
		[group_id]
	)
GO

