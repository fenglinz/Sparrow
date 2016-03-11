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
ALTER TABLE [Dynamic].[Condition] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Dynamic].[CreateOrUpdate] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Dynamic].[ExtensionProperty] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Dynamic].[ExtensionPropertyInstance] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Dynamic].[Order] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Dynamic].[Search] ADD PRIMARY KEY ([Id]);
GO