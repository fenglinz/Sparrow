CREATE TABLE [Dynamic].[Condition]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [TableName] NVARCHAR(50) NOT NULL,
  [Column] NVARCHAR(50) NOT NULL,
  [Op] INT NOT NULL,
  [DictionaryKey] NVARCHAR(250) NULL,
  [ValidateRule] NVARCHAR(200) NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'查询条件',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'表名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'TableName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'查询列名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'Column';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'查询方式',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'Op';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'字典值',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'DictionaryKey';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'验证规则',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Condition',
    @level2type = 'COLUMN',
    @level2name = N'ValidateRule';
GO
CREATE TABLE [Dynamic].[CreateOrUpdate]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [TableName] NVARCHAR(50) NOT NULL,
  [Column] NVARCHAR(50) NOT NULL,
  [ColumnLabel] NVARCHAR(150) NULL,
  [DefaultValue] NVARCHAR(200) NULL,
  [Visible] BIT NULL,
  [DictionaryKey] NVARCHAR(250) NULL,
  [ValidateRule] NVARCHAR(50) NULL,
  [Sort] INT NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'添加编辑配置',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'表名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'TableName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'显示的列名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'Column';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'列标签',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'ColumnLabel';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'默认值',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'DefaultValue';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'是否显示',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'Visible';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'字典键',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'DictionaryKey';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'验证规则',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'ValidateRule';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'显示顺序',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'CreateOrUpdate',
    @level2type = 'COLUMN',
    @level2name = N'Sort';
GO
CREATE TABLE [Dynamic].[ExtensionProperty]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Category] NVARCHAR(250) NOT NULL,
  [Name] NVARCHAR(250) NOT NULL,
  [Unit] NVARCHAR(50) NULL,
  [GroupName] NVARCHAR(250) NULL,
  [ControlId] NVARCHAR(250) NOT NULL,
  [ControlType] INT NOT NULL,
  [Placeholder] NVARCHAR(250) NULL,
  [ControlDataSource] NVARCHAR(MAX) NULL,
  [ControlMaxLength] INT NULL,
  [ControlCssClass] NVARCHAR(2000) NULL,
  [ControlStyle] NVARCHAR(2000) NULL,
  [ControlValidateRule] NVARCHAR(50) NULL,
  [Sort] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'扩展属性',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'分类',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Category';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'属性名',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Name';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'单位',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Unit';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'分组',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'GroupName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件类型',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlType';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'占位符',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Placeholder';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件数据源',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlDataSource';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件长度',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlMaxLength';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件css类名',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlCssClass';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件样式',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlStyle';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'控件验证规则',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ControlValidateRule';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'排序号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'Sort';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'创建者编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'创建时间',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'修改者编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'修改时间',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionProperty',
    @level2type = 'COLUMN',
    @level2name = N'ModifyDateTime';
GO
CREATE TABLE [Dynamic].[ExtensionPropertyInstance]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [ExtensionPropertyId] UNIQUEIDENTIFIER NOT NULL,
  [EntityId] NVARCHAR(36) NULL,
  [Value] NVARCHAR(MAX) NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'扩展属性实例',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionPropertyInstance';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionPropertyInstance',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'扩展属性编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionPropertyInstance',
    @level2type = 'COLUMN',
    @level2name = N'ExtensionPropertyId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'业务编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionPropertyInstance',
    @level2type = 'COLUMN',
    @level2name = N'EntityId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'值',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'ExtensionPropertyInstance',
    @level2type = 'COLUMN',
    @level2name = N'Value';
GO
CREATE TABLE [Dynamic].[Order]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [TableName] NVARCHAR(50) NOT NULL,
  [Column] NVARCHAR(50) NOT NULL,
  [OrderBy] INT NOT NULL DEFAULT ( (0) )
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'排序配置',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Order';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Order',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'表名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Order',
    @level2type = 'COLUMN',
    @level2name = N'TableName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'列名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Order',
    @level2type = 'COLUMN',
    @level2name = N'Column';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'排序方式',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Order',
    @level2type = 'COLUMN',
    @level2name = N'OrderBy';
GO
CREATE TABLE [Dynamic].[Search]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [TableName] NVARCHAR(50) NOT NULL,
  [Title] NVARCHAR(250) NULL,
  [SortColumns] NVARCHAR(MAX) NULL,
  [VisibleColumns] NVARCHAR(MAX) NOT NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'查询配置',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'编号',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search',
    @level2type = 'COLUMN',
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'表名称',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search',
    @level2type = 'COLUMN',
    @level2name = N'TableName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'标题',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search',
    @level2type = 'COLUMN',
    @level2name = N'Title';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'列排序顺序',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search',
    @level2type = 'COLUMN',
    @level2name = N'SortColumns';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'显示列',
    @level0type = 'SCHEMA',
    @level0name = N'Dynamic',
    @level1type = 'TABLE',
    @level1name = N'Search',
    @level2type = 'COLUMN',
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