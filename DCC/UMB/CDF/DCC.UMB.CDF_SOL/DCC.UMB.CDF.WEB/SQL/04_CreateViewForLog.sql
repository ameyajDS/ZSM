use LOG
go
if exists (select top 1 1 from sysobjects where type = 'v' and name='sessions')
BEGIN
	DROP VIEW sessions
END
GO
CREATE VIEW sessions AS SELECT * FROM dsql2k.LOG.dbo.sessions
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='message_logs')
BEGIN
	DROP VIEW message_logs
END
GO
CREATE VIEW message_logs AS SELECT * FROM dsql2k.LOG.dbo.message_logs
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='report_parameters')
BEGIN
	DROP VIEW report_parameters
END
GO
CREATE VIEW report_parameters AS SELECT * FROM dsql2k.LOG.dbo.report_parameters
GO
