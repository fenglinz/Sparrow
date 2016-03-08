CREATE TABLE [Dynamic].[Condition]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [TableName] NVARCHAR(50) NOT NULL ,
      [Column] NVARCHAR(50) NOT NULL ,
      [Op] INT NOT NULL ,
      [DictionaryKey] NVARCHAR(250) NULL ,
      [ValidateRule] NVARCHAR(200) NULL
    );

GO
DBCC CHECKIDENT(N'[Dynamic].[Condition]', RESEED, 9);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'查询条件',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'查询条件',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN',
                                        N'TableName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'TableName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'TableName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN',
                                        N'Column')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'查询列名称', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Column';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'查询列名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Column';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN', N'Op')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'查询方式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Op';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'查询方式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'Op';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN',
                                        N'DictionaryKey')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典值',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'DictionaryKey';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典值',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'DictionaryKey';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Condition', 'COLUMN',
                                        N'ValidateRule')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'验证规则',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'ValidateRule';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'验证规则',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Condition',
        @level2type = 'COLUMN', @level2name = N'ValidateRule';
GO

SET IDENTITY_INSERT [Dynamic].[Condition] ON;
GO
SET IDENTITY_INSERT [Dynamic].[Condition] OFF;
GO

CREATE TABLE [Dynamic].[CreateOrUpdate]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [TableName] NVARCHAR(50) NOT NULL ,
      [Column] NVARCHAR(50) NOT NULL ,
      [ColumnLabel] NVARCHAR(150) NULL ,
      [DefaultValue] NVARCHAR(200) NULL ,
      [Visible] BIT NULL ,
      [DictionaryKey] NVARCHAR(250) NULL ,
      [ValidateRule] NVARCHAR(50) NULL ,
      [Sort] INT NULL
    );


GO
DBCC CHECKIDENT(N'[Dynamic].[CreateOrUpdate]', RESEED, 56);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'添加编辑信息', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'添加编辑信息',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'TableName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'TableName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'TableName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'Column')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'显示的列名称', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Column';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'显示的列名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Column';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'ColumnLabel')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'列标签',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'ColumnLabel';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'列标签',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'ColumnLabel';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'DefaultValue')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'默认值',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'DefaultValue';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'默认值',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'DefaultValue';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'Visible')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否显示',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Visible';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否显示',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Visible';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'DictionaryKey')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典键',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'DictionaryKey';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典键',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'DictionaryKey';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'ValidateRule')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'验证规则',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'ValidateRule';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'验证规则',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'ValidateRule';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'CreateOrUpdate', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'显示顺序',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'显示顺序',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'CreateOrUpdate',
        @level2type = 'COLUMN', @level2name = N'Sort';
GO

-- ----------------------------
-- Records of CreateOrUpdate
-- ----------------------------
SET IDENTITY_INSERT [Dynamic].[CreateOrUpdate] ON;
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'19' ,
          N'SystemLog' ,
          N'Id' ,
          N'编号' ,
          N'GUID' ,
          NULL ,
          NULL ,
          N'notNull' ,
          N'1'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'20' ,
          N'SystemLog' ,
          N'LogOnId' ,
          N'登录者编号' ,
          N'CurrentUserId' ,
          NULL ,
          NULL ,
          N'notNull' ,
          N'2'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'21' ,
          N'SystemLog' ,
          N'LogOnName' ,
          N'登录者名称' ,
          N'CurrentUserName' ,
          N'1' ,
          NULL ,
          NULL ,
          N'3'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'22' ,
          N'SystemLog' ,
          N'LogOnIP' ,
          N'登录者IP地址' ,
          NULL ,
          N'1' ,
          NULL ,
          N'ipAddress' ,
          N'4'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'23' ,
          N'SystemLog' ,
          N'ModelName' ,
          N'模块名称' ,
          NULL ,
          N'1' ,
          NULL ,
          NULL ,
          N'5'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'24' ,
          N'SystemLog' ,
          N'Summary' ,
          N'简介' ,
          NULL ,
          N'1' ,
          NULL ,
          N'notNull' ,
          N'6'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'25' ,
          N'SystemLog' ,
          N'Details' ,
          N'详情' ,
          NULL ,
          N'1' ,
          NULL ,
          N'notNull' ,
          N'7'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'26' ,
          N'SystemLog' ,
          N'LogLevel' ,
          N'级别' ,
          NULL ,
          N'1' ,
          N'日志级别' ,
          N'notNull' ,
          N'8'
        );
GO
GO
INSERT  INTO [Dynamic].[CreateOrUpdate]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [ColumnLabel] ,
          [DefaultValue] ,
          [Visible] ,
          [DictionaryKey] ,
          [ValidateRule] ,
          [Sort]
        )
VALUES  ( N'27' ,
          N'SystemLog' ,
          N'OccurrenceDateTime' ,
          N'记录时间' ,
          N'CurrentDateTime' ,
          N'1' ,
          NULL ,
          N'dateTime' ,
          N'9'
        );
GO
GO
SET IDENTITY_INSERT [Dynamic].[CreateOrUpdate] OFF;
GO

CREATE TABLE [Dynamic].[ExtensionProperty]
    (
      [Id] UNIQUEIDENTIFIER NOT NULL ,
      [Category] NVARCHAR(250) NOT NULL ,
      [Name] NVARCHAR(250) NOT NULL ,
      [Unit] NVARCHAR(50) NULL ,
      [GroupName] NVARCHAR(250) NULL ,
      [ControlId] NVARCHAR(250) NOT NULL ,
      [ControlType] INT NOT NULL ,
      [Placeholder] NVARCHAR(250) NULL ,
      [ControlDataSource] NVARCHAR(MAX) NULL ,
      [ControlMaxLength] INT NULL ,
      [ControlCssClass] NVARCHAR(2000) NULL ,
      [ControlStyle] NVARCHAR(2000) NULL ,
      [ControlValidateRule] NVARCHAR(50) NULL ,
      [Sort] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty', NULL,
                                        NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'扩展属性',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'扩展属性',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'Category')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Category';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Category';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'属性名',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'属性名',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'Unit')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单位',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Unit';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单位',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Unit';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'GroupName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分组',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'GroupName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分组',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'GroupName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'ControlId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'控件编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控件编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'ControlType')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'控件类型',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlType';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控件类型',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlType';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'Placeholder')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'占位符',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Placeholder';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'占位符',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'Placeholder';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'ControlDataSource')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'控件数据源', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlDataSource';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控件数据源',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlDataSource';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'ControlCssClass')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'控件css类名', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlCssClass';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控件css类名',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlCssClass';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionProperty',
                                        'COLUMN', N'ControlStyle')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'控件样式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlStyle';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控件样式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionProperty',
        @level2type = 'COLUMN', @level2name = N'ControlStyle';
GO

-- ----------------------------
-- Records of ExtensionProperty
-- ----------------------------
INSERT  INTO [Dynamic].[ExtensionProperty]
        ( [Id] ,
          [Category] ,
          [Name] ,
          [Unit] ,
          [GroupName] ,
          [ControlId] ,
          [ControlType] ,
          [Placeholder] ,
          [ControlDataSource] ,
          [ControlMaxLength] ,
          [ControlCssClass] ,
          [ControlStyle] ,
          [ControlValidateRule] ,
          [Sort] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'67164BD2-6B4E-4B07-80CC-0EF4F66EF6FC' ,
          N'应收账款融资' ,
          N'债务人' ,
          NULL ,
          NULL ,
          N'Debtor' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          N'col-sm-5' ,
          NULL ,
          N'notNull' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 13:41:19.743' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-20 16:51:58.700'
        );
GO
GO
INSERT  INTO [Dynamic].[ExtensionProperty]
        ( [Id] ,
          [Category] ,
          [Name] ,
          [Unit] ,
          [GroupName] ,
          [ControlId] ,
          [ControlType] ,
          [Placeholder] ,
          [ControlDataSource] ,
          [ControlMaxLength] ,
          [ControlCssClass] ,
          [ControlStyle] ,
          [ControlValidateRule] ,
          [Sort] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'E4904987-FBBF-44C3-802F-5F624C04834B' ,
          N'个人信息' ,
          N'身份证号' ,
          NULL ,
          N'grp1' ,
          N'IdCard' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          N'col-sm-4' ,
          NULL ,
          N'IDCardOrNull' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-18 14:16:49.180' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-02-23 16:07:07.373'
        );
GO
GO
INSERT  INTO [Dynamic].[ExtensionProperty]
        ( [Id] ,
          [Category] ,
          [Name] ,
          [Unit] ,
          [GroupName] ,
          [ControlId] ,
          [ControlType] ,
          [Placeholder] ,
          [ControlDataSource] ,
          [ControlMaxLength] ,
          [ControlCssClass] ,
          [ControlStyle] ,
          [ControlValidateRule] ,
          [Sort] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'38AE0984-7147-49A2-B9D1-853AA3D9514E' ,
          N'个人信息' ,
          N'年龄' ,
          N'岁' ,
          NULL ,
          N'EMail' ,
          N'1' ,
          N'年龄' ,
          NULL ,
          NULL ,
          N'col-sm-4' ,
          NULL ,
          N'intOrNull' ,
          N'2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-18 16:56:41.693' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-20 16:54:09.497'
        );
GO
GO
INSERT  INTO [Dynamic].[ExtensionProperty]
        ( [Id] ,
          [Category] ,
          [Name] ,
          [Unit] ,
          [GroupName] ,
          [ControlId] ,
          [ControlType] ,
          [Placeholder] ,
          [ControlDataSource] ,
          [ControlMaxLength] ,
          [ControlCssClass] ,
          [ControlStyle] ,
          [ControlValidateRule] ,
          [Sort] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0DF91994-6A68-4095-9A72-E622F60A0157' ,
          N'个人信息' ,
          N'性别' ,
          NULL ,
          N'grp1' ,
          N'Sex' ,
          N'2' ,
          NULL ,
          N'保密|0;男|1;女|2' ,
          NULL ,
          N'col-sm-3' ,
          NULL ,
          N'notNull' ,
          N'2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-18 16:35:55.157' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-20 16:54:25.423'
        );
GO
GO

CREATE TABLE [Dynamic].[ExtensionPropertyInstance]
    (
      [Id] UNIQUEIDENTIFIER NOT NULL ,
      [ExtensionPropertyId] UNIQUEIDENTIFIER NOT NULL ,
      [EntityId] NVARCHAR(36) NULL ,
      [Value] NVARCHAR(MAX) NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'ExtensionPropertyInstance',
                                        NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'扩展属性实例', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionPropertyInstance';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'扩展属性实例',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'ExtensionPropertyInstance';
GO

-- ----------------------------
-- Records of ExtensionPropertyInstance
-- ----------------------------
INSERT  INTO [Dynamic].[ExtensionPropertyInstance]
        ( [Id] ,
          [ExtensionPropertyId] ,
          [EntityId] ,
          [Value]
        )
VALUES  ( N'1A99997C-837B-4FF1-B793-6622CAD73F55' ,
          N'0DF91994-6A68-4095-9A72-E622F60A0157' ,
          N'48F3889C-AF8D-401F-ADA2-C383031AF92D' ,
          N'2'
        );
GO
GO
INSERT  INTO [Dynamic].[ExtensionPropertyInstance]
        ( [Id] ,
          [ExtensionPropertyId] ,
          [EntityId] ,
          [Value]
        )
VALUES  ( N'7798E51B-EC81-4B2E-8998-88C6D547400F' ,
          N'38AE0984-7147-49A2-B9D1-853AA3D9514E' ,
          N'48F3889C-AF8D-401F-ADA2-C383031AF92D' ,
          N'fenglin.zhang@live.cn'
        );
GO
GO
INSERT  INTO [Dynamic].[ExtensionPropertyInstance]
        ( [Id] ,
          [ExtensionPropertyId] ,
          [EntityId] ,
          [Value]
        )
VALUES  ( N'BFA07E63-D131-4A02-9D6E-DDB3590D7433' ,
          N'E4904987-FBBF-44C3-802F-5F624C04834B' ,
          N'48F3889C-AF8D-401F-ADA2-C383031AF92D' ,
          N'420922198303143415'
        );
GO
GO

CREATE TABLE [Dynamic].[Order]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [TableName] NVARCHAR(50) NOT NULL ,
      [Column] NVARCHAR(50) NOT NULL ,
      [OrderBy] INT NOT NULL
                    DEFAULT ( (0) )
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Order', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序信息',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序信息',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Order', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Order', 'COLUMN',
                                        N'TableName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'TableName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'TableName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Order', 'COLUMN', N'Column')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'列名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'Column';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'列名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'Column';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Order', 'COLUMN',
                                        N'OrderBy')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序方式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'OrderBy';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序方式',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Order', @level2type = 'COLUMN',
        @level2name = N'OrderBy';
GO

-- ----------------------------
-- Records of Order
-- ----------------------------
SET IDENTITY_INSERT [Dynamic].[Order] ON;
GO
INSERT  INTO [Dynamic].[Order]
        ( [Id] ,
          [TableName] ,
          [Column] ,
          [OrderBy]
        )
VALUES  ( N'1' ,
          N'SystemLog' ,
          N'OccurrenceDateTime' ,
          N'1'
        );
GO
GO
SET IDENTITY_INSERT [Dynamic].[Order] OFF;
GO

CREATE TABLE [Dynamic].[Search]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [TableName] NVARCHAR(50) NOT NULL ,
      [Title] NVARCHAR(250) NULL ,
      [SortColumns] NVARCHAR(MAX) NULL ,
      [VisibleColumns] NVARCHAR(MAX) NOT NULL
    );


GO
DBCC CHECKIDENT(N'[Dynamic].[Search]', RESEED, 2);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'查询配置信息', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'查询配置信息',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', 'COLUMN',
                                        N'TableName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'TableName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'TableName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', 'COLUMN', N'Title')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标题',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'Title';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标题',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'Title';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', 'COLUMN',
                                        N'SortColumns')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'列排序顺序', @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'SortColumns';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'列排序顺序',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'SortColumns';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'Dynamic',
                                        'TABLE', N'Search', 'COLUMN',
                                        N'VisibleColumns')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'显示列',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'VisibleColumns';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'显示列',
        @level0type = 'SCHEMA', @level0name = N'Dynamic',
        @level1type = 'TABLE', @level1name = N'Search', @level2type = 'COLUMN',
        @level2name = N'VisibleColumns';
GO

-- ----------------------------
-- Records of Search
-- ----------------------------
SET IDENTITY_INSERT [Dynamic].[Search] ON;
GO
INSERT  INTO [Dynamic].[Search]
        ( [Id] ,
          [TableName] ,
          [Title] ,
          [SortColumns] ,
          [VisibleColumns]
        )
VALUES  ( N'1' ,
          N'SystemLog' ,
          N'日志信息' ,
          N'Id,ModelName,Summary,LogOnName,LogOnIP,LogLevel,OccurrenceDateTime,LogOnId,Details' ,
          N'Id,ModelName,Summary,LogOnName,LogOnIP,LogLevel,OccurrenceDateTime'
        );
GO
GO
INSERT  INTO [Dynamic].[Search]
        ( [Id] ,
          [TableName] ,
          [Title] ,
          [SortColumns] ,
          [VisibleColumns]
        )
VALUES  ( N'2' ,
          N'dbo.Dictionary' ,
          N'字典信息' ,
          N'Id,Type,Key,Value,ParentId,Sort,Status,Remark' ,
          N'Id,Type,Key,Value,ParentId,Sort,Status,Remark'
        );
GO
GO
SET IDENTITY_INSERT [Dynamic].[Search] OFF;
GO

-- ----------------------------
-- Indexes structure for table Condition
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Condition
-- ----------------------------
ALTER TABLE [Dynamic].[Condition] ADD PRIMARY KEY ([Id]);
GO

-- ----------------------------
-- Indexes structure for table CreateOrUpdate
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CreateOrUpdate
-- ----------------------------
ALTER TABLE [Dynamic].[CreateOrUpdate] ADD PRIMARY KEY ([Id]);
GO

-- ----------------------------
-- Indexes structure for table ExtensionProperty
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ExtensionProperty
-- ----------------------------
ALTER TABLE [Dynamic].[ExtensionProperty] ADD PRIMARY KEY ([Id]);
GO

-- ----------------------------
-- Indexes structure for table ExtensionPropertyInstance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ExtensionPropertyInstance
-- ----------------------------
ALTER TABLE [Dynamic].[ExtensionPropertyInstance] ADD PRIMARY KEY ([Id]);
GO

-- ----------------------------
-- Indexes structure for table Order
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Order
-- ----------------------------
ALTER TABLE [Dynamic].[Order] ADD PRIMARY KEY ([Id]);
GO

-- ----------------------------
-- Indexes structure for table Search
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Search
-- ----------------------------
ALTER TABLE [Dynamic].[Search] ADD PRIMARY KEY ([Id]);
GO
