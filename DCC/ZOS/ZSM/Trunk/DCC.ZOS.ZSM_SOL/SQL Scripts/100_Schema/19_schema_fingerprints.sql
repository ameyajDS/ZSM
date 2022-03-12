USE [ZSM_Photos]
GO

/* ==================================================================================
    Source File		:	schema_fingerprints.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	Sun May 8, 2016
    Version			:	1.00
    Last updated	:	May 8, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	 
   ==================================================================================*/


/****** Object:  Table [dbo].[sewadars_fingerprints]    Script Date: 05/08/2016 12:36:21 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sewadars_fingerprints](
	[sewadar_id] [int] NOT NULL,
	[sewadar_fingerprint] [image] NOT NULL,
	[fingerprint_dt] [datetime] NOT NULL,
 CONSTRAINT [SewadarsFingerPrint_PK_SewadarID] PRIMARY KEY NONCLUSTERED 
(
	[sewadar_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'SewadarsPhotos_CK_FingerprintDt', @value=N'Finger Print Date cannot be in future' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sewadars_fingerprints'
GO

ALTER TABLE [dbo].[sewadars_fingerprints]  WITH CHECK ADD  CONSTRAINT [SewadarsFingerPrints_CK_fingerprintDt] CHECK  (([fingerprint_dt]<=getdate()))
GO

ALTER TABLE [dbo].[sewadars_fingerprints] CHECK CONSTRAINT [SewadarsFingerprints_CK_FingerprintDt]
GO


CREATE TABLE [dbo].[adt_sewadars_fingerprints](
	[audit_log_id] [int] NOT NULL,
	[sewadar_id] [int] NOT NULL,
	[sewadar_fingerprints] [image] NOT NULL,
	[fingerprint_dt] [datetime] NOT NULL,
 CONSTRAINT [AdtSewadarsfingerprint_PK_AuditLogId_SewadarId] PRIMARY KEY NONCLUSTERED 
(
	[audit_log_id] ASC,
	[sewadar_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


