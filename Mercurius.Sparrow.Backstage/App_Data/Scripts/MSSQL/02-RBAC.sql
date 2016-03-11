CREATE TABLE [RBAC].[Button]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [Name] NVARCHAR(100) NULL ,
      [Title] NVARCHAR(100) NULL ,
      [Image] NVARCHAR(100) NULL ,
      [Code] NVARCHAR(400) NULL ,
      [Sort] INT NULL ,
      [Category] NVARCHAR(100) NULL ,
      [Remark] NVARCHAR(500) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );

GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮信息',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮信息',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Title')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮标题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Title';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮标题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Title';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Image')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮图标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Image';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮图标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Image';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Code')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮代码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Code';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮代码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Code';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN', N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN', @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'Category')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'按钮分类',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Category';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'按钮分类',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Category';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'Button',
        @level2type = 'COLUMN', @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'Button',
        @level2type = 'COLUMN', @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Button', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Button', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'020e2c2a-e203-4694-85ef-c73bd301ad72' ,
          N'备份' ,
          N'备份' ,
          N'glyphicon glyphicon-download-alt' ,
          N'OnBackup' ,
          N'32' ,
          N'工具栏' ,
          N'数据库备份' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:56:09.410'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'067b2de9-037f-4bb9-8a41-285eb3fc7267' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-edit' ,
          N'OnEdit' ,
          N'2' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-28 00:01:55.903'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0e8c3c59-586a-48a0-a1ef-5a83f4a2d6fd' ,
          N'恢复' ,
          N'恢复' ,
          N'glyphicon glyphicon-open' ,
          N'OnRecover' ,
          N'33' ,
          N'工具栏' ,
          N'还原恢复数据库' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:56:19.470'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'13f9189c-ccbe-4e4a-8292-d408fa8d119f' ,
          N'导入' ,
          N'导入' ,
          N'glyphicon glyphicon-import' ,
          N'OnImport' ,
          N'5' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:44:41.430'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'1b88ce60-6438-4bb9-891d-c0bf4832e2d5' ,
          N'设置' ,
          N'设置' ,
          N'glyphicon glyphicon-cog' ,
          N'OnSetting' ,
          N'7' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:01.670'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2e5d2d97-1367-4036-8040-cfcd261e9e5f' ,
          N'锁定' ,
          N'锁定' ,
          N'glyphicon glyphicon-lock' ,
          N'OnLock' ,
          N'22' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:52:12.960'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2f1a1ba6-276e-4e7f-a219-ecfdb50e63fb' ,
          N'发布' ,
          N'发布' ,
          N'glyphicon glyphicon-globe' ,
          N'OnPublish' ,
          N'18' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:50:36.663'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'3194373e-1b97-4c92-9cd2-4778b00c3b13' ,
          N'清空' ,
          N'清空' ,
          N'glyphicon glyphicon-trash' ,
          N'OnClear' ,
          N'26' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:53:07.433'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'42cef74b-2c60-4d62-93b8-d0f6d16ca3b0' ,
          N'上传' ,
          N'上传' ,
          N'glyphicon glyphicon-cloud-upload' ,
          N'OnUpload' ,
          N'9' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:21.980'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'43334b34-f78e-4187-ad2f-1600bb932896' ,
          N'复制' ,
          N'复制' ,
          N'fa fa-copy' ,
          N'OnCopy' ,
          N'11' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:40.533'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'43334b34-f78e-4187-ad2f-1610bb912896' ,
          N'打印' ,
          N'打印' ,
          N'glyphicon glyphicon-print' ,
          N'OnPrint' ,
          N'13' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:46:00.973'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'43334b34-f78e-4187-ad2f-1610bb932896' ,
          N'还原' ,
          N'还原' ,
          N'fa fa-mail-reply' ,
          N'OnRestore' ,
          N'12' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:48.883'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'58d19434-705a-4199-acdc-b6d0322501bf' ,
          N'下载' ,
          N'下载' ,
          N'glyphicon glyphicon-cloud-download' ,
          N'OnDownload' ,
          N'10' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:31.510'
        );
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'73f60b12-fc1f-4927-9803-616fef6ed1b7' ,
          N'授权' ,
          N'授权' ,
          N'glyphicon glyphicon-thumbs-up' ,
          N'OnAccredit' ,
          N'23' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:52:24.513'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'79a3ec54-3c07-4204-bfc6-5b1f111474b3' ,
          N'刷新' ,
          N'刷新' ,
          N'glyphicon glyphicon-refresh' ,
          N'OnRefresh' ,
          N'21' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:51:58.763'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'79a3ec54-3c07-4204-bfc6-5b7f111474b3' ,
          N'浏览' ,
          N'浏览' ,
          N'fa fa-unlink' ,
          N'OnBrowse' ,
          N'20' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:51:02.440'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7e33c9ec-7573-450b-aa4f-c52771ebdd3c' ,
          N'升级' ,
          N'升级' ,
          N'fa fa-upload' ,
          N'OnUpgrade' ,
          N'17' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:50:20.667'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7f6e3c60-4ac5-4c59-a15d-40832b353423' ,
          N'保存' ,
          N'保存' ,
          N'glyphicon glyphicon-floppy-save' ,
          N'OnSave' ,
          N'27' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:53:18.890'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a08fee4b-98c1-4974-be4a-5dbcc0820cbd' ,
          N'新增' ,
          N'添加' ,
          N'glyphicon glyphicon-plus' ,
          N'OnCreate' ,
          N'1' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-05 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 16:16:40.990'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a7400cab-6e80-47cd-9cca-e3de79cba1c3' ,
          N'分配成员' ,
          N'分配成员' ,
          N'fa fa-group' ,
          N'OnAllotMember' ,
          N'31' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:55:57.463'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a7e78077-5c3a-4705-8c58-4c4e696ee201' ,
          N'取消' ,
          N'取消' ,
          N'glyphicon glyphicon-floppy-remove' ,
          N'OnCancel' ,
          N'28' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:53:49.403'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b0482c2d-b466-4d05-beb2-45b2bd7981c4' ,
          N'帮助' ,
          N'帮助' ,
          N'glyphicon glyphicon-question-sign' ,
          N'OnHelp' ,
          N'19' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:50:49.657'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bc43a78e-2952-4a61-ab1d-e57c2bfa3953' ,
          N'详细' ,
          N'详细' ,
          N'glyphicon glyphicon-list-alt' ,
          N'OnShowDetail' ,
          N'29' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-09 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:54:06.897'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c44ae1e3-8c46-474f-a2a3-517bdf39d68d' ,
          N'分配权限' ,
          N'分配权限' ,
          N'glyphicon glyphicon-tower' ,
          N'OnAllotAuthority' ,
          N'25' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:52:54.340'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c9df5a92-ed50-4a8d-9f5c-765b5c15e3bc' ,
          N'发送' ,
          N'发送' ,
          N'glyphicon glyphicon-send' ,
          N'OnSend' ,
          N'14' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:46:09.807'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cd2e937e-7f3a-4823-958b-2acab4711f08' ,
          N'举报' ,
          N'举报' ,
          N'glyphicon glyphicon-phone-alt' ,
          N'OnReport' ,
          N'16' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:46:30.160'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cfa9fe4b-a30c-43fe-b73d-df02516c2e07' ,
          N'分配按钮' ,
          N'分配按钮' ,
          N'fa fa-cogs' ,
          N'OnAllotButtons' ,
          N'24' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:52:41.293'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd10be9f7-2382-4336-90ed-60193eb80382' ,
          N'返回' ,
          N'返回' ,
          N'glyphicon glyphicon-chevron-left' ,
          N'OnBack' ,
          N'15' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:46:18.143'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd6cdbfd6-017b-4639-8c2d-6fb63174b0a5' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'OnDelete' ,
          N'3' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 16:03:28.180'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd8680d5e-0c3a-41f0-a1d1-dd5152b3014c' ,
          N'审核' ,
          N'审核' ,
          N'glyphicon glyphicon-check' ,
          N'OnAudit' ,
          N'8' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:45:13.640'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'e452d1ef-bde7-4f66-a525-4067a4ec7e49' ,
          N'查询' ,
          N'查询' ,
          N'glyphicon glyphicon-search' ,
          N'OnSearch' ,
          N'4' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:44:31.137'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'e7f33901-604c-4a51-b122-e6529066983c' ,
          N'导出' ,
          N'导出' ,
          N'glyphicon glyphicon-export' ,
          N'OnExport' ,
          N'6' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-06 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:44:50.197'
        );
GO
GO
INSERT  INTO [RBAC].[Button]
        ( [Id] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Code] ,
          [Sort] ,
          [Category] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'ee0c5fb9-53a4-450c-9941-94d2c7a6ee42' ,
          N'关于' ,
          N'关于' ,
          N'glyphicon glyphicon-info-sign' ,
          N'OnAbout' ,
          N'30' ,
          N'工具栏' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-09 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 15:54:19.937'
        );
GO
GO

CREATE TABLE [RBAC].[HomeShortcut]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserId] NVARCHAR(36) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [NavigateUrl] NVARCHAR(400) NULL ,
      [Target] NVARCHAR(100) NULL ,
      [Image] NVARCHAR(100) NULL ,
      [Sort] INT NULL ,
      [Remark] NVARCHAR(500) NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'首页快捷方式', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'HomeShortcut';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'首页快捷方式',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'快捷方式名称', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'HomeShortcut',
        @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'快捷方式名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'NavigateUrl')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'导航地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'NavigateUrl';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'导航地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'NavigateUrl';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Target')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Target';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Target';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Image')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'快捷方式图标', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'HomeShortcut',
        @level2type = 'COLUMN', @level2name = N'Image';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'快捷方式图标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Image';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'HomeShortcut', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'HomeShortcut', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO

-- ----------------------------
-- Records of HomeShortcut
-- ----------------------------
INSERT  INTO [RBAC].[HomeShortcut]
        ( [Id] ,
          [UserId] ,
          [Name] ,
          [NavigateUrl] ,
          [Target] ,
          [Image] ,
          [Sort] ,
          [Remark]
        )
VALUES  ( N'40abb9d3-219a-4469-9ce5-40c4eb088b0a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'个人信息' ,
          N'/Admin/User/CurrentUser' ,
          N'Iframe' ,
          N'glyphicon glyphicon-user' ,
          N'2' ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[HomeShortcut]
        ( [Id] ,
          [UserId] ,
          [Name] ,
          [NavigateUrl] ,
          [Target] ,
          [Image] ,
          [Sort] ,
          [Remark]
        )
VALUES  ( N'970a4af6-ce3e-4424-8e7a-a3184b4e85a5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'数据统计' ,
          N'#' ,
          N'Iframe' ,
          N'fa fa-bar-chart' ,
          N'5' ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[HomeShortcut]
        ( [Id] ,
          [UserId] ,
          [Name] ,
          [NavigateUrl] ,
          [Target] ,
          [Image] ,
          [Sort] ,
          [Remark]
        )
VALUES  ( N'd3973803-c2bd-4e16-be0d-cd26673ba0dd' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'菜单管理' ,
          N'/Admin/SystemMenu/Index' ,
          N'Iframe' ,
          N'fa fa-sitemap' ,
          N'1' ,
          N'菜单管理页'
        );
GO
GO

CREATE TABLE [RBAC].[Organization]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [ParentId] NVARCHAR(36) NULL ,
      [Code] NVARCHAR(100) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [InnerPhone] NVARCHAR(100) NULL ,
      [OuterPhone] NVARCHAR(100) NULL ,
      [Manager] NVARCHAR(36) NULL ,
      [AssistantManager] NVARCHAR(36) NULL ,
      [Fax] NVARCHAR(100) NULL ,
      [ZipCode] NVARCHAR(100) NULL ,
      [Address] NVARCHAR(400) NULL ,
      [Sort] INT NULL ,
      [Remark] NVARCHAR(500) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'ParentId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'上级部门编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'ParentId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上级部门编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ParentId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Code')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门编码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Code';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门编码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Code';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'InnerPhone')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'内部电话号码', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'InnerPhone';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内部电话号码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'InnerPhone';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'OuterPhone')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'外部电话号码', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'OuterPhone';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外部电话号码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'OuterPhone';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Manager')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'部门经理编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'Manager';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门经理编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Manager';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'AssistantManager')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'部门助理编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'AssistantManager';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门助理编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'AssistantManager';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Fax')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'传真',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Fax';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'传真',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Fax';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'ZipCode')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'邮编',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ZipCode';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮编',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ZipCode';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Address')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Address';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Address';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Organization',
        @level2type = 'COLUMN', @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Organization', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Organization', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

-- ----------------------------
-- Records of Organization
-- ----------------------------
INSERT  INTO [RBAC].[Organization]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [InnerPhone] ,
          [OuterPhone] ,
          [Manager] ,
          [AssistantManager] ,
          [Fax] ,
          [ZipCode] ,
          [Address] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'0' ,
          N'1000001' ,
          N'湖北星云资本管理有限公司' ,
          NULL ,
          NULL ,
          N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0' ,
          N'62a5723d-36d2-49b3-b161-df519671f8bf' ,
          NULL ,
          N'000000' ,
          NULL ,
          N'1' ,
          NULL ,
          N'1' ,
          NULL ,
          N'2013-04-11 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-07 13:55:36.777'
        );
GO
GO
INSERT  INTO [RBAC].[Organization]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [InnerPhone] ,
          [OuterPhone] ,
          [Manager] ,
          [AssistantManager] ,
          [Fax] ,
          [ZipCode] ,
          [Address] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'550b796b-a6ca-4b18-a0a0-d5812dbd32d8' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'1000002' ,
          N'人事部' ,
          NULL ,
          NULL ,
          N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          N'74f86691-537a-4c5c-a7e8-6f68bbe95788' ,
          NULL ,
          N'000000' ,
          NULL ,
          N'1' ,
          NULL ,
          N'1' ,
          NULL ,
          N'2013-04-11 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 16:54:56.647'
        );
GO
GO
INSERT  INTO [RBAC].[Organization]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [InnerPhone] ,
          [OuterPhone] ,
          [Manager] ,
          [AssistantManager] ,
          [Fax] ,
          [ZipCode] ,
          [Address] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7fd46efd-5b1b-48da-95d1-1992e347f532' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'1000003' ,
          N'财务部' ,
          N'111' ,
          NULL ,
          N'75e1f7a2-74ab-4d21-af74-a601f30f02ee' ,
          NULL ,
          NULL ,
          N'000000' ,
          NULL ,
          N'2' ,
          NULL ,
          N'1' ,
          NULL ,
          N'2013-04-11 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 16:33:24.850'
        );
GO
GO
INSERT  INTO [RBAC].[Organization]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [InnerPhone] ,
          [OuterPhone] ,
          [Manager] ,
          [AssistantManager] ,
          [Fax] ,
          [ZipCode] ,
          [Address] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8b6ab119-6bf9-408b-902f-4fad259127e3' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'1000006' ,
          N'研发部' ,
          NULL ,
          NULL ,
          N'0ede986c-5a68-4e74-9198-3c1e5015e0d2' ,
          NULL ,
          NULL ,
          N'000000' ,
          NULL ,
          N'5' ,
          NULL ,
          N'1' ,
          NULL ,
          N'2013-04-11 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-14 13:54:51.287'
        );
GO
GO
INSERT  INTO [RBAC].[Organization]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [InnerPhone] ,
          [OuterPhone] ,
          [Manager] ,
          [AssistantManager] ,
          [Fax] ,
          [ZipCode] ,
          [Address] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'90a12104-9bf7-4ce5-bc79-c14b73d32e62' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'1000005' ,
          N'行政部' ,
          NULL ,
          NULL ,
          N'4ef78175-afc9-48e4-9b85-13f1e9a86a79' ,
          N'xxx' ,
          NULL ,
          N'000000' ,
          NULL ,
          N'4' ,
          NULL ,
          N'1' ,
          NULL ,
          N'2013-04-11 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-14 13:54:30.700'
        );
GO
GO

CREATE TABLE [RBAC].[Recyclebin]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [Category] NVARCHAR(100) NULL ,
      [DatabaseName] NVARCHAR(100) NULL ,
      [Schema] NVARCHAR(50) NULL ,
      [TableName] NVARCHAR(100) NULL ,
      [ColumnName] NVARCHAR(100) NULL ,
      [Value] NVARCHAR(100) NULL ,
      [Remark] NVARCHAR(1000) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'回收站',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'回收站',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'Category')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'删除信息分类', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Recyclebin',
        @level2type = 'COLUMN', @level2name = N'Category';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除信息分类',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Category';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'DatabaseName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'数据库名称', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Recyclebin',
        @level2type = 'COLUMN', @level2name = N'DatabaseName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据库名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'DatabaseName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'TableName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'TableName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'表名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'TableName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'ColumnName')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'唯一列名',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'ColumnName';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'唯一列名',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'ColumnName';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'Value')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'值',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Value';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'值',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Value';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Recyclebin',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Recyclebin', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Recyclebin', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

CREATE TABLE [RBAC].[Role]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [ParentId] NVARCHAR(36) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [Restriction] NVARCHAR(400) NULL ,
      [AllowEdit] INT NULL ,
      [AllowDelete] INT NULL ,
      [Sort] INT NULL ,
      [Remark] NVARCHAR(500) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'ParentId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'父角色编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ParentId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父角色编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ParentId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN', N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'Restriction')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色限制',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'Restriction';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色限制',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'Restriction';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'AllowEdit')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'AllowDelete')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN', N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN', N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN', @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN', N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'Role',
        @level2type = 'COLUMN', @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'Role',
        @level2type = 'COLUMN', @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'Role', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'Role', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT  INTO [RBAC].[Role]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Restriction] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'0' ,
          N'运营部' ,
          NULL ,
          NULL ,
          NULL ,
          N'3' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-22 15:53:23.393' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-07 13:39:00.420'
        );
GO
GO
INSERT  INTO [RBAC].[Role]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Restriction] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'0' ,
          N'管理员' ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'管理员所在角色。' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-10 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-22 15:52:13.677'
        );
GO
GO

CREATE TABLE [RBAC].[RolePermission]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [RoleId] NVARCHAR(36) NULL ,
      [SystemMenuId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色权限',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色权限',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', 'COLUMN',
                                        N'RoleId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'RoleId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'RoleId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', 'COLUMN',
                                        N'SystemMenuId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'RolePermission',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'RolePermission', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'RolePermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'00fc8f4d-9e78-49df-9b32-aafc1648d23e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'758429ec-3ae9-4a9e-a994-efe7c5395b4a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'01c471e7-0895-445f-80d3-d56880a33b4f' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'03b285af-7dad-44ba-b2d4-df9a3c6ba2ee' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'677da57b-e351-4831-bb90-2e11b354c1a2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'066bfa23-7d70-40cd-b18b-34497c4c43bf' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'ad7be971-979d-4e02-86ca-7f9d89c72770' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0813428d-0794-465f-9c4e-d0cc0d002f03' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'9541e7b4-c80e-4a3c-8c5e-91ff5e315457' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'08c521cf-3738-40c4-a252-b3847eb30885' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0c8ff659-de13-4087-9bcd-227970b00312' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bdbfa627-989f-4725-8ab6-0cb75feeda7f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0cc581e6-12fa-4245-b233-a500ee38e6c9' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'74a5586b-8ed6-4581-92d6-be1599147684' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0deb16fb-1553-4bc3-8fba-0c92dd597e37' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'9606167a-fd94-4ad6-88b8-1b419dc3410e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0f18f6f0-8af3-4491-aca6-06e1b5482115' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'2df2974e-f90a-4c4d-baf5-fcd16267d36b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0f64f239-188b-498f-894f-6fc6f0a7449d' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0fa4b10f-8e71-440a-a2b7-f82db78b845f' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'599cbed1-45c4-4792-978c-d5bbcd2819e2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1377c843-d692-453e-a1cf-9c28241f9472' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'c9d6878c-4f55-4787-af62-c73204c940e3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'16fa44e1-4c5d-4d94-85a4-fa63796213a8' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'f6a0e772-8ad1-4db1-81d6-1c6a7211dc0f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'180144d7-b43f-4dab-923c-19001e64c9db' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'182e86f1-e7a9-40b5-80e3-cdcc4f1f625e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'a1086dca-5677-4107-9a95-9a70259e927d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'19ae1d94-e3a0-4e2f-8ed6-d9865a411bae' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'7961fd3c-6f0e-496c-a656-772742e14d5a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'19b27cf1-aa45-41d3-9bba-e2031ec53e4a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'68427266-1bdd-42c0-bd60-094cba29bfaa' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1c4c3bbc-af30-4b4e-a6af-d95b5b807768' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'cc91e8f6-b7ff-4c73-b934-302ad3398922' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1dcfff9c-5ad0-45cc-8964-dad1744d54c1' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'00461fd8-0a69-4221-bf29-af1313d0a9b0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1e09ccd3-e240-4f30-aacc-b787a2095b2f' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'375439c5-6027-4e9c-91b1-b394d869ebd0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1fe7a3ae-6dfa-468d-a32a-c64bda3f697d' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'0c99c9e6-ee40-4fae-8eaa-56378855204a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2093eb87-1ffd-439c-940f-7b417588245b' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'21abef45-5f04-4b35-ace1-77442aa9de86' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'feba1602-3248-4cb1-83e6-ba92bd071f1a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'242740f5-7a68-4051-b338-2b47aaa21f0f' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'fc85f7df-b8d8-4e12-a2c1-00606d290a95' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2617e08a-540a-4ca4-8ff2-b6ed77473816' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'7dfdf495-83fe-4194-a042-35fe28c2e36b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'26744dde-eea0-434f-8b61-84fd067627a6' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bd959bfa-797c-48ff-b72b-241c84cd03a8' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'26c42fdc-9ef3-4e6b-81eb-1539cd96c3c3' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'295b46f4-427d-47a0-94e5-c96a7ebc3915' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'bc011009-243a-4ca4-a52a-1429c92d1867' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2aad5c6e-aa8b-44ae-952d-3854e924910a' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'1a1dd2b9-dfdf-4fcd-af2c-eb9735b46a39' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2ba64a6f-c19d-4f43-818e-db61e9352817' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'269bf251-0579-428d-811a-75be20089161' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2bf0544e-99af-4c6c-bcc7-ffddcb2cb9ad' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2d68e4f5-3374-4df9-8de9-a17b2181da3a' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2dd2326f-8616-4f9a-b8a0-701d5652e42a' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'd1d3400d-0f5d-48d9-82ff-b836cfe85c74' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2eae893a-d153-4ce4-8e10-d6737f7831de' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'88a897ac-f048-4ca4-9832-cbbe06b5fe96' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2ec4c22c-ef52-4ec3-88e0-a3d71a3951ae' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'30bc5f86-cea2-4072-b96f-cf1f8cbfe057' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'8fcead5e-991a-4904-99ac-2c9d9269040b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'320946c1-b7dd-4b82-a0d6-4d42381dc5b1' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'c47836ce-57fe-4f48-a5f6-a46ac565ff4e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'32586ef1-7269-4a16-898b-b6de199be66b' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'd933de2b-5dd1-443c-bd5e-bbbbd7bfe47f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3537b170-b432-4f4f-aab8-a193f5ed35b7' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'93e86ea6-62fc-4b74-b5be-e4a565c7a819' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'36010a1f-9d37-436e-b542-e9df3c81ef1d' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'5c34d8c4-9bc5-4923-8427-a43489448bf2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3648a557-cddf-446b-bfe9-2112b9a8847c' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'04782509-7aa5-446d-b63f-eac068c4c05a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'36dfa498-fae6-436b-afe6-ee5db4fb2abf' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'cef74b80-24a5-4d77-9ede-bbbc75cdb431' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'382bcc21-ad3c-4274-8253-2d5e8bf5fc54' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'b1d87254-b0ef-4a50-b427-ca0484e4516b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3b169381-3f97-4594-b56b-24ab962343e2' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'b57380bd-c0ec-4abf-9fe6-077c58065743' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3c8e45cc-e094-4fb6-aa52-23ca93af1cf0' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'f367dc71-5918-45fd-a4bf-84c0091f18e7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3d8af076-4dbe-4c54-92c6-39920e3dffd2' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'0b85d430-9ec6-4c93-97bb-d1b9fe2af289' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3dce00da-46e0-4eae-b3f6-c20a4cd772b5' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3e5dd72e-12f8-4709-be82-e1e69710facf' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'52567bff-6a9f-48fd-84af-0b6a3ad1a748' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4117b040-0a81-4742-8810-06e5cc932cfd' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'42c13dfb-84ab-4d14-b69e-e58f8e479a6c' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4363fbf9-3831-46e6-880f-6cca04b935e6' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'439bb8da-d305-4fba-bfbc-a4b796debcae' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'bf2ec92c-c23b-4376-a1c4-6336061f14ab' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'43acec32-e071-4334-857b-3a59b02245b2' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'1d9a0862-e924-432e-971f-3b4a4dfd8231' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4506d5db-244a-40f1-8a06-3eb08c60feb1' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'457f3bd8-c93b-4dcc-abac-ccb7aaaedf29' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'2e638140-f718-4879-afeb-2fac02bbce2e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4649c8d0-ed00-4c8b-9a94-fa6f10585618' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'eecb438d-bafd-4288-874a-3aabe6e8ed4e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'464f05c1-3f1a-4351-b87b-d8c692a245e5' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'6a1b0f48-a059-4e16-9e8a-ae67436f764d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'478c4cf1-86e4-4e7d-9e9a-d1ac4d98c0e0' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'9f0af966-630b-47cd-bb05-a4b3d9c5692d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4908e9b1-ac0a-43d6-bb60-00327f9d4314' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4a125a51-2402-4588-8633-7369c4bcfd6f' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'5d896550-fde2-47fe-bb72-95cd5d3a2edb' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4fa2b252-334f-40af-ac64-2ea166be3f50' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'50668882-156e-49dd-bc8e-1cc4b175ba5a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'd396873e-ec5b-4c44-919a-7d206cd0cc90' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5083d696-9921-4680-b348-0440c7bc8f5d' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5091ffa4-271d-46b5-b22f-fb8c418a4aed' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'516c9fd2-c29e-47cc-8629-3444f410192a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'df3bb11c-3907-49cf-a091-f9f77b63ed7d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'533f268e-e31d-4346-b0e2-86dd42df7be3' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'6fdb593b-e116-4e4b-b654-e8d3c544e325' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'53b29a66-11e2-42c7-b793-2a76208c5b59' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'fc08d048-2ff8-4948-b1b4-876c561bb8d7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'589743e3-f76b-47b7-8e3d-efecb2fa4ebd' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'90bae59c-0eea-49f4-a2be-401da670816e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5a61ec33-6ee0-4e56-9928-33fd5c277335' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'c546a78a-7f0d-4cd9-a9ed-96548acb8910' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5c048c5c-efaa-4a18-8667-e5d3bd1e3b77' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bc011009-243a-4ca4-a52a-1429c92d1867' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5c79d14e-712b-48cb-8476-68817c04d973' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5ceeee03-ce1a-4581-a124-071dde9b4ab6' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'f4170591-40d5-4dbf-accb-e789e9ad2e99' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5d0595a3-db81-44a9-9220-e3cd32a13702' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bd4cd2fe-5acb-4021-95eb-b1a193b940ff' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5d3d34a7-ebc1-4fda-8493-8c1ce5b3d5d7' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'312358c0-4285-426f-944a-e601490a011a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5ef25835-91c1-4385-9fb8-27797fc5079d' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5f499073-2f73-4963-8952-0dc4dd5bbb58' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'2896d021-562d-4bd4-8ffc-56161ad4c579' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6110bd3e-1e1d-471d-9f9e-c1f470d26f5e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'670f593e-6b83-4012-80c5-9828901ddbdb' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'62c18276-e7c1-455f-b2d3-290cecfa5680' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'810a72f0-55d3-468f-8653-10d1b06a4234' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'63f1aa6f-7928-4fae-ae96-af067e6b25b7' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'805d0b61-ba00-4b77-b367-a0d309694258' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'648ac21d-ca37-4c03-9c29-169e48554203' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'f4ca7d5c-63cf-471f-9226-d7ce5f298272' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'64eb8b1e-c329-4dce-a27f-d9e55aec2cb1' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'eb76dd47-c269-4f95-8585-cbd786d489f3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'64f82e4e-a43d-4e59-9363-e078ca04a9f8' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'1c9bee1f-d92b-4ebf-88fd-3abb65357304' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6571d80a-7f54-4a05-a323-2105f4bcc518' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'65901973-4931-4ac1-9a9a-29adf99a52e4' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'68148e1d-4cc0-4a7c-8805-dfe3cb3f634c' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'46e23f0c-b0fc-485e-9e19-e31e20d48500' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6834feb1-ad02-4182-a110-3a3b5fa19231' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6897a773-a79f-4154-9d9d-b0db6febca95' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'a3959557-b2ab-4fbc-8942-f72c52dfe972' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'68ce62ce-7773-4ca2-8792-b9423f2aa01f' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'9d884660-6013-40b8-b214-0fc6c1d222d7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'68f1a53a-7f8e-401d-a2dc-16373ad7a299' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6a50ffd9-1034-4550-9d6a-6a2496229408' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'1d69952a-ff84-4d13-be69-3c9b02068507' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6b83ec0b-45d4-4af2-aa64-596eac2c48a0' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'46e23f0c-b0fc-485e-9e19-e31e20d48500' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6c98f115-122f-4c7d-a5e1-e4e321a386df' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6cfd93b7-af88-4046-9f84-5300715b3d3c' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'805d0b61-ba00-4b77-b367-a0d309694258' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6d5e6c81-5f55-4f19-920d-1be548708856' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'e85a88f2-5c88-459a-8b5f-0a6245da926a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6fee64da-65bf-49c8-8d6a-2bc006bd51ba' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'f5e0b9d9-5b99-4649-809e-b326dc012f77' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'702ebe3f-71f3-4d83-9674-d1ce12867d18' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'2fe92677-f9fa-4cc4-bd9b-a96eaa0829d7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'7180db12-7952-49af-afc1-55b507500a47' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'7c200187-5793-430b-9eeb-eced97f9798b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'73917dbf-7b5c-4970-9bb5-6ef1da7ccc86' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'76a09293-89ff-4a21-9afb-b446caf1e4e7' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'edb10427-401c-4925-96cc-f7df89ad986d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'77be3039-9c87-4b9b-9b43-924866ee12f6' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'560608d3-2c82-48ad-b7b3-35aa2aec46a2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'783ee64c-2717-4096-850e-40cff68a1303' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'560608d3-2c82-48ad-b7b3-35aa2aec46a2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'7a066a3b-4eff-49e7-8777-1015114526e5' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'7cdb5f1c-1d24-44c8-a07a-c9154ee6155f' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'7f2e5258-3206-45d9-a20a-2e823b9ac91e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'd84d5f23-9220-4ad5-ac66-fef7e303e819' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'82d40025-d35d-4c6f-aec4-fc6c2667e781' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'da9e5953-154c-4435-beb7-de71b99753f4' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8394ad07-4d78-42b4-b8fe-730e6696edc7' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'cc3f8053-5ee5-4ece-85fe-7ff00e644745' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8449430c-7bbc-44e1-9eb7-b64ab530dcd8' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'874db91d-c58e-4b1b-8c4d-e020dc18d372' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'ed192e6f-9a49-402b-890b-c46da5468023' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'89121e9b-3681-4bf7-9587-d7d009fc70ca' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'7996cea4-5503-4807-87ba-d2da553c4341' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'89a646cb-fa74-4d0a-bd36-675314eada03' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'04782509-7aa5-446d-b63f-eac068c4c05a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8a6a0c3d-ef26-4870-8181-c091b92e6d30' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'4bee319b-42f3-41b6-a716-0fd42ef62642' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8ad9f4d8-d36b-499e-bc3b-73c211ba65cb' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'b863d076-37bb-45aa-8318-37942026921e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8b343d94-5e6e-42ad-997e-824e4a1a4852' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'ad7be971-979d-4e02-86ca-7f9d89c72770' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8cba10d5-a9ea-4c0d-b2c3-840995fc9436' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'02b48102-4e8a-44fb-84a0-7a8c8535676a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8d5f5a20-c0c6-40a6-9e4a-47c3470eb19d' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8dc7ed7b-b01f-4cb3-8224-9d22d7405fa4' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'7961fd3c-6f0e-496c-a656-772742e14d5a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8e682cd5-6bb7-4ad2-9833-1031bab5ad40' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'3a30471e-a0db-417f-a651-0b9fe35f2100' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8ecdfce9-e48d-4360-9305-607fbe3953ec' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'74a5586b-8ed6-4581-92d6-be1599147684' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8f6364b0-9a92-4fad-a6e4-31464c125cb5' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8fefc434-ffc6-4f68-adf2-e06e24266752' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'8c119aab-b70f-4219-bab2-ca0e3a25b79d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'930f5da0-4056-4043-992d-3a44d412a149' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'94c82869-541e-4d98-a9b8-eaf5fda55bf6' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'fc85f7df-b8d8-4e12-a2c1-00606d290a95' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'94d2a52f-552b-4529-9b2d-dd26f920332e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'bd959bfa-797c-48ff-b72b-241c84cd03a8' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'95617e29-ed95-4e85-83b7-10aad784be36' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'956cb9d5-c01a-4bbe-9ba9-c61d3ad47384' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'58ba9630-b6c1-4925-9916-4c5221291784' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'96a243de-72ac-4ab0-b23d-2d11b12b1f10' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'96e8a085-e5f2-401d-8dc5-47d4d51011c5' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'98387c05-def0-4dbb-bde9-9548226efe86' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'99fa16ab-618f-428b-9d6b-057fe7fe2fc6' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9a27663e-8e7f-4b52-82c8-5320718277b7' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9c6e946a-f660-4766-a44f-11aeedb5f6eb' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'5844fd85-bb2c-42b6-b4fa-85176209ecfc' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9ebce063-6e44-4e3c-a91c-351c94ba0ab5' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9f36c0eb-2b19-490c-a9ed-c0493b02655e' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'd1d3400d-0f5d-48d9-82ff-b836cfe85c74' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9ffcade7-f947-468b-8d06-faab788055a2' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'2fe92677-f9fa-4cc4-bd9b-a96eaa0829d7' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a0e9a097-8ee2-4c03-bd30-e37cfe112a0a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'a3959557-b2ab-4fbc-8942-f72c52dfe972' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a1bcfe0e-19a5-46b4-a2c7-7abd572eae8e' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'02b48102-4e8a-44fb-84a0-7a8c8535676a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a1d14136-ce79-4bab-9f3c-b2dee377efc0' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a23276a3-4453-4ab0-b10a-9ba8ff0c9705' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:43.503'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a413390b-ed04-4d8b-8c53-5aec741c6df5' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a4564a1d-328f-4491-90af-57ada5deba15' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'8884d6af-28ed-466d-9cb1-1a2d55dd12da' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a69530bc-a1d2-479d-94a3-bf4f8db59ce1' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'c191de03-6b68-4e9e-8c5e-ff17aeca341d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'adb0e2c3-80b3-4258-a228-182556c1d1f1' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'1bd00eb2-cdd1-48a0-95e4-298cb605cb14' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'addfd725-788b-481f-a8fd-0b57510e58b1' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b0d9eede-f098-41a9-bb67-01ec717ea453' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b1111287-928e-4efc-a85d-accdccc4eb93' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'cac72943-b5c7-4d70-8be8-a31f006563d5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b22a032f-1a83-4f34-8fad-de14d0889046' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b2444b0b-e2f9-4a1a-b2cb-678cd5f3aeb1' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'74a5586b-8ed6-4581-92d6-be1599147684' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b445ec93-f95a-48bf-8971-e78bd819fd03' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'cb8601a7-e15e-440a-aee3-5698aeec05c8' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b723c138-e762-41e1-beff-672789ce93e0' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'b57380bd-c0ec-4abf-9fe6-077c58065743' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b8f1ded8-bdcf-4332-a4a0-5b5e407f5d9a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'fc85f7df-b8d8-4e12-a2c1-00606d290a95' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ba565a92-9621-4c93-a414-7edb71c89609' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'bbd3ddf7-7395-45c9-b23c-f4605ebbaed9' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'bfee1d39-a199-4f42-bea5-201dedbc1700' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'cebbeb53-2470-450f-bdc3-f88d4700fb85' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'c32aa8b0-1dfa-4f8b-9445-dac3f708475a' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'b27eef9d-55f5-4109-b91a-c0d5d0b600cd' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'c89a02c6-adec-47a4-a938-2ed9f65b6162' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'365c5bf3-b266-4271-bde3-4d33b280abc1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cb0dd419-eed3-4ad0-acf1-4ef5ad06572a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cbccab24-f8d2-4e82-8475-6cf518669a45' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cc26a369-35b3-4beb-8f7f-c421ffd0f672' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'eb0c4d65-4757-4892-b2e9-35882704e592' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cc700284-8e57-44c5-8ba7-ee4ec6f0ce1d' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'8fcead5e-991a-4904-99ac-2c9d9269040b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cd4801fe-6dff-451f-8f47-aeb202a04582' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'9541e7b4-c80e-4a3c-8c5e-91ff5e315457' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cea7bff0-b9f0-47df-8e44-b278806304ee' ,
          N'18c84947-438c-4987-b556-1c132b1c8be3' ,
          N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-02-25 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cf56b01f-eabb-4e18-83a9-6359f50f2151' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'd24a1449-63f3-48ee-8b5d-cdf6be4910db' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'1794476e-90cd-45a1-952d-ee9dc05b95af' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'd2e194ec-8fc6-426b-9308-8cd636b96fa8' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'd36201a0-4abc-4f0e-94f3-b2d305023f48' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'bcb976ed-97ce-4d9c-b770-0a5ae3158a75' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'd86f0f6f-e796-4001-9269-ce1d511250a0' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'5844fd85-bb2c-42b6-b4fa-85176209ecfc' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'da00cfaa-b4a4-4156-b867-e2f45c35ffcd' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'cc91e8f6-b7ff-4c73-b934-302ad3398922' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'da6e4886-8dc4-4b19-909e-ffedbeeab9a1' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'dc072bc7-1d32-46d4-94d9-97647826a4c8' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'dd5c14ce-33da-4d6a-b2b4-b776092ec84f' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'dd9a5531-dd12-48eb-9856-3fec73fd3569' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'5e191896-d3ae-46b0-8327-963e3b797d55' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'df6e2fe4-f40c-4e4c-9bef-b2917bfbcac0' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'eecb438d-bafd-4288-874a-3aabe6e8ed4e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e0312bf1-e793-46b0-b09b-ca3b14f50c90' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'c191de03-6b68-4e9e-8c5e-ff17aeca341d' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e16727d7-c20c-4795-9d24-a2e4153e6194' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'cebbeb53-2470-450f-bdc3-f88d4700fb85' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e1ccc750-45be-4050-88ff-3b241015bc11' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'810a72f0-55d3-468f-8653-10d1b06a4234' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e1e25226-f2f3-41c3-a92c-487daf722661' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'e9f26747-9e66-461b-a869-05b1501a77d0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e34c7fae-2b8e-4401-a1ce-a21200de31a9' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'e12bd45d-5885-40e7-91be-a21e5885a432' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'e489b1a2-1ad6-4921-8c42-b1d014cb8c6f' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:15:47.970'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ea8fe030-fc96-408b-982e-b52dbb134f40' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'0180fc7a-70eb-433c-89db-20076b97dd13' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'eb1f8bc4-ffc0-457d-b2e7-d497e74ccbf4' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'b2310443-b05c-4872-8d20-308b6a2b6503' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ebea05fa-c478-47cc-a672-d68af6a6103c' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'fdd88267-878e-415f-989f-042f23408c50' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ec42addd-e381-4785-b8f5-158716c664b8' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ed27e8f7-8f91-4333-9db3-88fa95aba33a' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f02a9c95-4850-4843-8f01-d5e7e5412565' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'04782509-7aa5-446d-b63f-eac068c4c05a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f14612d5-fdbf-4fc6-8d84-de065c7dd011' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f377ee99-34a1-4aa7-bd1d-d899e933bb5b' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'6d62927c-4c77-4ef8-b3cf-a3ef2eceea81' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f3bd3b24-1ac9-4606-8247-a2114b205b49' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'758429ec-3ae9-4a9e-a994-efe7c5395b4a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f46b27ae-2c2e-4998-9093-272183856374' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f6b16fe7-891b-46e1-b7ce-4d9eff9cc461' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'cef74b80-24a5-4d77-9ede-bbbc75cdb431' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f8309680-1ad5-4dd1-b2f3-32727d78c3f7' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f852fb40-098c-46ba-823a-61de22feaff4' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'fb885b41-2550-44ee-a85d-39b2c89af743' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'fbd64154-b32c-45f7-9e87-17a19ece834f' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO
INSERT  INTO [RBAC].[RolePermission]
        ( [Id] ,
          [RoleId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'fd0422c0-04b2-4f1d-bdaf-51bce22032b6' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:23:08.640'
        );
GO
GO

CREATE TABLE [RBAC].[StaffOrganize]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserId] NVARCHAR(36) NULL ,
      [OrganizationId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', NULL, NULL)
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'人员组织机构信息', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'StaffOrganize';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'人员组织机构信息', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'StaffOrganize';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', 'COLUMN',
                                        N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', 'COLUMN',
                                        N'OrganizationId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'部门编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'OrganizationId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'部门编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'OrganizationId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'StaffOrganize',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'StaffOrganize', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'StaffOrganize', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of StaffOrganize
-- ----------------------------
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'049ecf89-bc4a-4331-be12-d181f8d9f0ed' ,
          N'23e714a9-33c6-49bb-be10-0fd455b5f0ad' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0a06e2b7-54f8-4cac-bdd1-cb2fc9944549' ,
          N'CD462EF4-EEA4-4436-A7B2-33F8B6CD5A8F' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-13 16:48:50.587'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'0ab74fbc-0f94-4534-b41c-2c7bf3354487' ,
          N'10476848-5b91-411a-a35e-c24a205e7365' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'168662b2-db77-464e-a1bc-c2fa4a69a700' ,
          N'4ef78175-afc9-48e4-9b85-13f1e9a86a79' ,
          N'90a12104-9bf7-4ce5-bc79-c14b73d32e62' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1816fe8f-a645-4c6e-a360-f5624dfbb47d' ,
          N'dfc0c474-6e63-4126-b966-f100bf900507' ,
          N'cedcf964-6515-4bd3-9f11-e32e81bb3f1b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1aac1c15-053f-4bc5-aabe-352611512555' ,
          N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          N'ec65f2dd-da94-4aee-b9fc-f992c641a7f5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2204e29f-db56-4cb9-9949-54e48914795f' ,
          N'de0502eb-06c2-4b3e-8e63-701bb671b84f' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-13 16:47:28.933'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'2aeb517e-4fa6-4ef9-8304-e9013215edb3' ,
          N'452865b1d31c' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 09:49:06.427'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'308d15b5-0beb-4464-af92-a9da47af480f' ,
          N'7510d804-cb83-41bb-94a7-1d35211d7814' ,
          N'00fdb9af-2f93-476a-8172-d987873f6697' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3e6e761f-6a4c-4cca-bf2d-dffaf3060750' ,
          N'dfc0c474-6e63-4126-b966-f100bf900507' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'3ec45a55-c859-4404-907b-cc556bb9b0f5' ,
          N'4de9a446-5fcf-41ec-983c-dc51870c4061' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-09-02 14:34:15.443'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'455d8491-b917-4794-9759-42f5a1cc34e0' ,
          N'75e1f7a2-74ab-4d21-af74-a601f30f02ee' ,
          N'7fd46efd-5b1b-48da-95d1-1992e347f532' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:16.270'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'459f0681-82d2-4850-a700-51159b0dcf51' ,
          N'10476848-5b91-411a-a35e-c24a205e7365' ,
          N'ec65f2dd-da94-4aee-b9fc-f992c641a7f5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'465c9c51-aefa-4bee-84ea-641bd7b6a138' ,
          N'4158bc01-004b-4677-8b86-0e3e4c483f6e' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4c4f8e5d-9b8c-414f-93f2-87abdf55f269' ,
          N'62a5723d-36d2-49b3-b161-df519671f8bf' ,
          N'00fdb9af-2f93-476a-8172-d987873f6697' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'5a148544-f3d8-48dc-b941-b684300b846a' ,
          N'304edebc-b49d-4162-b6d2-889defc8ab5c' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'6fa2605b-7ce4-4ebc-9773-c21b5a5c74c6' ,
          N'74f86691-537a-4c5c-a7e8-6f68bbe95788' ,
          N'00fdb9af-2f93-476a-8172-d987873f6697' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'746b1223-6834-4159-891a-fa62a085ea9f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'76a48b35-fb38-401e-a9bd-b4819fe41872' ,
          N'582db7b0-c473-4c08-8c68-539110ffe7cd' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-13 16:47:19.287'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'76fba0d5-83d5-4fed-ba3a-39a4cf3c47d8' ,
          N'7510d804-cb83-41bb-94a7-1d35211d7814' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'78a133a8-17a6-4b15-bb47-f0a7b727fa39' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'550b796b-a6ca-4b18-a0a0-d5812dbd32d8' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'811fcc92-28bf-4e6f-9f32-ec8b1a78f55a' ,
          N'23e714a9-33c6-49bb-be10-0fd455b5f0ad' ,
          N'ec65f2dd-da94-4aee-b9fc-f992c641a7f5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8481299d-94b6-48c2-89af-d099fd791d31' ,
          N'0ede986c-5a68-4e74-9198-3c1e5015e0d2' ,
          N'8b6ab119-6bf9-408b-902f-4fad259127e3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:44.567'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'97dd906f-8c81-4104-89cc-65f1cab22351' ,
          N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0' ,
          N'92dc218c-0f58-4aa2-9d05-ff5dffcb975f' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-14 14:08:28.367'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9ad9088e-12a5-40e6-80f5-eecf65692963' ,
          N'4ef78175-afc9-48e4-9b85-13f1e9a86a79' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ab049460-77bb-4822-a7bc-1b3b6a409fb6' ,
          N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-14 14:08:28.363'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'af037232-efc0-4844-9909-e94b03948a53' ,
          N'74f86691-537a-4c5c-a7e8-6f68bbe95788' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b03e0e19-1175-4d54-ac3a-b48fc46a3e26' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'ebcea0bb-232a-494b-996e-4eb5aa59d1af' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b0e2b82b-b234-491b-9cdc-bf5c92e7f8a1' ,
          N'094f85f8-bc53-4247-979c-09da591d51b0' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b854942b-5b5b-463a-8cd5-4e510df89ad6' ,
          N'43D9F7B0-5726-40C0-AAF6-D69CCF4AA2A8' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-13 16:48:31.970'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'd16ba68b-045b-4e10-9ea3-43b4a7b9ca60' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'00fdb9af-2f93-476a-8172-d987873f6697' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ddbe38af-3cd3-4115-a318-47d56f7d7c81' ,
          N'630ecf4b-24b8-4f93-8ca0-2e08f618dae1' ,
          N'ebcea0bb-232a-494b-996e-4eb5aa59d1af' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-16 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f619b738-3355-4af8-8bf1-704aa8ba3a62' ,
          N'62a5723d-36d2-49b3-b161-df519671f8bf' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[StaffOrganize]
        ( [Id] ,
          [UserId] ,
          [OrganizationId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'f9b0209e-4ad6-47e2-aed7-7f6afbb4f3d5' ,
          N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          N'05e85693-14b0-4582-8063-8fbde85371f0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO

CREATE TABLE [RBAC].[SystemMenu]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [ParentId] NVARCHAR(100) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [Title] NVARCHAR(100) NULL ,
      [Image] NVARCHAR(100) NULL ,
      [Category] INT NULL ,
      [NavigateUrl] NVARCHAR(400) NULL ,
      [Target] NVARCHAR(100) NULL ,
      [AllowEdit] INT NULL ,
      [AllowDelete] INT NULL ,
      [Sort] INT NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'ParentId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'父节点主键', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'SystemMenu',
        @level2type = 'COLUMN', @level2name = N'ParentId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父节点主键',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'ParentId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Title')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Title';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Title';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Image')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单图标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Image';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单图标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Image';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Category')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单分类',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Category';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单分类',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Category';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'NavigateUrl')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'导航地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'NavigateUrl';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'导航地址',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'NavigateUrl';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Target')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Target';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目标',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Target';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'AllowEdit')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'AllowDelete')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'SystemMenu',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'SystemMenu',
        @level2type = 'COLUMN', @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'SystemMenu', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'SystemMenu', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

-- ----------------------------
-- Records of SystemMenu
-- ----------------------------
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'02b48102-4e8a-44fb-84a0-7a8c8535676a' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'角色 -  详细信息页' ,
          N'角色 -  详细信息页' ,
          NULL ,
          N'2' ,
          N'/Admin/Role/ViewDetails' ,
          N'href' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-13 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:01:14.590'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'04782509-7aa5-446d-b63f-eac068c4c05a' ,
          N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'个人信息' ,
          N'个人信息' ,
          N'387.png' ,
          N'1' ,
          N'/Admin/User/CurrentUser' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0b85d430-9ec6-4c93-97bb-d1b9fe2af289' ,
          N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56' ,
          N'举报' ,
          N'举报' ,
          N'20130406014211289_easyicon_net_16.png' ,
          N'3' ,
          N'report()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c' ,
          N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-pencil' ,
          N'3' ,
          N'edit()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e' ,
          N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2' ,
          N'新增' ,
          N'新增' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'add' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 11:43:09.633' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'1bd00eb2-cdd1-48a0-95e4-298cb605cb14' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'分配权限' ,
          N'分配权限' ,
          N'chart_organisation_add.png' ,
          N'3' ,
          N'allotAuthority()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'Delete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 14:03:19.300' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'269bf251-0579-428d-811a-75be20089161' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-17 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'详细' ,
          N'详细' ,
          N'glyphicon glyphicon-list-alt' ,
          N'3' ,
          N'OnShowDetail' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'6' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:36:37.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2df2974e-f90a-4c4d-baf5-fcd16267d36b' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'新增' ,
          N'添加' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'OnCreate' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 13:46:38.433' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2e638140-f718-4879-afeb-2fac02bbce2e' ,
          N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'新增' ,
          N'添加' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'OnCreate' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:28:33.670' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'Delete()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:01.940' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2fe92677-f9fa-4cc4-bd9b-a96eaa0829d7' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'分配成员' ,
          N'分配成员' ,
          N'2012081511913.png' ,
          N'3' ,
          N'allotMember()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'35a27119-4fb7-4b4a-b5f9-9c89999614a8' ,
          N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-14 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'365c5bf3-b266-4271-bde3-4d33b280abc1' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'分配按钮' ,
          N'分配按钮' ,
          N'bricks.png' ,
          N'3' ,
          N'allotButton()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'菜单导航' ,
          N'菜单导航' ,
          N'sitemap.png' ,
          N'1' ,
          N'/Admin/SystemMenu/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'7' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-03-31 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-29 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'0' ,
          N'权限管理' ,
          N'权限管理' ,
          N'fa fa-key' ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'500' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-03-31 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-31 13:38:33.917'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'首页快捷方式' ,
          N'首页快捷方式' ,
          N'637.png' ,
          N'1' ,
          N'/Admin/HomeShortcut/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-29 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-29 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'菜单 - 编辑页' ,
          N'菜单 - 编辑页' ,
          NULL ,
          N'2' ,
          N'/Admin/SystemMenu/CreateOrEdit' ,
          N'Open' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:00:33.550'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'46e23f0c-b0fc-485e-9e19-e31e20d48500' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'分配权限' ,
          N'分配权限' ,
          N'chart_organisation_add.png' ,
          N'3' ,
          N'allotAuthority()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4b48e553-0caa-43a1-b969-8c1c2d157f08' ,
          N'0' ,
          N'项目管理' ,
          N'项目管理' ,
          N'glyphicon glyphicon-tasks' ,
          N'1' ,
          N'#' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:31:36.490' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:40:18.443'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19' ,
          N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-pencil' ,
          N'3' ,
          N'edit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 11:43:11.247' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'角色管理' ,
          N'角色管理' ,
          N'20130508035646751_easyicon_net_32.png' ,
          N'1' ,
          N'/Admin/Role/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-29 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'55807012-beb2-435e-a56c-3d0824f99591' ,
          N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-19 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'0' ,
          N'系统管理' ,
          N'系统管理' ,
          N'glyphicon glyphicon-cog' ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'400' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-18 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-31 13:38:27.693'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'560608d3-2c82-48ad-b7b3-35aa2aec46a2' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'5844fd85-bb2c-42b6-b4fa-85176209ecfc' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'字典管理' ,
          N'字典管理' ,
          N'4999_credit.png' ,
          N'1' ,
          N'/Admin/Dictionary/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-29 18:00:35.263'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'5c5077f0-7703-4fee-927a-b765e1edf900' ,
          N'5477b88b-3393-4d39-ba2d-f219f486bd38' ,
          N'系统个性化' ,
          N'系统个性化' ,
          N'581.png' ,
          N'1' ,
          N'/RMBase/SysPersonal/Individuation_Set.aspx' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'6' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'操作按钮' ,
          N'操作按钮' ,
          N'567.png' ,
          N'1' ,
          N'/Admin/Button/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'8' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-03-31 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-29 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'677da57b-e351-4831-bb90-2e11b354c1a2' ,
          N'd933de2b-5dd1-443c-bd5e-bbbbd7bfe47f' ,
          N'回收站 - 资源列表' ,
          N'回收站 - 资源列表' ,
          NULL ,
          N'2' ,
          N'/Admin/Recyclebin/Details' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-23 12:06:27.220'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'68427266-1bdd-42c0-bd60-094cba29bfaa' ,
          N'9606167a-fd94-4ad6-88b8-1b419dc3410e' ,
          N'新增' ,
          N'添加' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'OnCreate' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:22:33.757' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'用户组 -  分配权限页' ,
          N'用户组 -  分配权限页' ,
          NULL ,
          N'2' ,
          N'/Admin/UserGroup/AllotPermission' ,
          N'href' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:01:21.160'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35' ,
          N'角色管理' ,
          N'角色管理' ,
          NULL ,
          N'1' ,
          N'/WebApi/Role/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'20' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:34:54.430' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'6d62927c-4c77-4ef8-b3cf-a3ef2eceea81' ,
          N'677da57b-e351-4831-bb90-2e11b354c1a2' ,
          N'清空' ,
          N'清空' ,
          N'Empty.png' ,
          N'3' ,
          N'Empty()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'6dfa67e5-e897-49ea-ad74-a75fe7ac4cb3' ,
          N'cdac0cef-7a6d-4d9c-9212-0e7d08375bca' ,
          N'节点1' ,
          N'节点1' ,
          NULL ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'0' ,
          NULL ,
          N'2014-02-19 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'705df84f-f4ee-4a20-82d5-9e0f92bf989d' ,
          N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-19 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'74a5586b-8ed6-4581-92d6-be1599147684' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-pencil' ,
          N'3' ,
          N'edit()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:45:00.610' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'758429ec-3ae9-4a9e-a994-efe7c5395b4a' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'系统设置' ,
          N'系统设置' ,
          N'4968_config.png' ,
          N'1' ,
          N'/Admin/SystemSetting/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-29 18:00:44.500'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6' ,
          N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7961fd3c-6f0e-496c-a656-772742e14d5a' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'授权' ,
          N'授权' ,
          N'wrench_orange.png' ,
          N'3' ,
          N'accredit()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-17 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7c200187-5793-430b-9eeb-eced97f9798b' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'OnDelete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 13:46:40.787' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'新增' ,
          N'添加' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'OnCreate' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:35:05.210' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7dfdf495-83fe-4194-a042-35fe28c2e36b' ,
          N'0' ,
          N'动态页' ,
          N'动态页' ,
          N'fa fa-bolt' ,
          N'1' ,
          N'#' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'100' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-26 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-31 13:38:07.233'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'805d0b61-ba00-4b77-b367-a0d309694258' ,
          N'810a72f0-55d3-468f-8653-10d1b06a4234' ,
          N'保存' ,
          N'保存' ,
          N'disk.png' ,
          N'3' ,
          N'SaveForm()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-13 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'810a72f0-55d3-468f-8653-10d1b06a4234' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'角色 -  分配权限页' ,
          N'角色 -  分配权限页' ,
          NULL ,
          N'2' ,
          N'/Admin/Role/AllotPermission' ,
          N'href' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-12 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:01:06.667'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff' ,
          N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7' ,
          N'7dfdf495-83fe-4194-a042-35fe28c2e36b' ,
          N'数据管理' ,
          N'数据管理' ,
          N'glyphicon glyphicon-random' ,
          N'1' ,
          N'/DynamicPage/Configuration/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-31 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:18:41.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8884d6af-28ed-466d-9cb1-1a2d55dd12da' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'OnDelete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:35:08.147' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac' ,
          N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'刷新' ,
          N'刷新' ,
          N'glyphicon glyphicon-refresh' ,
          N'3' ,
          N'OnRefresh' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:28:38.483' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8d541792-ac65-437e-b874-817c44e2ea5e' ,
          N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-14 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5' ,
          N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc' ,
          N'返回' ,
          N'返回' ,
          N'glyphicon glyphicon-chevron-left' ,
          N'3' ,
          N'OnBack' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:29:47.457' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8f82b5f3-6185-4296-bef6-52eed4e29a94' ,
          N'/Admin/SystemMenu/AllotButton' ,
          N'查询' ,
          N'查询' ,
          N'zoom.png' ,
          N'3' ,
          N'search()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-14 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'8fcead5e-991a-4904-99ac-2c9d9269040b' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'用户管理' ,
          N'用户管理' ,
          N'userregedit.png' ,
          N'1' ,
          N'/Admin/User/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-29 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'90bae59c-0eea-49f4-a2be-401da670816e' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-pencil' ,
          N'3' ,
          N'edit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 14:03:17.710' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'9541e7b4-c80e-4a3c-8c5e-91ff5e315457' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'详细' ,
          N'查看详细' ,
          N'view.gif' ,
          N'3' ,
          N'detail()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'6' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'9606167a-fd94-4ad6-88b8-1b419dc3410e' ,
          N'7dfdf495-83fe-4194-a042-35fe28c2e36b' ,
          N'动态属性' ,
          N'动态属性' ,
          NULL ,
          N'1' ,
          N'/DynamicPage/ExtensionProperty/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:19:32.313' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:22:12.410'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7' ,
          N'9606167a-fd94-4ad6-88b8-1b419dc3410e' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'OnDelete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:22:37.453' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'9f0af966-630b-47cd-bb05-a4b3d9c5692d' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a1086dca-5677-4107-9a95-9a70259e927d' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'授权' ,
          N'授权' ,
          N'glyphicon glyphicon-thumbs-up' ,
          N'3' ,
          N'OnAccredit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 14:21:56.453' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a3959557-b2ab-4fbc-8942-f72c52dfe972' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-17 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'资源管理' ,
          N'资源管理' ,
          N'625.png' ,
          N'1' ,
          N'/Admin/Globalization/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-29 18:00:27.720'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'a63a0ca2-f2a7-4d27-bffa-67e548513df1' ,
          N'0' ,
          N'个人应用' ,
          N'个人应用' ,
          N'glyphicon glyphicon-user' ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'300' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-29 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-31 13:38:21.227'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'aacb438d-bafd-4288-874a-1sae6e8ed4e7' ,
          N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7' ,
          N'三级页面' ,
          N'三级菜单页面' ,
          N'576.png' ,
          N'1' ,
          N'/RMBase/SysDataCenter/DataCenter_Index.aspx' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'12' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-02 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'ad7be971-979d-4e02-86ca-7f9d89c72770' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e' ,
          N'9606167a-fd94-4ad6-88b8-1b419dc3410e' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-edit' ,
          N'3' ,
          N'OnEdit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-15 10:22:36.630' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b1d87254-b0ef-4a50-b427-ca0484e4516b' ,
          N'58e86c4c-8022-4d30-95d5-b3d0eedcc878' ,
          N'新增' ,
          N'新增' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'add' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 14:03:16.443' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'用户组管理' ,
          N'用户工作组' ,
          N'4957_customers.png' ,
          N'1' ,
          N'/Admin/UserGroup/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57' ,
          N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc' ,
          N'保存' ,
          N'保存' ,
          N'glyphicon glyphicon-floppy-save' ,
          N'3' ,
          N'OnSave' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:29:43.617' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'b57380bd-c0ec-4abf-9fe6-077c58065743' ,
          N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b' ,
          N'用户组 -  详细信息页' ,
          N'用户组 -  详细信息页' ,
          NULL ,
          N'2' ,
          N'/Admin/UserGroup/ViewDetails' ,
          N'href' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:01:27.447'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'8fcead5e-991a-4904-99ac-2c9d9269040b' ,
          N'用户 -  用户列表页' ,
          N'用户 -  用户列表页' ,
          NULL ,
          N'2' ,
          N'/Admin/User/Users' ,
          N'href' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-16 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:00:59.220'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bc011009-243a-4ca4-a52a-1429c92d1867' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-17 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35' ,
          N'路由规则' ,
          N'路由规则' ,
          NULL ,
          N'1' ,
          N'/WebApi/Route/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'30' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:28:06.567' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:30:59.983'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bd959bfa-797c-48ff-b72b-241c84cd03a8' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'菜单 - 新增页' ,
          N'菜单 - 新增页' ,
          N'153.png' ,
          N'2' ,
          N'/Admin/SystemMenu/CreateOrEdit' ,
          N'Open' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:00:25.193'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'bf2ec92c-c23b-4376-a1c4-6336061f14ab' ,
          N'677da57b-e351-4831-bb90-2e11b354c1a2' ,
          N'还原' ,
          N'还原' ,
          N'2013040601125064_easyicon_net_16.png' ,
          N'3' ,
          N'restore()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6' ,
          N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'新增' ,
          N'新增' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'add()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c191de03-6b68-4e9e-8c5e-ff17aeca341d' ,
          N'810a72f0-55d3-468f-8653-10d1b06a4234' ,
          N'返回' ,
          N'返回' ,
          N'back.png' ,
          N'3' ,
          N'back()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-13 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35' ,
          N'用户管理' ,
          N'用户管理' ,
          N'glyphicon glyphicon-user' ,
          N'1' ,
          N'/WebApi/User/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'10' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 13:45:51.693' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c43b3e15-7486-4202-91ff-798f011d5ae1' ,
          N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-19 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c546a78a-7f0d-4cd9-a9ed-96548acb8910' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'删除' ,
          N'删除' ,
          N'delete.png' ,
          N'3' ,
          N'Delete()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'分配权限' ,
          N'分配权限' ,
          NULL ,
          N'2' ,
          N'/WebApi/Role/AllotPermission' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:29:28.603' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cb8601a7-e15e-440a-aee3-5698aeec05c8' ,
          N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56' ,
          N'还原' ,
          N'还原' ,
          N'2013040601125064_easyicon_net_16.png' ,
          N'3' ,
          N'restore()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cc91e8f6-b7ff-4c73-b934-302ad3398922' ,
          N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9' ,
          N'锁定' ,
          N'锁定' ,
          N'lock.png' ,
          N'3' ,
          N'lock()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-17 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cdac0cef-7a6d-4d9c-9212-0e7d08375bca' ,
          N'0' ,
          N'新增测试' ,
          N'新增测试' ,
          NULL ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'6' ,
          N'0' ,
          NULL ,
          N'2014-02-19 00:00:00.000' ,
          NULL ,
          N'2014-02-19 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'cebbeb53-2470-450f-bdc3-f88d4700fb85' ,
          N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5' ,
          N'保存' ,
          N'保 存' ,
          N'disk.png' ,
          N'3' ,
          N'SaveForm()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd1d3400d-0f5d-48d9-82ff-b836cfe85c74' ,
          N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5' ,
          N'返回' ,
          N'返回' ,
          N'back.png' ,
          N'3' ,
          N'back()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd396873e-ec5b-4c44-919a-7d206cd0cc90' ,
          N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228' ,
          N'8fcead5e-991a-4904-99ac-2c9d9269040b' ,
          N'用户 -  所属部门页' ,
          N'用户 -  所属部门页' ,
          NULL ,
          N'2' ,
          N'/Admin/User/Departments' ,
          N'href' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-16 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:00:50.513'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd84d5f23-9220-4ad5-ac66-fef7e303e819' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'd933de2b-5dd1-443c-bd5e-bbbbd7bfe47f' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'回收站管理' ,
          N'回收站管理' ,
          N'379.png' ,
          N'1' ,
          N'/Admin/Recyclebin/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'10' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-07-16 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'da9e5953-154c-4435-beb7-de71b99753f4' ,
          N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'Delete()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'df3bb11c-3907-49cf-a091-f9f77b63ed7d' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-edit' ,
          N'3' ,
          N'OnEdit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:35:06.770' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'e620450b-6d17-4192-bee0-66fbd114e82a' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'部门管理' ,
          N'部门管理' ,
          N'20130508035912738_easyicon_net_32.png' ,
          N'1' ,
          N'/Admin/Organization/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'6' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-14 11:17:02.953'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'e9f26747-9e66-461b-a869-05b1501a77d0' ,
          N'545d2450-4dac-4377-afbe-d9aa451f795f' ,
          N'详细' ,
          N'详细' ,
          N'view.gif' ,
          N'3' ,
          N'detail()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35' ,
          N'0' ,
          N'WebApi' ,
          N'WebApi' ,
          N'glyphicon glyphicon-cloud' ,
          N'1' ,
          NULL ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'50' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 13:45:01.633' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:39:24.450'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'eb76dd47-c269-4f95-8585-cbd786d489f3' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'锁定' ,
          N'锁定' ,
          N'glyphicon glyphicon-lock' ,
          N'3' ,
          N'OnLock' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 14:22:06.170' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'eb78e358-a188-4a4a-911f-a2050a312386' ,
          N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd' ,
          N'编辑' ,
          N'编辑' ,
          N'edit.png' ,
          N'3' ,
          N'edit()' ,
          N'Onclick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-14 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'ed192e6f-9a49-402b-890b-c46da5468023' ,
          N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'Delete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-03-12 11:43:12.433' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'edb10427-401c-4925-96cc-f7df89ad986d' ,
          N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-edit' ,
          N'3' ,
          N'OnEdit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:28:34.143' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6' ,
          N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1' ,
          N'日志管理' ,
          N'日志管理' ,
          N'4937_administrative-docs.png' ,
          N'1' ,
          N'/Admin/Logger/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-18 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-29 18:00:20.877'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'eecb438d-bafd-4288-874a-1sae6e8ed4e7' ,
          N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7' ,
          N'四级页面' ,
          N'五级菜单设置' ,
          N'576.png' ,
          N'1' ,
          N'/RMBase/SysDataCenter/DataCenter_Index.aspx' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'12' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-02 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7' ,
          N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7' ,
          N'四级菜单设置' ,
          N'四级菜单设置' ,
          N'576.png' ,
          N'1' ,
          N'/RMBase/SysDataCenter/DataCenter_Index.aspx' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'12' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-02 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7' ,
          N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7' ,
          N'三级菜单设置' ,
          N'三级菜单设置' ,
          N'576.png' ,
          N'1' ,
          N'/RMBase/SysDataCenter/DataCenter_Index.aspx' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'12' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-02 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'菜单 - 分配按钮页' ,
          N'菜单 - 分配按钮页' ,
          NULL ,
          N'2' ,
          N'/Admin/SystemMenu/AllotButton' ,
          N'Open' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-30 11:00:40.797'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'f367dc71-5918-45fd-a4bf-84c0091f18e7' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'分配权限' ,
          N'分配权限' ,
          N'glyphicon glyphicon-tower' ,
          N'3' ,
          N'OnAllotAuthority' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'5' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:36:07.830' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'f4ca7d5c-63cf-471f-9226-d7ce5f298272' ,
          N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92' ,
          N'删除' ,
          N'删除' ,
          N'glyphicon glyphicon-remove' ,
          N'3' ,
          N'OnDelete' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'3' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-01-13 09:28:35.240' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'f52158fa-1672-4a69-bd64-03e8bb88f6ab' ,
          N'4b48e553-0caa-43a1-b969-8c1c2d157f08' ,
          N'我的项目' ,
          N'我的项目' ,
          N'glyphicon glyphicon-object-align-left' ,
          N'1' ,
          N'/PM/Project/Index' ,
          N'Iframe' ,
          NULL ,
          NULL ,
          N'1' ,
          N'0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-31 13:39:30.630' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 09:50:19.720'
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'f5e0b9d9-5b99-4649-809e-b326dc012f77' ,
          N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67' ,
          N'分配成员' ,
          N'分配成员' ,
          N'fa fa-group' ,
          N'3' ,
          N'OnAllotMember' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'4' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 15:35:55.767' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2' ,
          N'c2947a69-fc79-4861-92ea-87361d8b5715' ,
          N'编辑' ,
          N'编辑' ,
          N'glyphicon glyphicon-edit' ,
          N'3' ,
          N'OnEdit' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'2' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-03 13:46:39.597' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'fc08d048-2ff8-4948-b1b4-876c561bb8d7' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'新增' ,
          N'新增' ,
          N'add.png' ,
          N'3' ,
          N'add()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          N'1' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO
INSERT  INTO [RBAC].[SystemMenu]
        ( [Id] ,
          [ParentId] ,
          [Name] ,
          [Title] ,
          [Image] ,
          [Category] ,
          [NavigateUrl] ,
          [Target] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'fc85f7df-b8d8-4e12-a2c1-00606d290a95' ,
          N'40178207-f2f2-44de-95bc-b5b4beb69e49' ,
          N'新增' ,
          N'新增' ,
          N'glyphicon glyphicon-plus' ,
          N'3' ,
          N'add()' ,
          N'OnClick' ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-24 00:00:00.000' ,
          NULL ,
          NULL
        );
GO
GO

CREATE TABLE [RBAC].[User]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [Reporter] NVARCHAR(36) NULL ,
      [Code] NVARCHAR(100) NULL ,
      [Account] NVARCHAR(100) NULL ,
      [Password] NVARCHAR(100) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [Sex] INT NULL ,
      [Title] NVARCHAR(100) NULL ,
      [Email] NVARCHAR(400) NULL ,
      [Theme] NVARCHAR(100) NULL ,
      [Question] NVARCHAR(100) NULL ,
      [Answer] NVARCHAR(100) NULL ,
      [Remark] NVARCHAR(500) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'Reporter')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'汇报者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Reporter';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'汇报者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Reporter';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Code')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Code';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Code';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Account')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录账号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Account';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录账号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Account';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'Password')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录密码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Password';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录密码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Password';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Sex')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'性别(0：女、1：男)', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Sex';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'性别(0：女、1：男)', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Sex';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Title')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'职称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Title';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'职称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Title';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Email')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电子邮件',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Email';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电子邮件',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Email';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Theme')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Theme';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Theme';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'Question')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'找回密码的问题', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Question';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'找回密码的问题',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Question';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Answer')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'找回密码的答案', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'Answer';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'找回密码的答案',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Answer';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN', @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN', N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：启用、2：停用)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'User',
        @level2type = 'COLUMN', @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：启用、2：停用)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE', @level1name = N'User',
        @level2type = 'COLUMN', @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'User', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'User', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'094f85f8-bc53-4247-979c-09da591d51b0' ,
          NULL ,
          N'000002' ,
          N'minmin' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'敏敏' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'0ede986c-5a68-4e74-9198-3c1e5015e0d2' ,
          NULL ,
          N'100023' ,
          N'test' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'测试员' ,
          N'1' ,
          N'软件工程师' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:44.547'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'10476848-5b91-411a-a35e-c24a205e7365' ,
          NULL ,
          N'000003' ,
          N'hz' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'华仔' ,
          N'1' ,
          N'软件测试工程师' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'23e714a9-33c6-49bb-be10-0fd455b5f0ad' ,
          NULL ,
          N'000004' ,
          N'wxy' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'王秀英' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          NULL ,
          N'000005' ,
          N'lxy' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'李秀英' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-28 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'304edebc-b49d-4162-b6d2-889defc8ab5c' ,
          NULL ,
          N'120023' ,
          N'sa' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'小佘' ,
          N'0' ,
          N'a' ,
          N'shex@koteiinfo.com' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-09 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4158bc01-004b-4677-8b86-0e3e4c483f6e' ,
          NULL ,
          N'000006' ,
          N'ln' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'李娜' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'452865b1d31c' ,
          NULL ,
          N'000001' ,
          N'xiaoma' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'小马' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'asdfasf' ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2000-01-04 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 09:49:06.410'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          NULL ,
          N'000000' ,
          N'system' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'管理员' ,
          N'1' ,
          N'软件工程师' ,
          N'fenglinz@koteiinfo.com' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'000007' ,
          N'lw' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'刘伟' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-06-14 14:08:28.317'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4de9a446-5fcf-41ec-983c-dc51870c4061' ,
          NULL ,
          N'120023' ,
          N'wangx' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'王老师' ,
          N'1' ,
          N'助教' ,
          N'wangx@163.com' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-08 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-09-02 14:34:15.427'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'4ef78175-afc9-48e4-9b85-13f1e9a86a79' ,
          NULL ,
          N'000008' ,
          N'zm' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'张敏' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'62a5723d-36d2-49b3-b161-df519671f8bf' ,
          NULL ,
          N'000010' ,
          N'xy' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'小鱼' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'74f86691-537a-4c5c-a7e8-6f68bbe95788' ,
          NULL ,
          N'000011' ,
          N'xe' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'雪儿' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'7510d804-cb83-41bb-94a7-1d35211d7814' ,
          NULL ,
          N'000012' ,
          N'xe' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'瓶子' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'75e1f7a2-74ab-4d21-af74-a601f30f02ee' ,
          NULL ,
          N'000013' ,
          N'wf' ,
          N'0EAlVCBMJDOcVR3De5x49A==' ,
          N'王芳' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:15.933'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'de0502eb-06c2-4b3e-8e63-701bb671b84f' ,
          NULL ,
          N'000014' ,
          N'daqiang' ,
          N'EVY548nh1mtPLIHYoFfXQEL8OIs=' ,
          N'大强' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-16 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-01-13 16:47:28.913'
        );
GO
GO
INSERT  INTO [RBAC].[User]
        ( [Id] ,
          [Reporter] ,
          [Code] ,
          [Account] ,
          [Password] ,
          [Name] ,
          [Sex] ,
          [Title] ,
          [Email] ,
          [Theme] ,
          [Question] ,
          [Answer] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'dfc0c474-6e63-4126-b966-f100bf900507' ,
          NULL ,
          N'000009' ,
          N'xq' ,
          N'EVY548nh1mtPLIHYoFfXQEL8OIs=' ,
          N'小强' ,
          N'1' ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-02 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-05-01 00:00:00.000'
        );
GO
GO

CREATE TABLE [RBAC].[UserGroup]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [ParentId] NVARCHAR(36) NULL ,
      [Code] NVARCHAR(100) NULL ,
      [Name] NVARCHAR(100) NULL ,
      [AllowEdit] INT NULL ,
      [AllowDelete] INT NULL ,
      [Sort] INT NULL ,
      [Remark] NVARCHAR(500) NULL ,
      [Status] INT NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL ,
      [ModifyUserId] NVARCHAR(36) NULL ,
      [ModifyDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'ParentId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'父用户组编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroup',
        @level2type = 'COLUMN', @level2name = N'ParentId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父用户组编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'ParentId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'Code')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'用户组编码', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroup',
        @level2type = 'COLUMN', @level2name = N'Code';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户组编码',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Code';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'Name')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'用户组名称', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroup',
        @level2type = 'COLUMN', @level2name = N'Name';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户组名称',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Name';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'AllowEdit')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许编辑',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'AllowEdit';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'AllowDelete')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'允许删除',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'AllowDelete';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'Sort')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Sort';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Sort';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'Remark')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Remark';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Remark';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'Status')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Status';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description',
        @value = N'状态(0：删除、1：有效)', @level0type = 'SCHEMA',
        @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'Status';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroup',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'ModifyUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'修改者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroup',
        @level2type = 'COLUMN', @level2name = N'ModifyUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'ModifyUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroup', 'COLUMN',
                                        N'ModifyDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroup', @level2type = 'COLUMN',
        @level2name = N'ModifyDateTime';
GO

-- ----------------------------
-- Records of UserGroup
-- ----------------------------
INSERT  INTO [RBAC].[UserGroup]
        ( [Id] ,
          [ParentId] ,
          [Code] ,
          [Name] ,
          [AllowEdit] ,
          [AllowDelete] ,
          [Sort] ,
          [Remark] ,
          [Status] ,
          [CreateUserId] ,
          [CreateDateTime] ,
          [ModifyUserId] ,
          [ModifyDateTime]
        )
VALUES  ( N'901659a9-e671-4b2f-b7fa-0d77144fb4c3' ,
          N'0' ,
          N'1000001' ,
          N'管理员组' ,
          NULL ,
          NULL ,
          N'1' ,
          NULL ,
          N'1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2013-04-21 00:00:00.000' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-07-30 14:09:20.593'
        );
GO
GO

CREATE TABLE [RBAC].[UserGroupPermission]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserGroupId] NVARCHAR(36) NULL ,
      [SystemMenuId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupPermission',
                                        'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupPermission',
                                        'COLUMN', N'UserGroupId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'用户组编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroupPermission',
        @level2type = 'COLUMN', @level2name = N'UserGroupId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户组编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'UserGroupId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupPermission',
                                        'COLUMN', N'SystemMenuId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupPermission',
                                        'COLUMN', N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroupPermission',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupPermission',
                                        'COLUMN', N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupPermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of UserGroupPermission
-- ----------------------------
INSERT  INTO [RBAC].[UserGroupPermission]
        ( [Id] ,
          [UserGroupId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'482311bc-3263-4f58-95d0-6a57ca0591e8' ,
          N'2c5d2b38-2300-411d-979f-b65eb25846aa' ,
          N'758429ec-3ae9-4a9e-a994-efe7c5395b4a' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-04-16 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[UserGroupPermission]
        ( [Id] ,
          [UserGroupId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'9d804f5b-72de-46a8-bdb5-0a612d470588' ,
          N'901659a9-e671-4b2f-b7fa-0d77144fb4c3' ,
          N'' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-07-02 10:57:05.743'
        );
GO
GO

CREATE TABLE [RBAC].[UserGroupRelation]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserId] NVARCHAR(36) NULL ,
      [UserGroupId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupRelation',
                                        'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupRelation',
                                        'COLUMN', N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupRelation',
                                        'COLUMN', N'UserGroupId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'用户组编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroupRelation',
        @level2type = 'COLUMN', @level2name = N'UserGroupId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户组编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'UserGroupId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupRelation',
                                        'COLUMN', N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserGroupRelation',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserGroupRelation',
                                        'COLUMN', N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserGroupRelation', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of UserGroupRelation
-- ----------------------------
INSERT  INTO [RBAC].[UserGroupRelation]
        ( [Id] ,
          [UserId] ,
          [UserGroupId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'b98f6022-f5ae-4a2d-baf3-ae6aafcb9d46' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'39764083-a0bd-4cd6-8ead-3ea689831ed3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[UserGroupRelation]
        ( [Id] ,
          [UserId] ,
          [UserGroupId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'bd616fe0-a304-43bc-993c-68c9d31d0aef' ,
          N'4ef78175-afc9-48e4-9b85-13f1e9a86a79' ,
          N'39764083-a0bd-4cd6-8ead-3ea689831ed3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[UserGroupRelation]
        ( [Id] ,
          [UserId] ,
          [UserGroupId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'cc3dd042-ffe3-40e8-9304-f95ead2b11dc' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'901659a9-e671-4b2f-b7fa-0d77144fb4c3' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-06 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[UserGroupRelation]
        ( [Id] ,
          [UserId] ,
          [UserGroupId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'fb1251f6-2e08-4d52-8dc8-ddeb87b13e4e' ,
          N'304edebc-b49d-4162-b6d2-889defc8ab5c' ,
          N'c689d007-11b0-4e58-9e8a-bf44b98372b5' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-07 00:00:00.000'
        );
GO
GO

CREATE TABLE [RBAC].[UserPermission]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserId] NVARCHAR(36) NULL ,
      [SystemMenuId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserPermission', 'COLUMN',
                                        N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserPermission', 'COLUMN',
                                        N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserPermission', 'COLUMN',
                                        N'SystemMenuId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'菜单编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'SystemMenuId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserPermission', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserPermission',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserPermission', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserPermission', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of UserPermission
-- ----------------------------
INSERT  INTO [RBAC].[UserPermission]
        ( [Id] ,
          [UserId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'4cc8d070-ba8f-4e2b-a75a-c91fcfd80428' ,
          N'0ede986c-5a68-4e74-9198-3c1e5015e0d2' ,
          N'3885ba7f-c246-493f-9053-7aa70a642662' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:44.577'
        );
GO
GO
INSERT  INTO [RBAC].[UserPermission]
        ( [Id] ,
          [UserId] ,
          [SystemMenuId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'a5da8957-b8c5-492d-ac8a-94797fa2aa7a' ,
          N'0ede986c-5a68-4e74-9198-3c1e5015e0d2' ,
          N'3e544d7a-d850-4785-9648-feafc4698a3b' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-12-25 09:48:44.577'
        );
GO
GO

CREATE TABLE [RBAC].[UserRole]
    (
      [Id] NVARCHAR(36) NOT NULL ,
      [UserId] NVARCHAR(36) NULL ,
      [RoleId] NVARCHAR(36) NULL ,
      [CreateUserId] NVARCHAR(36) NULL ,
      [CreateDateTime] DATETIME NULL
    );


GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserRole', 'COLUMN', N'Id')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN', @level2name = N'Id';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN', @level2name = N'Id';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserRole', 'COLUMN',
                                        N'UserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'UserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'UserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserRole', 'COLUMN',
                                        N'RoleId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'RoleId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'RoleId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserRole', 'COLUMN',
                                        N'CreateUserId')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description',
        @value = N'创建者编号', @level0type = 'SCHEMA', @level0name = N'RBAC',
        @level1type = 'TABLE', @level1name = N'UserRole',
        @level2type = 'COLUMN', @level2name = N'CreateUserId';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建者编号',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'CreateUserId';
GO
IF ( ( SELECT   COUNT(*)
       FROM     fn_listextendedproperty('MS_Description', 'SCHEMA', N'RBAC',
                                        'TABLE', N'UserRole', 'COLUMN',
                                        N'CreateDateTime')
     ) > 0 )
    EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
ELSE
    EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间',
        @level0type = 'SCHEMA', @level0name = N'RBAC', @level1type = 'TABLE',
        @level1name = N'UserRole', @level2type = 'COLUMN',
        @level2name = N'CreateDateTime';
GO

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT  INTO [RBAC].[UserRole]
        ( [Id] ,
          [UserId] ,
          [RoleId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'1d621f34-6553-4835-b666-90197dea85eb' ,
          N'75e1f7a2-74ab-4d21-af74-a601f30f02ee' ,
          N'6cc9a788-639a-4c16-940f-da7ee9c9faa6' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2015-08-04 09:44:17.460'
        );
GO
GO
INSERT  INTO [RBAC].[UserRole]
        ( [Id] ,
          [UserId] ,
          [RoleId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'63ad9af7-8eac-401b-809e-47e25baf21b5' ,
          N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000'
        );
GO
GO
INSERT  INTO [RBAC].[UserRole]
        ( [Id] ,
          [UserId] ,
          [RoleId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'69baef5b-2174-4a8e-88c4-5b0b9f5655a6' ,
          N'452865b1d31c' ,
          N'648aab5c-c4a7-4548-b513-d33baa281882' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2016-03-07 13:39:00.430'
        );
GO
GO
INSERT  INTO [RBAC].[UserRole]
        ( [Id] ,
          [UserId] ,
          [RoleId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'8ea2b145-7aef-4eb4-b1d7-2e010889e360' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'd0533453-9cf8-459c-b28c-98cf397efaf1' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-08-22 15:52:13.810'
        );
GO
GO
INSERT  INTO [RBAC].[UserRole]
        ( [Id] ,
          [UserId] ,
          [RoleId] ,
          [CreateUserId] ,
          [CreateDateTime]
        )
VALUES  ( N'ad8005ba-b133-44b8-a525-6d2c51d76538' ,
          N'2b84d4f8-c1dd-4d35-8729-875a44852019' ,
          N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0' ,
          N'48f3889c-af8d-401f-ada2-c383031af92d' ,
          N'2014-05-04 00:00:00.000'
        );
GO
GO

ALTER TABLE [RBAC].[Button] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[HomeShortcut] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[Organization] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[Recyclebin] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[Role] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[RolePermission] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[StaffOrganize] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[SystemMenu] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[User] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserGroup] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserGroupPermission] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserGroupRelation] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserPermission] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserRole] ADD PRIMARY KEY ([Id]);
GO