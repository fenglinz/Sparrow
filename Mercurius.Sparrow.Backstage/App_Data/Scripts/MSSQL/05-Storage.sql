CREATE TABLE [Storage].[BusinessFile]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Category] NVARCHAR(250) NULL,
  [SerialNumber] NVARCHAR(36) NOT NULL,
  [Source] INT NOT NULL,
  [FileId] UNIQUEIDENTIFIER NOT NULL,
  [Description] NVARCHAR(500) NULL,
  [Sort] INT NOT NULL,
  [UploadUserId] NVARCHAR(36) NOT NULL,
  [UploadDateTime] DATETIME NOT NULL
);
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务文件存储', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'Id';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务分类', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'Category';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务流水号', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'SerialNumber';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'来源分类(1：附件、2：富文本编辑器)', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'Source';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'Sort';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传用户编号', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'UploadUserId';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传时间', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'BusinessFile', @level2type = 'COLUMN', @level2name = N'UploadDateTime';
GO
CREATE TABLE [Storage].[File]
(
   [Id] UNIQUEIDENTIFIER NOT NULL,
   [Name] NVARCHAR(1000) NOT NULL,
   [Size] INT NOT NULL,
   [MD5] NVARCHAR(250) NOT NULL,
   [ContentType] NVARCHAR(250) NOT NULL,
   [SavedPath] NVARCHAR(1000) NOT NULL,
   [SavedDateTime] DATETIME NOT NULL
);
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传文件', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件名', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'Name';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件大小', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'Size';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件MD5值', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'MD5';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件MIME类型', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'ContentType';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件保存路径', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'SavedPath';
GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件保存时间', @level0type = 'SCHEMA', @level0name = N'Storage', @level1type = 'TABLE',
  @level1name = N'File', @level2type = 'COLUMN', @level2name = N'SavedDateTime';
GO
ALTER TABLE [Storage].[BusinessFile] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [Storage].[File] ADD PRIMARY KEY ([Id]);
GO