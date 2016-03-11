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
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典信息',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典信息',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Type')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Type';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Type';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Key')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'键',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Key';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'键',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Key';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Value')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'值',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Value';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'值',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Value';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'ParentId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'ParentId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'ParentId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'Dictionary', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'Dictionary', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO

INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'2fbadbb1-dbb1-4534-af6f-b68983ee47aa' ,
          NULL ,
          N'错误' ,
          N'Error' ,
          N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          N'4' ,
          N'1' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'3882599d-2d3d-45f0-af84-f911d390df9b' ,
          NULL ,
          N'信息' ,
          N'Info' ,
          N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          N'2' ,
          N'1' ,
          N''
        );
GO
INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'540c76b1-d4b2-47d6-b8ef-1fff76d60067' ,
          NULL ,
          N'调试' ,
          N'Debug' ,
          N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          N'1' ,
          N'1' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'63ed1ebc-f24d-460a-9d76-a73d4cf09330' ,
          NULL ,
          N'记录' ,
          N'Record' ,
          N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          N'5' ,
          N'1' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'd4dea6da-2c0f-4a7c-bbcc-cdccb85baaea' ,
          NULL ,
          N'警告' ,
          N'Warn' ,
          N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          N'3' ,
          N'1' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Dictionary]
        ( [Id] ,
          [Type] ,
          [Key] ,
          [Value] ,
          [ParentId] ,
          [Sort] ,
          [Status] ,
          [Remark]
        )
VALUES  ( N'f871b534-81ec-4f73-a2cc-e2dac035584c' ,
          NULL ,
          N'日志级别' ,
          NULL ,
          NULL ,
          N'5' ,
          NULL ,
          NULL
        );
GO

CREATE TABLE [dbo].[FileStorage]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [FileName] NVARCHAR(1000) NOT NULL ,
      [ContentType] NVARCHAR(250) NOT NULL ,
      [FileSize] INT NULL ,
      [Description] NVARCHAR(250) NULL ,
      [SaveAsPath] NVARCHAR(1000) NULL ,
      [UploadUserId] NVARCHAR(36) NULL ,
      [UploadDateTime] DATETIME NOT NULL
    );

GO
DBCC CHECKIDENT(N'[dbo].[FileStorage]', RESEED, 32);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传文件',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传文件',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'FileName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件名',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'FileName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件名',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'FileName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'ContentType')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'文件MIME类型', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'FileStorage',
        @level2type = 'COLUMN', @level2name = N'ContentType';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'文件MIME类型', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'FileStorage',
        @level2type = 'COLUMN', @level2name = N'ContentType';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'FileSize')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件大小',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'FileSize';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件大小',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'FileSize';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'Description')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件标题',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'Description';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件标题',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'Description';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'SaveAsPath')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'文件保存路径', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'FileStorage',
        @level2type = 'COLUMN', @level2name = N'SaveAsPath';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件保存路径',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'SaveAsPath';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'UploadUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'上传者编号', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'FileStorage',
        @level2type = 'COLUMN', @level2name = N'UploadUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传者编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'UploadUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'FileStorage', 'COLUMN',
                                        N'UploadDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传时间',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
        @level2name = N'UploadDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传时间',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'FileStorage', @level2type = 'COLUMN',
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

INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'0a564fd0-80d4-49f0-b8c0-8ef958f50915' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'add' ,
          N'新增' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'1226AF72-F686-4A19-8A77-C08E6A6E0608' ,
          NULL ,
          NULL ,
          N'Resource' ,
          N'Index' ,
          N'area' ,
          N'区域' ,
          N'区域标签'
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'1D4C983E-A674-419B-812D-6BF4D76466C2' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'empty-data' ,
          N'没有找到符合查询条件的信息！' ,
          NULL
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'2a075689-42d9-4fae-85e9-6485a1f95567' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'query' ,
          N'查询' ,
          N'查询'
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'5cb0b7a6-02b5-464c-ba13-3539ff490e07' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'close' ,
          N'关闭' ,
          N'33'
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'663689c3-d9ad-4f30-9df1-985ba257161e' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'back' ,
          N'返回' ,
          N'返回'
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'74e7f402-fdb1-4d5c-9f97-8cf93417a171' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'delete' ,
          N'删除' ,
          N'删除'
        );
GO
INSERT  INTO [dbo].[Globalization]
        ( [Id] ,
          [Culture] ,
          [Area] ,
          [Controller] ,
          [ViewName] ,
          [Key] ,
          [Value] ,
          [Remark]
        )
VALUES  ( N'a3a03e02-db48-4139-aeb1-fa2503278714' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'save' ,
          N'保存' ,
          N'保存'
        );
GO

CREATE TABLE [dbo].[OperationRecord]
    (
      [Id] INT NOT NULL
               IDENTITY(1, 1) ,
      [BusinessId] NVARCHAR(250) NULL ,
      [BusinessType] NVARCHAR(250) NULL ,
      [UserId] NVARCHAR(50) NULL ,
      [RecordDateTime] DATETIME NULL ,
      [RecordContent] NVARCHAR(MAX) NULL
    );
GO
DBCC CHECKIDENT(N'[dbo].[OperationRecord]', RESEED, 2124);
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', NULL,
                                        NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作记录',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作记录',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'BusinessId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'BusinessId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'BusinessId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'BusinessType')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务类型',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'BusinessType';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务类型',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'BusinessType';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'RecordDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录时间',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'RecordDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录时间',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'RecordDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'OperationRecord', 'COLUMN',
                                        N'RecordContent')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'RecordContent';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'OperationRecord', @level2type = 'COLUMN',
        @level2name = N'RecordContent';
GO
CREATE TABLE [dbo].[SystemLog]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [LogOnId] NVARCHAR(36) NULL ,
      [LogOnName] NVARCHAR(100) NULL ,
      [LogOnIP] NVARCHAR(100) NULL ,
      [ModelName] NVARCHAR(200) NULL ,
      [Summary] NVARCHAR(500) NULL ,
      [Details] NTEXT NULL ,
      [LogLevel] NVARCHAR(100) NULL ,
      [OccurrenceDateTime] DATETIME NULL
    );
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志信息',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志信息',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'LogOnId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'登录者编号', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'SystemLog',
        @level2type = 'COLUMN', @level2name = N'LogOnId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录者编号',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'LogOnId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'LogOnName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'登录者名称', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'SystemLog',
        @level2type = 'COLUMN', @level2name = N'LogOnName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录者名称',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'LogOnName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'LogOnIP')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'登录者IP地址', @level0type = 'SCHEMA', @level0name = N'dbo',
        @level1type = 'TABLE', @level1name = N'SystemLog',
        @level2type = 'COLUMN', @level2name = N'LogOnIP';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录者IP地址',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'LogOnIP';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'ModelName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块名称',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'ModelName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块名称',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'ModelName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'Summary')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志简介',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Summary';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志简介',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Summary';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'Details')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志详情',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Details';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志详情',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'Details';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'LogLevel')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志级别',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'LogLevel';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志级别',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'LogLevel';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemLog', 'COLUMN',
                                        N'OccurrenceDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录时间',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemLog', @level2type = 'COLUMN',
        @level2name = N'OccurrenceDateTime';
ELSE
	EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录时间',
		@level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
		@level1name = N'SystemLog', @level2type = 'COLUMN',
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
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'dbo',
                                        'TABLE', N'SystemSetting', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统设置',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemSetting';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统设置',
        @level0type = 'SCHEMA', @level0name = N'dbo', @level1type = 'TABLE',
        @level1name = N'SystemSetting';
GO

INSERT  INTO [dbo].[SystemSetting]
( [Id] ,
  [ParentId] ,
  [Name] ,
  [Value] ,
  [Remark]
)
VALUES  ( N'015B6ED3-B4FF-4A61-B200-59203A7DBC77' ,
  NULL ,
  N'LogLevel' ,
  N'3' ,
  N''
);
GO
GO
INSERT  INTO [dbo].[SystemSetting]
( [Id] ,
  [ParentId] ,
  [Name] ,
  [Value] ,
  [Remark]
)
VALUES  ( N'03d5f601-e11e-4a44-982b-baed7eab37a3' ,
  N'6b9d4e26-8066-4fc2-bb45-fb02824be265' ,
  N'ProductVersion' ,
  N'Beta 0.4' ,
  NULL
);
GO
GO
INSERT INTO [dbo].[SystemSetting]
( [Id] ,
  [ParentId] ,
  [Name] ,
  [Value] ,
  [Remark]
)
VALUES  ( N'6b9d4e26-8066-4fc2-bb45-fb02824be265' ,
  NULL ,
  N'ProductName' ,
  N'后台管理系统' ,
  NULL
);
GO
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