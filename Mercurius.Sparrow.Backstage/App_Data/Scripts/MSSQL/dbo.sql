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

-- ----------------------------
-- Records of Dictionary
-- ----------------------------
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

SET IDENTITY_INSERT [dbo].[FileStorage] ON;
GO
INSERT  INTO [dbo].[FileStorage]
        ( [Id] ,
          [FileName] ,
          [ContentType] ,
          [FileSize] ,
          [Description] ,
          [SaveAsPath] ,
          [UploadUserId] ,
          [UploadDateTime]
        )
VALUES  ( N'32' ,
          N'5投融资规则.png' ,
          N'image/png' ,
          N'82145' ,
          N'投融资规则' ,
          N'~/uploads/201603/2496a314-d650-4a5a-95bb-90f287f872bc.png' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-04 11:28:23.880'
        );
GO
GO
SET IDENTITY_INSERT [dbo].[FileStorage] OFF;
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

-- ----------------------------
-- Records of Globalization
-- ----------------------------
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

-- ----------------------------
-- Records of OperationRecord
-- ----------------------------
SET IDENTITY_INSERT [dbo].[OperationRecord] ON;
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'16' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-11 15:42:15.287' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'17' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-11 15:42:24.763' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'18' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-11 16:00:59.170' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'19' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-11 16:01:08.670' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'20' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-11 16:06:19.473' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'21' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-11 16:06:30.827' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'22' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-12 10:13:28.127' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'23' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-12 11:20:28.413' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'24' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-12 12:56:38.373' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'25' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 13:32:13.987' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'26' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-12 13:32:25.417' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'27' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-12 17:25:45.230' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'28' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-18 23:10:54.143' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'29' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-20 22:46:05.767' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'30' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-22 23:19:41.260' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'31' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-23 22:55:05.327' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'32' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-24 23:14:49.470' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'33' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-26 00:05:54.600' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'34' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-27 23:33:44.300' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'35' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-03-31 23:36:08.853' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1035' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-03 23:14:34.607' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1036' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-04 16:32:34.637' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1037' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-04 20:50:09.530' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1038' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-04 23:20:04.357' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1039' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-06 01:03:09.100' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1040' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-06 15:43:54.790' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'1041' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-07 23:55:19.307' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2039' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-14 21:53:27.843' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2040' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-18 00:59:05.563' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2041' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-18 15:41:49.233' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2042' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-04-21 22:55:49.257' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2043' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-04-21 23:20:33.970' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2044' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-05-02 10:41:48.737' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2045' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-05-23 00:19:01.130' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2046' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-05-23 00:24:54.470' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2047' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-05-23 20:53:44.183' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2048' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-05-30 00:12:23.767' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2049' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-06 23:53:36.893' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2050' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-07 00:29:51.803' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2051' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-11 22:15:41.867' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2052' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-13 23:22:53.130' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2053' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-14 11:29:34.477' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2054' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-14 13:15:31.560' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2055' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-14 16:14:45.680' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2056' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-06-17 23:38:22.103' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2057' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-01 10:58:05.457' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2058' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-02 14:52:31.713' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2059' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-03 17:39:05.603' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2060' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-14 18:04:12.557' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2061' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-24 12:27:25.593' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2062' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-29 12:32:41.540' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2063' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-30 10:58:23.947' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2064' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-30 13:30:02.540' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2065' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-30 14:00:19.770' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2066' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-07-31 13:37:08.810' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2067' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 13:43:38.980' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2068' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 13:49:01.507' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2069' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 14:12:17.250' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2070' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 15:56:10.707' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2071' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 15:56:20.430' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2072' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 16:10:11.390' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2073' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 16:19:00.133' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2074' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-03 16:21:10.743' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2075' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-04 09:15:29.430' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2076' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-04 11:31:56.863' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2077' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-04 13:40:45.507' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2078' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-04 17:46:51.867' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2079' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-05 09:01:38.363' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2080' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-05 10:03:10.790' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2081' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-05 11:41:07.483' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2082' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-05 13:12:42.913' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2083' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-05 16:54:23.520' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2084' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2015-08-18 15:28:52.637' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2085' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-11 12:24:59.580' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2086' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-11 12:50:04.980' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2087' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-13 09:25:36.950' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2088' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-13 11:37:35.913' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2089' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-14 17:14:44.247' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2090' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-15 10:17:30.267' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2091' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-18 09:52:37.103' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2092' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-18 14:05:38.210' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2093' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-19 09:43:30.590' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2094' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-19 11:32:05.207' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2095' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-19 13:16:23.897' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2096' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-20 10:04:33.963' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2097' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-20 16:15:39.307' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2098' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-28 10:19:57.463' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2099' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-28 12:57:56.867' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2100' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-01-29 14:45:44.797' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2101' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-02-23 16:06:27.190' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2102' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-02-25 09:41:48.140' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2103' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-02-25 09:45:00.500' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2104' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-02-25 09:54:09.907' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2105' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-02-25 10:56:20.240' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2106' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-02-25 11:02:56.967' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2107' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-02-25 11:03:31.793' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2108' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-02 11:48:01.267' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2109' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 14:59:33.733' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2110' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-03 15:21:55.543' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2111' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 15:22:01.193' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2112' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 15:23:47.130' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2113' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 16:18:57.797' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2114' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 16:24:17.843' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2115' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-03 16:29:35.530' ,
          N'于(127.0.0.1)登出'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2116' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 16:29:46.357' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2117' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-03 16:48:21.120' ,
          N'于(::1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2118' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 11:10:04.587' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2119' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 12:30:56.383' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2120' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 15:48:45.523' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2121' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 21:27:26.373' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2122' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 23:19:56.227' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2123' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-04 23:24:31.337' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
INSERT  INTO [dbo].[OperationRecord]
        ( [Id] ,
          [BusinessId] ,
          [BusinessType] ,
          [UserId] ,
          [RecordDateTime] ,
          [RecordContent]
        )
VALUES  ( N'2124' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'用户登录/登出' ,
          NULL ,
          N'2016-03-07 09:31:05.970' ,
          N'于(127.0.0.1)登录'
        );
GO
GO
SET IDENTITY_INSERT [dbo].[OperationRecord] OFF;
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
