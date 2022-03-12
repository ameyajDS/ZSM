USE [master]
GO
ALTER LOGIN [ZSM_ADM] WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [master]
GO
ALTER LOGIN [ZSM_ADM] WITH PASSWORD=N'password'
GO

EXEC master..sp_addsrvrolemember @loginame = N'ZSM_ADM', @rolename = N'sysadmin'
GO

