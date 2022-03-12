USE [master]
GO
EXEC sp_addlinkedserver  
   @server='dsql2k',
   @srvproduct='',
   @provider='SQLNCLI',
   @datasrc='.'
   
GO

USE [master]
GO
EXEC master.dbo.sp_serveroption @server=N'dsql2k', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'dsql2k', @optname=N'rpc out', @optvalue=N'true'
GO