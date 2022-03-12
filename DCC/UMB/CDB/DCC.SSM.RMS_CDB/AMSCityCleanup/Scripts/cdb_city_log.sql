USE [Hostels]
GO

/****** Object:  Table [dbo].[cdb_city_log]    Script Date: 05/08/2015 10:30:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cdb_city_log]') AND type in (N'U'))
DROP TABLE [dbo].[cdb_city_log]
GO

USE [Hostels]
GO

/****** Object:  Table [dbo].[cdb_city_log]    Script Date: 05/08/2015 10:30:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cdb_city_log](
	[user_no] UserId NOT NULL,
	[operation_dtm] datetime NOT NULL,
	[original_city_nm] Address NOT NULL,
	[cdb_city_id] [int] NOT NULL,
	[records_affected] [int] NOT NULL,
	[vst_id]	INT	NULL
) ON [PRIMARY]

GO
