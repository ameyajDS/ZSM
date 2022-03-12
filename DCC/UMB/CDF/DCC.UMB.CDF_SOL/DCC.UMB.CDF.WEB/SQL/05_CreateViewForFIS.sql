use FIS
GO

if exists (select top 1 1 from sysobjects where type = 'v' and name='Charan')
BEGIN
	DROP VIEW Charan
END
GO
CREATE VIEW Charan AS SELECT * FROM dsql2k.FIS.dbo.Charan
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='Countries')
BEGIN
	DROP VIEW Countries
END
GO
CREATE VIEW Countries AS SELECT * FROM dsql2k.FIS.dbo.Countries
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='Gurinder')
BEGIN
	DROP VIEW Gurinder
END
GO
CREATE VIEW Gurinder AS SELECT * FROM dsql2k.FIS.dbo.Gurinder
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='Rep')
BEGIN
	DROP VIEW Rep
END
GO
CREATE VIEW Rep AS SELECT * FROM dsql2k.FIS.dbo.Rep
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmCONTROL')
BEGIN
	DROP VIEW nqmCONTROL
END
GO
CREATE VIEW nqmCONTROL AS SELECT * FROM dsql2k.FIS.dbo.nqmCONTROL
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmCOUNTRY')
BEGIN
	DROP VIEW nqmCOUNTRY
END
GO
CREATE VIEW nqmCOUNTRY AS SELECT * FROM dsql2k.FIS.dbo.nqmCOUNTRY
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPATRON')
BEGIN
	DROP VIEW nqmPATRON
END
GO
CREATE VIEW nqmPATRON AS SELECT * FROM dsql2k.FIS.dbo.nqmPATRON
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPLACE')
BEGIN
	DROP VIEW nqmPLACE
END
GO
CREATE VIEW nqmPLACE AS SELECT * FROM dsql2k.FIS.dbo.nqmPLACE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmREPRESENTATIVE')
BEGIN
	DROP VIEW nqmREPRESENTATIVE
END
GO
CREATE VIEW nqmREPRESENTATIVE AS SELECT * FROM dsql2k.FIS.dbo.nqmREPRESENTATIVE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqrPATRON')
BEGIN
	DROP VIEW nqrPATRON
END
GO
CREATE VIEW nqrPATRON AS SELECT * FROM dsql2k.FIS.dbo.nqrPATRON
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqtFIS')
BEGIN
	DROP VIEW nqtFIS
END
GO
CREATE VIEW nqtFIS AS SELECT * FROM dsql2k.FIS.dbo.nqtFIS
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqvFIS')
BEGIN
	DROP VIEW nqvFIS
END
GO
CREATE VIEW nqvFIS AS SELECT * FROM dsql2k.FIS.dbo.nqvFIS
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_GroupSecurity')
BEGIN
	DROP VIEW sm_GroupSecurity
END
GO
CREATE VIEW sm_GroupSecurity AS SELECT * FROM dsql2k.FIS.dbo.sm_GroupSecurity
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_Security')
BEGIN
	DROP VIEW sm_Security
END
GO
CREATE VIEW sm_Security AS SELECT * FROM dsql2k.FIS.dbo.sm_Security
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_employee')
BEGIN
	DROP VIEW sm_employee
END
GO
CREATE VIEW sm_employee AS SELECT * FROM dsql2k.FIS.dbo.sm_employee
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='dtproperties')
BEGIN
	DROP VIEW dtproperties
END
GO
CREATE VIEW dtproperties AS SELECT * FROM dsql2k.FIS.dbo.dtproperties
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='syssegments')
BEGIN
	DROP VIEW syssegments
END
GO
CREATE VIEW syssegments AS SELECT * FROM dsql2k.FIS.dbo.syssegments
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sysconstraints')
BEGIN
	DROP VIEW sysconstraints
END
GO
CREATE VIEW sysconstraints AS SELECT * FROM dsql2k.FIS.dbo.sysconstraints
GO
