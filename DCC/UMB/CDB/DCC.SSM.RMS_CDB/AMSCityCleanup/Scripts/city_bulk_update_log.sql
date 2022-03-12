USE [Hostels]
GO

/****** Object:  Table [dbo].[city_bulk_update_log]    Script Date: 05/08/2015 10:30:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[city_bulk_update_log]') AND type in (N'U'))
DROP TABLE [dbo].[city_bulk_update_log]
GO

USE [Hostels]
GO

/****** Object:  Table [dbo].[city_bulk_update_log]    Script Date: 05/08/2015 10:30:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[city_bulk_update_log](
	[Vst_ID] [int] NOT NULL,
	[Old_Vst_City] [Address] NOT NULL,
	[New_Vst_City] [Address] NOT NULL,
	[Sta_ID] [INT] NOT NULL,
	[cdb_city_id] [INT] NOT NULL,
	[operation_dtm] [datetime] NOT NULL
) ON [PRIMARY]

GO


