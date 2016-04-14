CREATE TABLE [WebApi].[Api]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [Route] NVARCHAR(500) NULL,
  [HttpVerb] NVARCHAR(50) NULL,
  [Description] NVARCHAR(2000) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'Web API',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'Http路由',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'Route';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'Http谓词',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'HttpVerb';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'描述',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'Description';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Api',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
CREATE TABLE [WebApi].[Role]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [Name] NVARCHAR(50) NULL,
  [Description] NVARCHAR(2000) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'Web Api角色',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'名称',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'描述',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Description';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
SET IDENTITY_INSERT [WebApi].[Role] ON;
GO
INSERT INTO [WebApi].[Role] ( [Id], [Name], [Description], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )VALUES ( N'1', N'开发者', N'开发者账号', NULL, NULL, NULL, N'2016-03-10 15:13:15.157' );
GO
SET IDENTITY_INSERT [WebApi].[Role] OFF;
GO
CREATE TABLE [WebApi].[RolePermission]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [RoleId] INT NOT NULL,
  [ApiId] INT NOT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'WebApi权限列表',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'RoleId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'Web API编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'ApiId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
CREATE TABLE [WebApi].[User]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [Account] NVARCHAR(50) NULL,
  [Password] NVARCHAR(50) NULL,
  [Description] NVARCHAR(2000) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'WebApi用户',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'账号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Account';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'密码',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Password';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'使用者描述',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Description';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(1：正常，其它：锁定)',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
SET IDENTITY_INSERT [WebApi].[User] ON;
GO
INSERT INTO [WebApi].[User] ( [Id], [Account], [Password], [Description], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )VALUES ( N'1', N'nebula', N'ef5caa746eb6e51eef59a31a96c3e99b', N'星云用户', NULL, NULL, N'2016-03-10 15:12:53.730', NULL, N'2016-03-10 15:12:58.713' );
GO
SET IDENTITY_INSERT [WebApi].[User] OFF;
GO
CREATE TABLE [WebApi].[UserRole]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [UserId] INT NOT NULL,
  [RoleId] INT NOT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户角色关系',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'UserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'RoleId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'WebApi',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
ALTER TABLE [WebApi].[Api] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [WebApi].[Role] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [WebApi].[RolePermission] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [WebApi].[User] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [WebApi].[UserRole] ADD PRIMARY KEY ([Id]);
GO