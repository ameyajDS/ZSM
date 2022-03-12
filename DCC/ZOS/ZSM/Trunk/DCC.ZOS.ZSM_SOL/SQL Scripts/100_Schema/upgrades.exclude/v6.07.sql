USE SysAdmin
GO

CREATE TABLE [dbo].[app_users](
	[user_no] [dbo].[user_no] IDENTITY(1,1) NOT NULL,
	[user_id]  VARCHAR(20) NOT NULL,
	[user_nm]  VARCHAR(50) NOT NULL,
	[password] BINARY(64) NOT NULL,
	[salt]	   UNIQUEIDENTIFIER,
	[activation_dt] [smalldatetime] NOT NULL DEFAULT (getdate()),
	[deactivation_dt] [smalldatetime] NULL
CONSTRAINT [PK_app_users] PRIMARY KEY NONCLUSTERED 
(
	[user_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE Table dbo.app_users_priviledges
(
	[user_no]			[dbo].[user_no] NOT NULL,
	[user_id] 			VARCHAR(20)	NOT NULL,
	sewa_id				INT NOT NULL,
	sewa_team_id		INT NOT NULL,
	in_out_applicable		INT	NOT NULL DEFAULT ('No'),
	is_admin			char(3)		NULL DEFAULT (0),		

	CONSTRAINT [FK_app_users_priviledges_app_users] FOREIGN KEY([user_no])
	REFERENCES [dbo].[app_users] ([user_no])
)
GO
