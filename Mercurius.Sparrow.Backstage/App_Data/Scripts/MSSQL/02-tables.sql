Create Table [dbo].[Dictionary](
  [Id] NVARCHAR (36) Primary Key,
  [Type] INT NULL,
  [Key] NVARCHAR (400) NULL,
  [Value] NVARCHAR (400) NULL,
  [ParentId] NVARCHAR (72) NULL,
  [Sort] INT NULL,
  [Status] INT NULL,
  [Remark] NVARCHAR (500) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '字典信息', 'SCHEMA', 'dbo', 'TABLE', 'Dictionary', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '类型' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Type';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '键' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Key';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '值' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Value';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '父级编号' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'ParentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'dbo', 'TABLE', 'Dictionary', 'COLUMN', 'Remark';
GO

Create Table [dbo].[Globalization](
  [Id] NVARCHAR (36) Primary Key,
  [Culture] NVARCHAR (20) NULL,
  [Area] NVARCHAR (400) NULL,
  [Controller] NVARCHAR (400) NULL,
  [ViewName] NVARCHAR (400) NULL,
  [Key] NVARCHAR (400) NULL,
  [Value] NVARCHAR (400) NULL,
  [Remark] NVARCHAR (500) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '国际化信息', 'SCHEMA', 'dbo', 'TABLE', 'Globalization', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '区域语言' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Culture';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '区域' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Area';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控制器' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Controller';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '视图名' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'ViewName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '键' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Key';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '值' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Value';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'dbo', 'TABLE', 'Globalization', 'COLUMN', 'Remark';
GO

Create Table [dbo].[News](
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Category] NVARCHAR (250) NULL,
  [Title] NVARCHAR (500) NULL,
  [Content] NVARCHAR (MAX) NULL,
  [Status] INT NULL,
  [BrowseTimes] INT NULL,
  [PublisherId] NVARCHAR (36) NULL,
  [PublishDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '新闻', 'SCHEMA', 'dbo', 'TABLE', 'News', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '分类' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'Category';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '标题' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'Title';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '内容' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'Content';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(1：待审核，2：已发布，4：已删除)' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '浏览次数' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'BrowseTimes';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '发布者编号' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'PublisherId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '发布时间' ,'SCHEMA', 'dbo', 'TABLE', 'News', 'COLUMN', 'PublishDateTime';
GO

Create Table [dbo].[NewsComment](
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [NewsId] UNIQUEIDENTIFIER NOT NULL,
  [ReplyCommentId] UNIQUEIDENTIFIER NULL,
  [Content] NVARCHAR (2000) NULL,
  [Status] INT NULL,
  [LikePoints] INT NULL,
  [CommentUserId] NVARCHAR (36) NULL,
  [CommentDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '新闻评论', 'SCHEMA', 'dbo', 'TABLE', 'NewsComment', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '新闻编号' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'NewsId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '评论编号(回复评论)' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'ReplyCommentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '内容' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'Content';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(1：代审核，2：审核通过、4：审核失败)' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '点赞次数' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'LikePoints';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '评论者编号' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'CommentUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '评论时间' ,'SCHEMA', 'dbo', 'TABLE', 'NewsComment', 'COLUMN', 'CommentDateTime';
GO

Create Table [dbo].[OperationRecord](
  [Id] INT Primary Key,
  [BusinessCategory] NVARCHAR (250) NULL,
  [BusinessSerialNumber] NVARCHAR (250) NULL,
  [Content] NVARCHAR (MAX) NULL,
  [LogOnIPAddress] NVARCHAR (50) NULL,
  [AddedUserId] NVARCHAR (36) NULL,
  [AddedDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '操作记录', 'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务分类' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'BusinessCategory';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务流水号' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'BusinessSerialNumber';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '内容' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'Content';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '登录IP地址' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'LogOnIPAddress';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '记录者编号' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'AddedUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '记录时间' ,'SCHEMA', 'dbo', 'TABLE', 'OperationRecord', 'COLUMN', 'AddedDateTime';
GO

Create Table [dbo].[SystemLog](
  [Id] NVARCHAR (36) Primary Key,
  [LogOnId] NVARCHAR (36) NULL,
  [LogOnIP] NVARCHAR (100) NULL,
  [ModelName] NVARCHAR (200) NULL,
  [Summary] NVARCHAR (500) NULL,
  [Details] NTEXT NULL,
  [LogLevel] NVARCHAR (100) NULL,
  [OccurrenceDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '日志', 'SCHEMA', 'dbo', 'TABLE', 'SystemLog', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '登录者编号' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'LogOnId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '登录者IP地址' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'LogOnIP';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '模块名称' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'ModelName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '日志简介' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'Summary';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '日志详情' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'Details';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '日志级别' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'LogLevel';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '记录时间' ,'SCHEMA', 'dbo', 'TABLE', 'SystemLog', 'COLUMN', 'OccurrenceDateTime';
GO

Create Table [dbo].[SystemSetting](
  [Id] NVARCHAR (36) Primary Key,
  [ParentId] NVARCHAR (200) NULL,
  [Name] NVARCHAR (200) NULL,
  [Value] NVARCHAR (500) NULL,
  [Remark] NVARCHAR (500) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '系统设置', 'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '父级编号' ,'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', 'COLUMN', 'ParentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '名称' ,'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '值' ,'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', 'COLUMN', 'Value';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'dbo', 'TABLE', 'SystemSetting', 'COLUMN', 'Remark';
GO

Create Table [Dynamic].[Condition](
  [Id] INT Primary Key,
  [TableName] NVARCHAR (50) NOT NULL,
  [Column] NVARCHAR (50) NOT NULL,
  [Op] INT NOT NULL,
  [DictionaryKey] NVARCHAR (250) NULL,
  [ValidateRule] NVARCHAR (200) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '查询条件', 'SCHEMA', 'Dynamic', 'TABLE', 'Condition', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '表名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'TableName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '查询列名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'Column';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '查询方式' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'Op';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '字典值' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'DictionaryKey';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '验证规则' ,'SCHEMA', 'Dynamic', 'TABLE', 'Condition', 'COLUMN', 'ValidateRule';
GO

Create Table [Dynamic].[CreateOrUpdate](
  [Id] INT Primary Key,
  [TableName] NVARCHAR (50) NOT NULL,
  [Column] NVARCHAR (50) NOT NULL,
  [ColumnLabel] NVARCHAR (150) NULL,
  [DefaultValue] NVARCHAR (200) NULL,
  [Visible] BIT NULL,
  [DictionaryKey] NVARCHAR (250) NULL,
  [ValidateRule] NVARCHAR (50) NULL,
  [Sort] INT NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '添加编辑配置', 'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '表名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'TableName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '显示的列名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'Column';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '列标签' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'ColumnLabel';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '默认值' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'DefaultValue';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '是否显示' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'Visible';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '字典键' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'DictionaryKey';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '验证规则' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'ValidateRule';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '显示顺序' ,'SCHEMA', 'Dynamic', 'TABLE', 'CreateOrUpdate', 'COLUMN', 'Sort';
GO

Create Table [Dynamic].[ExtensionProperty](
  [Id] UNIQUEIDENTIFIER Primary Key,
  [Category] NVARCHAR (250) NOT NULL,
  [Name] NVARCHAR (250) NOT NULL,
  [Unit] NVARCHAR (50) NULL,
  [GroupName] NVARCHAR (250) NULL,
  [ControlId] NVARCHAR (250) NOT NULL,
  [ControlType] INT NOT NULL,
  [Placeholder] NVARCHAR (250) NULL,
  [ControlDataSource] NVARCHAR (MAX) NULL,
  [ControlMaxLength] INT NULL,
  [ControlLabelCssClass] NVARCHAR (50) NULL,
  [ControlContainerCssClass] NVARCHAR (50) NULL,
  [ControlStyle] NVARCHAR (2000) NULL,
  [ControlValidateRule] NVARCHAR (50) NULL,
  [Sort] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '扩展属性', 'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '分类' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Category';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '属性名' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '单位' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Unit';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '分组' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'GroupName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件类型' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlType';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '占位符' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Placeholder';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件数据源' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlDataSource';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件长度' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlMaxLength';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件标签css类名' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlLabelCssClass';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件容器css类名' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlContainerCssClass';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件样式' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlStyle';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '控件验证规则' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ControlValidateRule';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionProperty', 'COLUMN', 'ModifyDateTime';
GO

Create Table [Dynamic].[ExtensionPropertyInstance](
  [Id] UNIQUEIDENTIFIER Primary Key,
  [ExtensionPropertyId] UNIQUEIDENTIFIER NOT NULL,
  [BusinessSerialNumber] NVARCHAR (36) NULL,
  [Value] NVARCHAR (MAX) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '扩展属性实例', 'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionPropertyInstance', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionPropertyInstance', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '扩展属性编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionPropertyInstance', 'COLUMN', 'ExtensionPropertyId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务流水编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionPropertyInstance', 'COLUMN', 'BusinessSerialNumber';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '值' ,'SCHEMA', 'Dynamic', 'TABLE', 'ExtensionPropertyInstance', 'COLUMN', 'Value';
GO

Create Table [Dynamic].[Order](
  [Id] INT Primary Key,
  [TableName] NVARCHAR (50) NOT NULL,
  [Column] NVARCHAR (50) NOT NULL,
  [OrderBy] INT NOT NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序配置', 'SCHEMA', 'Dynamic', 'TABLE', 'Order', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'Order', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '表名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'Order', 'COLUMN', 'TableName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '列名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'Order', 'COLUMN', 'Column';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序方式' ,'SCHEMA', 'Dynamic', 'TABLE', 'Order', 'COLUMN', 'OrderBy';
GO

Create Table [Dynamic].[Search](
  [Id] INT Primary Key,
  [TableName] NVARCHAR (50) NOT NULL,
  [Title] NVARCHAR (250) NULL,
  [SortColumns] NVARCHAR (MAX) NULL,
  [VisibleColumns] NVARCHAR (MAX) NOT NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '查询配置', 'SCHEMA', 'Dynamic', 'TABLE', 'Search', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Dynamic', 'TABLE', 'Search', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '表名称' ,'SCHEMA', 'Dynamic', 'TABLE', 'Search', 'COLUMN', 'TableName';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '标题' ,'SCHEMA', 'Dynamic', 'TABLE', 'Search', 'COLUMN', 'Title';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '列排序顺序' ,'SCHEMA', 'Dynamic', 'TABLE', 'Search', 'COLUMN', 'SortColumns';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '显示列' ,'SCHEMA', 'Dynamic', 'TABLE', 'Search', 'COLUMN', 'VisibleColumns';
GO

Create Table [RBAC].[Button](
  [Id] NVARCHAR (36) Primary Key,
  [Name] NVARCHAR (100) NULL,
  [Title] NVARCHAR (100) NULL,
  [Image] NVARCHAR (100) NULL,
  [Code] NVARCHAR (400) NULL,
  [Sort] INT NULL,
  [Category] NVARCHAR (100) NULL,
  [Remark] NVARCHAR (500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮', 'SCHEMA', 'RBAC', 'TABLE', 'Button', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮名称' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮标题' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Title';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮图标' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Image';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮代码' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Code';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '按钮分类' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Category';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Remark';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(0：删除、1：有效)' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Button', 'COLUMN', 'ModifyDateTime';
GO

Create Table [RBAC].[HomeShortcut](
  [Id] NVARCHAR (36) Primary Key,
  [UserId] NVARCHAR (36) NULL,
  [Name] NVARCHAR (100) NULL,
  [NavigateUrl] NVARCHAR (400) NULL,
  [Target] NVARCHAR (100) NULL,
  [Image] NVARCHAR (100) NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR (500) NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '首页快捷方式', 'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编号' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'UserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '快捷方式名称' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '导航地址' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'NavigateUrl';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '目标' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Target';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '快捷方式图标' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Image';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'RBAC', 'TABLE', 'HomeShortcut', 'COLUMN', 'Remark';
GO

Create Table [RBAC].[Organization](
  [Id] NVARCHAR (36) Primary Key,
  [ParentId] NVARCHAR (36) NULL,
  [Code] NVARCHAR (100) NULL,
  [Name] NVARCHAR (100) NULL,
  [InnerPhone] NVARCHAR (100) NULL,
  [OuterPhone] NVARCHAR (100) NULL,
  [Manager] NVARCHAR (36) NULL,
  [AssistantManager] NVARCHAR (36) NULL,
  [Fax] NVARCHAR (100) NULL,
  [ZipCode] NVARCHAR (100) NULL,
  [Address] NVARCHAR (400) NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR (500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '组织机构', 'SCHEMA', 'RBAC', 'TABLE', 'Organization', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '上级部门编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'ParentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '部门编码' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Code';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '部门名称' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '内部电话号码' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'InnerPhone';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '外部电话号码' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'OuterPhone';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '部门经理编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Manager';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '部门助理编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'AssistantManager';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '传真' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Fax';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '邮编' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'ZipCode';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '地址' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Address';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Remark';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(0：删除、1：有效)' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Organization', 'COLUMN', 'ModifyDateTime';
GO

Create Table [RBAC].[Role](
  [Id] NVARCHAR (36) Primary Key,
  [ParentId] NVARCHAR (36) NULL,
  [Name] NVARCHAR (100) NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR (500) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色', 'SCHEMA', 'RBAC', 'TABLE', 'Role', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '父角色编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'ParentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色名称' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'Remark';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'RBAC', 'TABLE', 'Role', 'COLUMN', 'ModifyDateTime';
GO

Create Table [RBAC].[RolePermission](
  [Id] NVARCHAR (36) Primary Key,
  [RoleId] NVARCHAR (36) NULL,
  [SystemMenuId] NVARCHAR (36) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色权限', 'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色编号' ,'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', 'COLUMN', 'RoleId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单编号' ,'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', 'COLUMN', 'SystemMenuId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'RolePermission', 'COLUMN', 'CreateDateTime';
GO

Create Table [RBAC].[StaffOrganize](
  [Id] NVARCHAR (36) Primary Key,
  [UserId] NVARCHAR (36) NULL,
  [OrganizationId] NVARCHAR (36) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '人员组织机构', 'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编号' ,'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', 'COLUMN', 'UserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '部门编号' ,'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', 'COLUMN', 'OrganizationId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'StaffOrganize', 'COLUMN', 'CreateDateTime';
GO

Create Table [RBAC].[SystemMenu](
  [Id] NVARCHAR (36) Primary Key,
  [ParentId] NVARCHAR (100) NULL,
  [Name] NVARCHAR (100) NULL,
  [Title] NVARCHAR (100) NULL,
  [Image] NVARCHAR (100) NULL,
  [Category] INT NULL,
  [NavigateUrl] NVARCHAR (400) NULL,
  [Target] NVARCHAR (100) NULL,
  [Sort] INT NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单导航', 'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '主键' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '父节点主键' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'ParentId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单名称' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '标题' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Title';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单图标' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Image';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单分类' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Category';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '导航地址' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'NavigateUrl';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '目标' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Target';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序码' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(0：删除、1：有效)' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'RBAC', 'TABLE', 'SystemMenu', 'COLUMN', 'ModifyDateTime';
GO

Create Table [RBAC].[User](
  [Id] NVARCHAR (36) Primary Key,
  [Reporter] NVARCHAR (36) NULL,
  [Code] NVARCHAR (100) NULL,
  [Account] NVARCHAR (100) NULL,
  [Password] NVARCHAR (100) NULL,
  [Name] NVARCHAR (100) NULL,
  [Sex] INT NULL,
  [Title] NVARCHAR (100) NULL,
  [Email] NVARCHAR (400) NULL,
  [Theme] NVARCHAR (100) NULL,
  [Question] NVARCHAR (100) NULL,
  [Answer] NVARCHAR (100) NULL,
  [Remark] NVARCHAR (500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户', 'SCHEMA', 'RBAC', 'TABLE', 'User', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '汇报者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Reporter';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编码' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Code';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '登录账号' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Account';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '登录密码' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Password';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户名' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '性别(0：女、1：男)' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Sex';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '职称' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Title';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '电子邮件' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Email';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '主题' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Theme';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '找回密码的问题' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Question';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '找回密码的答案' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Answer';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '备注' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Remark';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(0：删除、1：启用、2：停用)' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'RBAC', 'TABLE', 'User', 'COLUMN', 'ModifyDateTime';
GO

Create Table [RBAC].[UserPermission](
  [Id] NVARCHAR (36) Primary Key,
  [UserId] NVARCHAR (36) NULL,
  [SystemMenuId] NVARCHAR (36) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户权限', 'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', 'COLUMN', 'UserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '菜单编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', 'COLUMN', 'SystemMenuId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'UserPermission', 'COLUMN', 'CreateDateTime';
GO

Create Table [RBAC].[UserRole](
  [Id] NVARCHAR (36) Primary Key,
  [UserId] NVARCHAR (36) NULL,
  [RoleId] NVARCHAR (36) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户角色关系', 'SCHEMA', 'RBAC', 'TABLE', 'UserRole', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserRole', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserRole', 'COLUMN', 'UserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserRole', 'COLUMN', 'RoleId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'RBAC', 'TABLE', 'UserRole', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'RBAC', 'TABLE', 'UserRole', 'COLUMN', 'CreateDateTime';
GO

Create Table [Storage].[BusinessFile](
  [Id] UNIQUEIDENTIFIER Primary Key,
  [Category] NVARCHAR (250) NULL,
  [SerialNumber] NVARCHAR (36) NOT NULL,
  [Source] INT NOT NULL,
  [FileId] UNIQUEIDENTIFIER NOT NULL,
  [Description] NVARCHAR (500) NULL,
  [Sort] INT NOT NULL,
  [UploadUserId] NVARCHAR (36) NOT NULL,
  [UploadDateTime] DATETIME NOT NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务文件存储', 'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务分类' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'Category';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '业务流水号' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'SerialNumber';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '来源分类(1：附件、2：富文本编辑器)' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'Source';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'FileId' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'FileId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Description' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'Description';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '排序号' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'Sort';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '上传用户编号' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'UploadUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '上传时间' ,'SCHEMA', 'Storage', 'TABLE', 'BusinessFile', 'COLUMN', 'UploadDateTime';
GO

Create Table [Storage].[File](
  [Id] UNIQUEIDENTIFIER Primary Key,
  [Name] NVARCHAR (1000) NOT NULL,
  [Size] INT NOT NULL,
  [MD5] NVARCHAR (250) NOT NULL,
  [ContentType] NVARCHAR (250) NOT NULL,
  [SavedPath] NVARCHAR (1000) NOT NULL,
  [SavedDateTime] DATETIME NOT NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '上传文件', 'SCHEMA', 'Storage', 'TABLE', 'File', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Id' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件名' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件大小' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'Size';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件MD5值' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'MD5';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件MIME类型' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'ContentType';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件保存路径' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'SavedPath';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '文件保存时间' ,'SCHEMA', 'Storage', 'TABLE', 'File', 'COLUMN', 'SavedDateTime';
GO

Create Table [WebApi].[Api](
  [Id] INT Primary Key,
  [Route] NVARCHAR (500) NULL,
  [HttpVerb] NVARCHAR (50) NULL,
  [Description] NVARCHAR (2000) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Web API', 'SCHEMA', 'WebApi', 'TABLE', 'Api', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Http路由' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'Route';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Http谓词' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'HttpVerb';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '描述' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'Description';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'WebApi', 'TABLE', 'Api', 'COLUMN', 'ModifyDateTime';
GO

Create Table [WebApi].[Role](
  [Id] INT Primary Key,
  [Name] NVARCHAR (50) NULL,
  [Description] NVARCHAR (2000) NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Web Api角色', 'SCHEMA', 'WebApi', 'TABLE', 'Role', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '名称' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'Name';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '描述' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'Description';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'WebApi', 'TABLE', 'Role', 'COLUMN', 'ModifyDateTime';
GO

Create Table [WebApi].[RolePermission](
  [Id] INT Primary Key,
  [RoleId] INT NOT NULL,
  [ApiId] INT NOT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'WebApi权限列表', 'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色编号' ,'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', 'COLUMN', 'RoleId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'Web API编号' ,'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', 'COLUMN', 'ApiId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'WebApi', 'TABLE', 'RolePermission', 'COLUMN', 'CreateDateTime';
GO

Create Table [WebApi].[User](
  [Id] INT Primary Key,
  [Account] NVARCHAR (50) NULL,
  [Password] NVARCHAR (50) NULL,
  [Description] NVARCHAR (2000) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR (36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', 'WebApi用户', 'SCHEMA', 'WebApi', 'TABLE', 'User', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '账号' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'Account';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '密码' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'Password';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '使用者描述' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'Description';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '状态(1：正常，其它：锁定)' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'Status';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'CreateDateTime';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'ModifyUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '修改时间' ,'SCHEMA', 'WebApi', 'TABLE', 'User', 'COLUMN', 'ModifyDateTime';
GO

Create Table [WebApi].[UserRole](
  [Id] INT Primary Key,
  [UserId] INT NOT NULL,
  [RoleId] INT NOT NULL,
  [CreateUserId] NVARCHAR (36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户角色关系', 'SCHEMA', 'WebApi', 'TABLE', 'UserRole', NULL, NULL;
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '编号' ,'SCHEMA', 'WebApi', 'TABLE', 'UserRole', 'COLUMN', 'Id';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '用户编号' ,'SCHEMA', 'WebApi', 'TABLE', 'UserRole', 'COLUMN', 'UserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '角色编号' ,'SCHEMA', 'WebApi', 'TABLE', 'UserRole', 'COLUMN', 'RoleId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建者编号' ,'SCHEMA', 'WebApi', 'TABLE', 'UserRole', 'COLUMN', 'CreateUserId';
GO
EXEC sys.sp_addextendedproperty 'MS_Description', '创建时间' ,'SCHEMA', 'WebApi', 'TABLE', 'UserRole', 'COLUMN', 'CreateDateTime';
GO

