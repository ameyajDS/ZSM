USE SYSADMIN
GO
update package_databases  set server_nm = '.'

USE [master]
GO
ALTER LOGIN [ZSM_ADM] WITH PASSWORD=N'password'
GO