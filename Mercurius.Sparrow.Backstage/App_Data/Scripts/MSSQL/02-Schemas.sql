IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='dbo')
  EXEC sys.sp_executesql N'CREATE SCHEMA [dbo] Authorization [dbo]';
GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='RBAC')
  EXEC sys.sp_executesql N'CREATE SCHEMA [RBAC] Authorization [dbo]';
GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='Dynamic')
  EXEC sys.sp_executesql N'CREATE SCHEMA [Dynamic] Authorization [dbo]';
GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='WebApi')
  EXEC sys.sp_executesql N'CREATE SCHEMA [WebApi] Authorization [dbo]';
GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='Storage')
  EXEC sys.sp_executesql N'CREATE SCHEMA [Storage] Authorization [dbo]';
GO
