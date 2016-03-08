CREATE TABLE [WebApi].[Api]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [Route] NVARCHAR(500) NULL ,
      [HttpVerb] NVARCHAR(50) NULL ,
      [Description] NVARCHAR(2000) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'Api', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'Web API', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'Api';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Web API',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'Api';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'Api', 'COLUMN', N'Route')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'Http路由', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'Api', @level2type = 'COLUMN',
        @level2name = N'Route';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Http路由',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'Api', @level2type = 'COLUMN', @level2name = N'Route';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'Api', 'COLUMN', N'HttpVerb')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'Http谓词', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'Api', @level2type = 'COLUMN',
        @level2name = N'HttpVerb';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Http谓词',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'Api', @level2type = 'COLUMN',
        @level2name = N'HttpVerb';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'Api', 'COLUMN',
                                        N'Description')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'描述',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'Api', @level2type = 'COLUMN',
        @level2name = N'Description';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'描述',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'Api', @level2type = 'COLUMN',
        @level2name = N'Description';
GO

-- ----------------------------
-- Records of Api
-- ----------------------------
SET IDENTITY_INSERT [WebApi].[Api] ON;
GO
SET IDENTITY_INSERT [WebApi].[Api] OFF;
GO

CREATE TABLE [WebApi].[Role]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [Name] NVARCHAR(50) NULL ,
      [Description] NVARCHAR(2000) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
DBCC CHECKIDENT(N'[WebApi].[Role]', RESEED, 2);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'Role', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'Web Api角色', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'Role';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'Web Api角色', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'Role';
GO

-- ----------------------------
-- Records of Role
-- ----------------------------
SET IDENTITY_INSERT [WebApi].[Role] ON;
GO
INSERT  INTO [WebApi].[Role]
        ( [Id] ,
          [Name] ,
          [Description] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'1' ,
          N'开发者' ,
          N'开发者账号' ,
          NULL ,
          NULL ,
          NULL ,
          NULL
        );
GO
GO
SET IDENTITY_INSERT [WebApi].[Role] OFF;
GO

CREATE TABLE [WebApi].[RolePermission]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [UserId] INT NOT NULL ,
      [ApiId] INT NOT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'RolePermission', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'WebApi权限列表', @level0type = 'SCHEMA',
        @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'RolePermission';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'WebApi权限列表', @level0type = 'SCHEMA',
        @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'RolePermission';
GO

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
SET IDENTITY_INSERT [WebApi].[RolePermission] ON;
GO
SET IDENTITY_INSERT [WebApi].[RolePermission] OFF;
GO

CREATE TABLE [WebApi].[User]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [Account] NVARCHAR(50) NULL ,
      [Password] NVARCHAR(50) NULL ,
      [Description] NVARCHAR(2000) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
DBCC CHECKIDENT(N'[WebApi].[User]', RESEED, 3);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'User', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'WebApi用户', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'User';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'WebApi用户', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'User';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'User', 'COLUMN', N'Account')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'账号',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Account';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'账号',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Account';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'User', 'COLUMN',
                                        N'Password')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Password';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Password';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'WebApi',
                                        'TABLE', N'User', 'COLUMN',
                                        N'Description')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'使用者描述', @level0type = 'SCHEMA', @level0name = N'WebApi',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Description';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'使用者描述',
        @level0type = 'SCHEMA', @level0name = N'WebApi', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Description';
GO

-- ----------------------------
-- Records of User
-- ----------------------------
SET IDENTITY_INSERT [WebApi].[User] ON;
GO
INSERT  INTO [WebApi].[User]
        ( [Id] ,
          [Account] ,
          [Password] ,
          [Description] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'1' ,
          N'dezo' ,
          N'0fd06b4bf05d5854778cf140e904ca0f' ,
          N'德忠用户' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL
        );
GO
GO
SET IDENTITY_INSERT [WebApi].[User] OFF;
GO

CREATE TABLE [WebApi].[UserRole]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [UserId] INT NOT NULL ,
      [RoleId] INT NOT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );

GO
DBCC CHECKIDENT(N'[WebApi].[UserRole]', RESEED, 4);
GO

SET IDENTITY_INSERT [WebApi].[UserRole] ON;
GO
SET IDENTITY_INSERT [WebApi].[UserRole] OFF;
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
