USE [master]
GO

CREATE LOGIN [AdminES] WITH PASSWORD=N'DvLuXvUBIXQ+NuHIHtw81vLOLooaMeex7Q/5AaSdaJc=', DEFAULT_DATABASE=[ES], DEFAULT_LANGUAGE=[�������], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [AdminES] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [AdminES]
GO

ALTER SERVER ROLE [securityadmin] ADD MEMBER [AdminES]
GO

ALTER SERVER ROLE [serveradmin] ADD MEMBER [AdminES]
GO

ALTER SERVER ROLE [setupadmin] ADD MEMBER [AdminES]
GO

ALTER SERVER ROLE [dbcreator] ADD MEMBER [AdminES]
GO


