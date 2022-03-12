USE NDQ2
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='testnqtindian')
BEGIN
	DROP VIEW testnqtindian
END
GO
CREATE VIEW testnqtindian AS SELECT * FROM dsql2k.NDQ2.dbo.testnqtindian
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='testnqtfis')
BEGIN
	DROP VIEW testnqtfis
END
GO
CREATE VIEW testnqtfis AS SELECT * FROM dsql2k.NDQ2.dbo.testnqtfis
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='tempnqmcontrol')
BEGIN
	DROP VIEW tempnqmcontrol
END
GO
CREATE VIEW tempnqmcontrol AS SELECT * FROM dsql2k.NDQ2.dbo.tempnqmcontrol
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='tempnqtindian')
BEGIN
	DROP VIEW tempnqtindian
END
GO
CREATE VIEW tempnqtindian AS SELECT * FROM dsql2k.NDQ2.dbo.tempnqtindian
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='ErrorPO')
BEGIN
	DROP VIEW ErrorPO
END
GO
CREATE VIEW ErrorPO AS SELECT * FROM dsql2k.NDQ2.dbo.ErrorPO
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='dtproperties')
BEGIN
	DROP VIEW dtproperties
END
GO
CREATE VIEW dtproperties AS SELECT * FROM dsql2k.NDQ2.dbo.dtproperties
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sync_parchi')
BEGIN
	DROP VIEW sync_parchi
END
GO
CREATE VIEW sync_parchi AS SELECT * FROM dsql2k.NDQ2.dbo.sync_parchi
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sys_controls')
BEGIN
	DROP VIEW sys_controls
END
GO
CREATE VIEW sys_controls AS SELECT * FROM dsql2k.NDQ2.dbo.sys_controls
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmCOUNTRY')
BEGIN
	DROP VIEW nqmCOUNTRY
END
GO
CREATE VIEW nqmCOUNTRY AS SELECT * FROM dsql2k.NDQ2.dbo.nqmCOUNTRY
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPATRON')
BEGIN
	DROP VIEW nqmPATRON
END
GO
CREATE VIEW nqmPATRON AS SELECT * FROM dsql2k.NDQ2.dbo.nqmPATRON
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPLACE')
BEGIN
	DROP VIEW nqmPLACE
END
GO
CREATE VIEW nqmPLACE AS SELECT * FROM dsql2k.NDQ2.dbo.nqmPLACE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPROFESSION')
BEGIN
	DROP VIEW nqmPROFESSION
END
GO
CREATE VIEW nqmPROFESSION AS SELECT * FROM dsql2k.NDQ2.dbo.nqmPROFESSION
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmREGION')
BEGIN
	DROP VIEW nqmREGION
END
GO
CREATE VIEW nqmREGION AS SELECT * FROM dsql2k.NDQ2.dbo.nqmREGION
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmREPRESENTATIVE')
BEGIN
	DROP VIEW nqmREPRESENTATIVE
END
GO
CREATE VIEW nqmREPRESENTATIVE AS SELECT * FROM dsql2k.NDQ2.dbo.nqmREPRESENTATIVE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='NdrSeekers')
BEGIN
	DROP VIEW NdrSeekers
END
GO
CREATE VIEW NdrSeekers AS SELECT * FROM dsql2k.NDQ2.dbo.NdrSeekers
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmSTATE')
BEGIN
	DROP VIEW nqmSTATE
END
GO
CREATE VIEW nqmSTATE AS SELECT * FROM dsql2k.NDQ2.dbo.nqmSTATE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqrINDIAN')
BEGIN
	DROP VIEW nqrINDIAN
END
GO
CREATE VIEW nqrINDIAN AS SELECT * FROM dsql2k.NDQ2.dbo.nqrINDIAN
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='Tmp_DupSeekers')
BEGIN
	DROP VIEW Tmp_DupSeekers
END
GO
CREATE VIEW Tmp_DupSeekers AS SELECT * FROM dsql2k.NDQ2.dbo.Tmp_DupSeekers
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqrMISSDUPNOS')
BEGIN
	DROP VIEW nqrMISSDUPNOS
END
GO
CREATE VIEW nqrMISSDUPNOS AS SELECT * FROM dsql2k.NDQ2.dbo.nqrMISSDUPNOS
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqrPATRON')
BEGIN
	DROP VIEW nqrPATRON
END
GO
CREATE VIEW nqrPATRON AS SELECT * FROM dsql2k.NDQ2.dbo.nqrPATRON
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_GroupSecurity')
BEGIN
	DROP VIEW sm_GroupSecurity
END
GO
CREATE VIEW sm_GroupSecurity AS SELECT * FROM dsql2k.NDQ2.dbo.sm_GroupSecurity
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_Security')
BEGIN
	DROP VIEW sm_Security
END
GO
CREATE VIEW sm_Security AS SELECT * FROM dsql2k.NDQ2.dbo.sm_Security
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sm_employee')
BEGIN
	DROP VIEW sm_employee
END
GO
CREATE VIEW sm_employee AS SELECT * FROM dsql2k.NDQ2.dbo.sm_employee
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmDISTRICT')
BEGIN
	DROP VIEW nqmDISTRICT
END
GO
CREATE VIEW nqmDISTRICT AS SELECT * FROM dsql2k.NDQ2.dbo.nqmDISTRICT
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmPOSTOFFICE')
BEGIN
	DROP VIEW nqmPOSTOFFICE
END
GO
CREATE VIEW nqmPOSTOFFICE AS SELECT * FROM dsql2k.NDQ2.dbo.nqmPOSTOFFICE
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqtINDIAN')
BEGIN
	DROP VIEW nqtINDIAN
END
GO
CREATE VIEW nqtINDIAN AS SELECT * FROM dsql2k.NDQ2.dbo.nqtINDIAN
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqmCONTROL')
BEGIN
	DROP VIEW nqmCONTROL
END
GO
CREATE VIEW nqmCONTROL AS SELECT * FROM dsql2k.NDQ2.dbo.nqmCONTROL
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='nqvIndian')
BEGIN
	DROP VIEW nqvIndian
END
GO
CREATE VIEW nqvIndian AS SELECT * FROM dsql2k.NDQ2.dbo.nqvIndian
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='syssegments')
BEGIN
	DROP VIEW syssegments
END
GO
CREATE VIEW syssegments AS SELECT * FROM dsql2k.NDQ2.dbo.syssegments
GO
if exists (select top 1 1 from sysobjects where type = 'v' and name='sysconstraints')
BEGIN
	DROP VIEW sysconstraints
END
GO
CREATE VIEW sysconstraints AS SELECT * FROM dsql2k.NDQ2.dbo.sysconstraints
GO



