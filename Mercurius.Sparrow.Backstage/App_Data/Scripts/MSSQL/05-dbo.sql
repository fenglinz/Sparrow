CREATE TABLE [dbo].[Dictionary]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [Type] INT NULL ,
  [Key] NVARCHAR(400) NULL ,
  [Value] NVARCHAR(400) NULL ,
  [ParentId] NVARCHAR(72) NULL ,
  [Sort] INT NULL ,
  [Status] INT NULL ,
  [Remark] NVARCHAR(500) NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'字典信息' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'类型' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Type';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'键' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Key';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'值' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Value';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'父级编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ParentId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Dictionary' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark';
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'2fbadbb1-dbb1-4534-af6f-b68983ee47aa', NULL, N'错误', N'Error', N'f871b534-81ec-4f73-a2cc-e2dac035584c', N'4', N'1', NULL );
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'3882599d-2d3d-45f0-af84-f911d390df9b', NULL, N'信息', N'Info', N'f871b534-81ec-4f73-a2cc-e2dac035584c', N'2', N'1', N'' );
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'540c76b1-d4b2-47d6-b8ef-1fff76d60067', NULL, N'调试', N'Debug', N'f871b534-81ec-4f73-a2cc-e2dac035584c', N'1', N'1', NULL );
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'63ed1ebc-f24d-460a-9d76-a73d4cf09330', NULL, N'记录', N'Record', N'f871b534-81ec-4f73-a2cc-e2dac035584c', N'5', N'1', NULL );
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'd4dea6da-2c0f-4a7c-bbcc-cdccb85baaea', NULL, N'警告', N'Warn', N'f871b534-81ec-4f73-a2cc-e2dac035584c', N'3', N'1', NULL );
GO
INSERT  INTO [dbo].[Dictionary]( [Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark] )VALUES( N'f871b534-81ec-4f73-a2cc-e2dac035584c', NULL, N'日志级别', NULL, NULL, N'5', NULL, NULL );
GO
CREATE TABLE [dbo].[FileStorage]
(
  [Id] INT NOT NULL IDENTITY(1, 1) ,
  [FileName] NVARCHAR(1000) NOT NULL ,
  [ContentType] NVARCHAR(250) NOT NULL ,
  [FileSize] INT NULL ,
  [Description] NVARCHAR(250) NULL ,
  [SaveAsPath] NVARCHAR(1000) NULL ,
  [ScanStatus] INT NULL ,
  [UploadUserId] NVARCHAR(36) NULL ,
  [UploadDateTime] DATETIME NOT NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'上传文件' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'文件名' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'FileName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'文件MIME类型' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ContentType';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'文件大小' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'FileSize';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'文件标题' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Description';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'文件保存路径' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'SaveAsPath';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'扫描标记' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ScanStatus';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'上传者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UploadUserId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'上传时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'FileStorage' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UploadDateTime';
GO
CREATE TABLE [dbo].[Globalization]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [Culture] NVARCHAR(20) NULL ,
  [Area] NVARCHAR(400) NULL ,
  [Controller] NVARCHAR(400) NULL ,
  [ViewName] NVARCHAR(400) NULL ,
  [Key] NVARCHAR(400) NULL ,
  [Value] NVARCHAR(400) NULL ,
  [Remark] NVARCHAR(500) NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'国际化信息' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'区域语言' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Culture';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'区域' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Area';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'控制器' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Controller';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'视图名' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ViewName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'键' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Key';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'值' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Value';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'Globalization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark';
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'0a564fd0-80d4-49f0-b8c0-8ef958f50915', NULL, NULL, NULL, NULL, N'add', N'新增', NULL );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'1226AF72-F686-4A19-8A77-C08E6A6E0608', NULL, NULL, N'Resource', N'Index', N'area', N'区域', N'区域标签' );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'1D4C983E-A674-419B-812D-6BF4D76466C2', NULL, NULL, NULL, NULL, N'empty-data', N'没有找到符合查询条件的信息！', NULL );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'2a075689-42d9-4fae-85e9-6485a1f95567', NULL, NULL, NULL, NULL, N'query', N'查询', N'查询' );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'5cb0b7a6-02b5-464c-ba13-3539ff490e07', NULL, NULL, NULL, NULL, N'close', N'关闭', N'33' );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'663689c3-d9ad-4f30-9df1-985ba257161e', NULL, NULL, NULL, NULL, N'back', N'返回', N'返回' );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'74e7f402-fdb1-4d5c-9f97-8cf93417a171', NULL, NULL, NULL, NULL, N'delete', N'删除', N'删除' );
GO
INSERT  INTO [dbo].[Globalization]( [Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark] )VALUES( N'a3a03e02-db48-4139-aeb1-fa2503278714', NULL, NULL, NULL, NULL, N'save', N'保存', N'保存' );
GO
CREATE TABLE [dbo].[News] (
  [Id] uniqueidentifier NOT NULL ,
  [Category] nvarchar(250) NULL ,
  [Title] nvarchar(500) NULL ,
  [Content] nvarchar(MAX) NULL ,
  [Attachments] nvarchar(4000) NULL ,
  [Status] int NULL ,
  [BrowseTimes] int NULL ,
  [PublisherId] nvarchar(36) NULL ,
  [PublishDateTime] datetime NULL 
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description', 
    @value = N'新闻', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'编号', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'分类', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Category'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'标题', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Title'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'内容', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Content'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'附件', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Attachments'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'状态(1：待审核，2：已发布，4：已删除)', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'浏览次数', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'BrowseTimes'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'发布者编号', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'PublisherId'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'发布时间', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'News', 
    @level2type = 'COLUMN', 
    @level2name = N'PublishDateTime'
GO
CREATE TABLE [dbo].[NewsComment] (
  [Id] uniqueidentifier NOT NULL ,
  [NewsId] uniqueidentifier NOT NULL ,
  [ReplyCommentId] uniqueidentifier NULL ,
  [Content] nvarchar(2000) NULL ,
  [Status] int NULL ,
  [LikePoints] int NULL ,
  [CommentUserId] nvarchar(36) NULL ,
  [CommentDateTime] datetime NULL 
)
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'新闻评论', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'编号', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'新闻编号', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'NewsId'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'评论编号(回复评论)', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'ReplyCommentId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description', 
    @value = N'内容', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'Content'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'状态(1：代审核，2：审核通过、4：审核失败)', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'点赞次数', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'LikePoints'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description', 
    @value = N'评论者编号', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'CommentUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = N'评论时间', 
    @level0type = 'SCHEMA', 
    @level0name = N'dbo', 
    @level1type = 'TABLE', 
    @level1name = N'NewsComment', 
    @level2type = 'COLUMN', 
    @level2name = N'CommentDateTime'
GO
CREATE TABLE [dbo].[OperationRecord]
(
  [Id] INT NOT NULL IDENTITY(1, 1) ,
  [BusinessCategory] NVARCHAR(250) NULL ,
  [BusinessSerialNumber] NVARCHAR(250) NULL ,
  [Content] NVARCHAR(MAX) NULL ,
  [LogOnIPAddress] NVARCHAR(50) NULL ,
  [AddedUserId] NVARCHAR(36) NULL ,
  [AddedDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'操作记录' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'业务分类' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'BusinessCategory';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'业务流水号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'BusinessSerialNumber';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'内容' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Content';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'登录IP地址' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'LogOnIPAddress';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'记录者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'AddedUserId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'记录时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'OperationRecord' ,
    @level2type = 'COLUMN' ,
    @level2name = N'AddedDateTime';
GO
CREATE TABLE [dbo].[SystemLog]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [LogOnId] NVARCHAR(36) NULL ,
  [LogOnIP] NVARCHAR(100) NULL ,
  [ModelName] NVARCHAR(200) NULL ,
  [Summary] NVARCHAR(500) NULL ,
  [Details] NTEXT NULL ,
  [LogLevel] NVARCHAR(100) NULL ,
  [OccurrenceDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'日志' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'登录者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'LogOnId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'登录者IP地址' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'LogOnIP';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'模块名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModelName';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'日志简介' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Summary';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'日志详情' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Details';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'日志级别' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'LogLevel';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'记录时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemLog' ,
    @level2type = 'COLUMN' ,
    @level2name = N'OccurrenceDateTime';
GO
CREATE TABLE [dbo].[SystemSetting]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [ParentId] NVARCHAR(200) NULL ,
  [Name] NVARCHAR(200) NULL ,
  [Value] NVARCHAR(500) NULL ,
  [Remark] NVARCHAR(500) NULL
);
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'系统设置' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'父级编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ParentId';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'值' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Value';
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'dbo' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemSetting' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark';
GO
INSERT  INTO [dbo].[SystemSetting]( [Id], [ParentId], [Name], [Value], [Remark] )VALUES( N'015B6ED3-B4FF-4A61-B200-59203A7DBC77', NULL, N'LogLevel', N'2', N'' );
GO
INSERT  INTO [dbo].[SystemSetting]( [Id], [ParentId], [Name], [Value], [Remark] )VALUES( N'03d5f601-e11e-4a44-982b-baed7eab37a3', N'6b9d4e26-8066-4fc2-bb45-fb02824be265', N'ProductVersion', N'1.0', NULL );
GO
INSERT  INTO [dbo].[SystemSetting]( [Id], [ParentId], [Name], [Value], [Remark] )VALUES( N'6b9d4e26-8066-4fc2-bb45-fb02824be265', NULL, N'ProductName', N'后台管理系统', NULL );
GO
INSERT  INTO [dbo].[SystemSetting]( [Id], [ParentId], [Name], [Value], [Remark] )VALUES( N'E402EAAF-B0C6-4D38-8809-B7F6FACDB051', NULL, N'WebApiDocumentUrl', N'http://127.0.0.1:8000/FileStorage/Swagger/docs/v1', NULL );
GO
ALTER TABLE [dbo].[Dictionary] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[FileStorage] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[Globalization] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[OperationRecord] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[SystemLog] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[SystemSetting] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [dbo].[SystemSetting] ADD UNIQUE ([ParentId] ASC, [Name] ASC);
GO