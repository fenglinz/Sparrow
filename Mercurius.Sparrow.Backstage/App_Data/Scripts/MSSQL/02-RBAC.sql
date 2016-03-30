CREATE TABLE [RBAC].[Button]
(
  [Id] NVARCHAR(36) NOT NULL,
  [Name] NVARCHAR(100) NULL,
  [Title] NVARCHAR(100) NULL,
  [Image] NVARCHAR(100) NULL,
  [Code] NVARCHAR(400) NULL,
  [Sort] INT NULL,
  [Category] NVARCHAR(100) NULL,
  [Remark] NVARCHAR(500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮名称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮标题',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Title';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮图标',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Image';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮代码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Code';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'排序号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Sort';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'按钮分类',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Category';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'备注',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Remark';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(0：删除、1：有效)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Button',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'020e2c2a-e203-4694-85ef-c73bd301ad72', N'备份', N'备份', N'glyphicon glyphicon-download-alt', N'OnBackup', N'32', N'工具栏', N'数据库备份', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:56:09.410' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'067b2de9-037f-4bb9-8a41-285eb3fc7267', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'OnEdit', N'2', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-28 00:01:55.903' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'0e8c3c59-586a-48a0-a1ef-5a83f4a2d6fd', N'恢复', N'恢复', N'glyphicon glyphicon-open', N'OnRecover', N'33', N'工具栏', N'还原恢复数据库', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:56:19.470' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', N'导入', N'导入', N'glyphicon glyphicon-import', N'OnImport', N'5', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:41.430' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'1b88ce60-6438-4bb9-891d-c0bf4832e2d5', N'设置', N'设置', N'glyphicon glyphicon-cog', N'OnSetting', N'7', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:01.670' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2e5d2d97-1367-4036-8040-cfcd261e9e5f', N'锁定', N'锁定', N'glyphicon glyphicon-lock', N'OnLock', N'22', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:12.960' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2f1a1ba6-276e-4e7f-a219-ecfdb50e63fb', N'发布', N'发布', N'glyphicon glyphicon-globe', N'OnPublish', N'18', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:36.663' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'3194373e-1b97-4c92-9cd2-4778b00c3b13', N'清空', N'清空', N'glyphicon glyphicon-trash', N'OnClear', N'26', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:07.433' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'42cef74b-2c60-4d62-93b8-d0f6d16ca3b0', N'上传', N'上传', N'glyphicon glyphicon-cloud-upload', N'OnUpload', N'9', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:21.980' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'43334b34-f78e-4187-ad2f-1600bb932896', N'复制', N'复制', N'fa fa-copy', N'OnCopy', N'11', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:40.533' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'43334b34-f78e-4187-ad2f-1610bb912896', N'打印', N'打印', N'glyphicon glyphicon-print', N'OnPrint', N'13', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:00.973' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'43334b34-f78e-4187-ad2f-1610bb932896', N'还原', N'还原', N'fa fa-mail-reply', N'OnRestore', N'12', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:48.883' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'58d19434-705a-4199-acdc-b6d0322501bf', N'下载', N'下载', N'glyphicon glyphicon-cloud-download', N'OnDownload', N'10', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:31.510' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'73f60b12-fc1f-4927-9803-616fef6ed1b7', N'授权', N'授权', N'glyphicon glyphicon-thumbs-up', N'OnAccredit', N'23', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:24.513' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'79a3ec54-3c07-4204-bfc6-5b1f111474b3', N'刷新', N'刷新', N'glyphicon glyphicon-refresh', N'OnRefresh', N'21', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:51:58.763' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'79a3ec54-3c07-4204-bfc6-5b7f111474b3', N'浏览', N'浏览', N'fa fa-unlink', N'OnBrowse', N'20', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:51:02.440' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7e33c9ec-7573-450b-aa4f-c52771ebdd3c', N'升级', N'升级', N'fa fa-upload', N'OnUpgrade', N'17', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:20.667' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7f6e3c60-4ac5-4c59-a15d-40832b353423', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'OnSave', N'27', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:18.890' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a08fee4b-98c1-4974-be4a-5dbcc0820cbd', N'新增', N'添加', N'glyphicon glyphicon-plus', N'OnCreate', N'1', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-05 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:13:19.600' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a7400cab-6e80-47cd-9cca-e3de79cba1c3', N'分配成员', N'分配成员', N'fa fa-group', N'OnAllotMember', N'31', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:55:57.463' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a7e78077-5c3a-4705-8c58-4c4e696ee201', N'取消', N'取消', N'glyphicon glyphicon-floppy-remove', N'OnCancel', N'28', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:49.403' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'b0482c2d-b466-4d05-beb2-45b2bd7981c4', N'帮助', N'帮助', N'glyphicon glyphicon-question-sign', N'OnHelp', N'19', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:49.657' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'bc43a78e-2952-4a61-ab1d-e57c2bfa3953', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'OnShowDetail', N'29', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-09 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:54:06.897' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c44ae1e3-8c46-474f-a2a3-517bdf39d68d', N'分配权限', N'分配权限', N'glyphicon glyphicon-tower', N'OnAllotAuthority', N'25', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:54.340' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c9df5a92-ed50-4a8d-9f5c-765b5c15e3bc', N'发送', N'发送', N'glyphicon glyphicon-send', N'OnSend', N'14', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:09.807' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'cd2e937e-7f3a-4823-958b-2acab4711f08', N'举报', N'举报', N'glyphicon glyphicon-phone-alt', N'OnReport', N'16', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:30.160' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'cfa9fe4b-a30c-43fe-b73d-df02516c2e07', N'分配按钮', N'分配按钮', N'fa fa-cogs', N'OnAllotButtons', N'24', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:41.293' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd10be9f7-2382-4336-90ed-60193eb80382', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'OnBack', N'15', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:18.143' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd6cdbfd6-017b-4639-8c2d-6fb63174b0a5', N'删除', N'删除', N'glyphicon glyphicon-remove', N'OnDelete', N'3', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 16:03:28.180' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd8680d5e-0c3a-41f0-a1d1-dd5152b3014c', N'审核', N'审核', N'glyphicon glyphicon-check', N'OnAudit', N'8', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:13.640' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', N'查询', N'查询', N'glyphicon glyphicon-search', N'OnSearch', N'4', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:31.137' );
GO
INSERT INTO [RBAC].[Button] ( [Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'e7f33901-604c-4a51-b122-e6529066983c', N'导出', N'导出', N'glyphicon glyphicon-export', N'OnExport', N'6', N'工具栏', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:50.197' );
GO
CREATE TABLE [RBAC].[HomeShortcut]
(
  [Id] NVARCHAR(36) NOT NULL,
  [UserId] NVARCHAR(36) NULL,
  [Name] NVARCHAR(100) NULL,
  [NavigateUrl] NVARCHAR(400) NULL,
  [Target] NVARCHAR(100) NULL,
  [Image] NVARCHAR(100) NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR(500) NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'首页快捷方式',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'UserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'快捷方式名称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'导航地址',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'NavigateUrl';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'目标',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Target';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'快捷方式图标',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Image';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'排序号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Sort';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'备注',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'HomeShortcut',
    @level2type='COLUMN',
    @level2name=N'Remark';
GO
INSERT INTO [RBAC].[HomeShortcut] ( [Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark] )
    VALUES ( N'40abb9d3-219a-4469-9ce5-40c4eb088b0a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'个人信息', N'/Admin/User/CurrentUser', N'Iframe', N'glyphicon glyphicon-user', N'2', NULL );
GO
INSERT INTO [RBAC].[HomeShortcut] ( [Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark] )
    VALUES ( N'970a4af6-ce3e-4424-8e7a-a3184b4e85a5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'数据统计', N'#', N'Iframe', N'fa fa-bar-chart', N'5', NULL );
GO
INSERT INTO [RBAC].[HomeShortcut] ( [Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark] )
    VALUES ( N'd3973803-c2bd-4e16-be0d-cd26673ba0dd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'菜单管理', N'/Admin/SystemMenu/Index', N'Iframe', N'fa fa-sitemap', N'1', N'菜单管理页' );
GO
CREATE TABLE [RBAC].[Organization]
(
  [Id] NVARCHAR(36) NOT NULL,
  [ParentId] NVARCHAR(36) NULL,
  [Code] NVARCHAR(100) NULL,
  [Name] NVARCHAR(100) NULL,
  [InnerPhone] NVARCHAR(100) NULL,
  [OuterPhone] NVARCHAR(100) NULL,
  [Manager] NVARCHAR(36) NULL,
  [AssistantManager] NVARCHAR(36) NULL,
  [Fax] NVARCHAR(100) NULL,
  [ZipCode] NVARCHAR(100) NULL,
  [Address] NVARCHAR(400) NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR(500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'组织机构',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'上级部门编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'ParentId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'部门编码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Code';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'部门名称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'内部电话号码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'InnerPhone';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'外部电话号码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'OuterPhone';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'部门经理编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Manager';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'部门助理编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'AssistantManager';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'传真',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Fax';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'邮编',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'ZipCode';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'地址',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Address';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'排序号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Sort';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'备注',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Remark';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(0：删除、1：有效)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Organization',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'50578619-6939-4F6D-B421-9176E76ADBC0', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1002', N'财务部', NULL, NULL, N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', NULL, NULL, NULL, NULL, N'2', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:43.513', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:51.693' );
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'550b796b-a6ca-4b18-a0a0-d5812dbd32d8', N'05e85693-14b0-4582-8063-8fbde85371f0', N'1000002', N' 人力资源部', NULL, NULL, N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'74f86691-537a-4c5c-a7e8-6f68bbe95788', NULL, N'000000', NULL, N'1', NULL, N'1', NULL, N'2013-04-11 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:31:17.630' );
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1003', N'互联网金融部', NULL, NULL, N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', NULL, NULL, NULL, NULL, N'3', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:41.870', NULL, NULL );
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1001', N'人力资源部', NULL, NULL, N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', NULL, NULL, NULL, NULL, N'1', NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:07.437', NULL, NULL );
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7fd46efd-5b1b-48da-95d1-1992e347f532', N'05e85693-14b0-4582-8063-8fbde85371f0', N'1000003', N'财务部', N'111', NULL, N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', NULL, NULL, N'000000', NULL, N'2', NULL, N'1', NULL, N'2013-04-11 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 16:33:24.850' );
GO
INSERT INTO [RBAC].[Organization] ( [Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8b6ab119-6bf9-408b-902f-4fad259127e3', N'05e85693-14b0-4582-8063-8fbde85371f0', N'1000006', N'互联网金融部', NULL, NULL, N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', NULL, NULL, N'000000', NULL, N'5', NULL, N'1', NULL, N'2013-04-11 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:31:28.147' );
GO
CREATE TABLE [RBAC].[Role]
(
  [Id] NVARCHAR(36) NOT NULL,
  [ParentId] NVARCHAR(36) NULL,
  [Name] NVARCHAR(100) NULL,
  [Restriction] NVARCHAR(400) NULL,
  [AllowEdit] INT NULL,
  [AllowDelete] INT NULL,
  [Sort] INT NULL,
  [Remark] NVARCHAR(500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'父角色编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'ParentId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色名称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色限制',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Restriction';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'允许编辑',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'AllowEdit';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'允许删除',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'AllowDelete';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'排序号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Sort';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'备注',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Remark';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(0：删除、1：有效)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'Role',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
INSERT INTO [RBAC].[Role] ( [Id], [ParentId], [Name], [Restriction], [AllowEdit], [AllowDelete], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'4b5e31da-c93b-4434-b8fd-aca066a1f3f5', N'0', N'运维人员', NULL, NULL, NULL, N'2', N'运维人员所属角色', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 14:19:22.480', NULL, NULL );
GO
INSERT INTO [RBAC].[Role] ( [Id], [ParentId], [Name], [Restriction], [AllowEdit], [AllowDelete], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0', N'管理员', NULL, NULL, NULL, N'1', N'管理员所在角色。', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-10 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-08-22 15:52:13.677' );
GO
CREATE TABLE [RBAC].[RolePermission]
(
  [Id] NVARCHAR(36) NOT NULL,
  [RoleId] NVARCHAR(36) NULL,
  [SystemMenuId] NVARCHAR(36) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色权限',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'RoleId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'SystemMenuId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'RolePermission',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'01AB17E4-BC9A-44F6-9984-EAD7ABC0D3DE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'035B48EA-0270-4602-9F47-BE70F1E05E0D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'68427266-1bdd-42c0-bd60-094cba29bfaa', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0625E898-1150-4741-9853-D9436F69FD0D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'da9e5953-154c-4435-beb7-de71b99753f4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0694C0AD-454E-4D12-AD04-7527B6CE306E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0813428d-0794-465f-9c4e-d0cc0d002f03', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'9541e7b4-c80e-4a3c-8c5e-91ff5e315457', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0A494227-EF3D-49CE-B476-45F9EC65A5DE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0AF1FAE5-E223-4104-87E8-785902F09058', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0BEE3DA4-20E2-44CB-98E3-CC11BACCF2B2', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0c8ff659-de13-4087-9bcd-227970b00312', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bdbfa627-989f-4725-8ab6-0cb75feeda7f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0D414E3D-28C7-4275-A809-82E6311FD695', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0f64f239-188b-498f-894f-6fc6f0a7449d', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'0fa4b10f-8e71-440a-a2b7-f82db78b845f', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'10CA41A9-43CC-4782-866A-0B72EE309363', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'89BDE962-1348-4A4E-9F10-46E37DCA0466', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1377c843-d692-453e-a1cf-9c28241f9472', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'c9d6878c-4f55-4787-af62-c73204c940e3', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'15C972BD-74A9-4665-A93F-402E96DC01E9', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bc011009-243a-4ca4-a52a-1429c92d1867', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'16fa44e1-4c5d-4d94-85a4-fa63796213a8', N'18c84947-438c-4987-b556-1c132b1c8be3', N'f6a0e772-8ad1-4db1-81d6-1c6a7211dc0f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'194452B8-5190-407B-953C-1D7D5A255F7E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'19ae1d94-e3a0-4e2f-8ed6-d9865a411bae', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'19B5213D-CDAB-4C40-BE7B-66121A8DED5F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1B7D8F0B-A3AB-40E9-AB25-433B0AF8FC21', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'90bae59c-0eea-49f4-a2be-401da670816e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1dcfff9c-5ad0-45cc-8964-dad1744d54c1', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'00461fd8-0a69-4221-bf29-af1313d0a9b0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1e09ccd3-e240-4f30-aacc-b787a2095b2f', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'375439c5-6027-4e9c-91b1-b394d869ebd0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1F563998-36D6-4329-A94D-EBC45290181B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7c200187-5793-430b-9eeb-eced97f9798b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'1fe7a3ae-6dfa-468d-a32a-c64bda3f697d', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'0c99c9e6-ee40-4fae-8eaa-56378855204a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2093eb87-1ffd-439c-940f-7b417588245b', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'3885ba7f-c246-493f-9053-7aa70a642662', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'21abef45-5f04-4b35-ace1-77442aa9de86', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'feba1602-3248-4cb1-83e6-ba92bd071f1a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'22672D3D-B053-40F4-BC11-B2D4E4F2DDBA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'23BEA77F-BC85-46F1-8B3B-79B773D03762', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'805d0b61-ba00-4b77-b367-a0d309694258', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'242740f5-7a68-4051-b338-2b47aaa21f0f', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'26744dde-eea0-434f-8b61-84fd067627a6', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'29353ECE-7840-4041-91D9-32840EFDA7C5', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'29508034-CD71-4512-AE92-EAB47EDE825C', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2aad5c6e-aa8b-44ae-952d-3854e924910a', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'1a1dd2b9-dfdf-4fcd-af2c-eb9735b46a39', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2bf0544e-99af-4c6c-bcc7-ffddcb2cb9ad', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2d68e4f5-3374-4df9-8de9-a17b2181da3a', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2dd2326f-8616-4f9a-b8a0-701d5652e42a', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'd1d3400d-0f5d-48d9-82ff-b836cfe85c74', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2eae893a-d153-4ce4-8e10-d6737f7831de', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'88a897ac-f048-4ca4-9832-cbbe06b5fe96', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'2ec4c22c-ef52-4ec3-88e0-a3d71a3951ae', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'686cfd44-da0a-4920-a5c5-7001e7ebb9f5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'30bc5f86-cea2-4072-b96f-cf1f8cbfe057', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'320946c1-b7dd-4b82-a0d6-4d42381dc5b1', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'c47836ce-57fe-4f48-a5f6-a46ac565ff4e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3423954B-A2E5-4732-B4D6-DA6F7F194589', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ed192e6f-9a49-402b-890b-c46da5468023', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3537b170-b432-4f4f-aab8-a193f5ed35b7', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'93e86ea6-62fc-4b74-b5be-e4a565c7a819', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'36010a1f-9d37-436e-b542-e9df3c81ef1d', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5c34d8c4-9bc5-4923-8427-a43489448bf2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'36dfa498-fae6-436b-afe6-ee5db4fb2abf', N'18c84947-438c-4987-b556-1c132b1c8be3', N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'38DB02AB-551C-4197-A38D-B7A9CCC19630', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3b169381-3f97-4594-b56b-24ab962343e2', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'b57380bd-c0ec-4abf-9fe6-077c58065743', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3D40D9F8-15F1-456D-A45F-FCE80B843903', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd396873e-ec5b-4c44-919a-7d206cd0cc90', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3dce00da-46e0-4eae-b3f6-c20a4cd772b5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3e5dd72e-12f8-4709-be82-e1e69710facf', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'52567bff-6a9f-48fd-84af-0b6a3ad1a748', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'3F3A61AB-F9B2-4355-BEA8-65D7AE09FDEE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'401DAB6C-B256-449E-A2CA-B4E64B6D5542', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'42E76DA0-6DB7-4852-804D-0404FF92F5CC', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'43acec32-e071-4334-857b-3a59b02245b2', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'1d9a0862-e924-432e-971f-3b4a4dfd8231', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'4649c8d0-ed00-4c8b-9a94-fa6f10585618', N'18c84947-438c-4987-b556-1c132b1c8be3', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'464f05c1-3f1a-4351-b87b-d8c692a245e5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'6a1b0f48-a059-4e16-9e8a-ae67436f764d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'46DE7E83-E59A-4A3F-B7CD-F9FC7B3C95AF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'490B3674-4C0D-4A59-838E-5D065FD51DF6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'4a125a51-2402-4588-8633-7369c4bcfd6f', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'4CB80CED-DCCA-4725-BA87-D83DC638CC63', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2e638140-f718-4879-afeb-2fac02bbce2e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'4DD167B7-CDA6-4CC9-A576-BE2A922A489F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'533f268e-e31d-4346-b0e2-86dd42df7be3', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'6fdb593b-e116-4e4b-b654-e8d3c544e325', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5412BDAA-DC11-447D-B9FD-549F8A5EF947', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5624145D-A64D-4AA6-9208-030A74C82F87', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2df2974e-f90a-4c4d-baf5-fcd16267d36b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5c048c5c-efaa-4a18-8667-e5d3bd1e3b77', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bc011009-243a-4ca4-a52a-1429c92d1867', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5C48300E-4222-4A14-8141-135306C52537', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5ceeee03-ce1a-4581-a124-071dde9b4ab6', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'f4170591-40d5-4dbf-accb-e789e9ad2e99', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5d0595a3-db81-44a9-9220-e3cd32a13702', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bd4cd2fe-5acb-4021-95eb-b1a193b940ff', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5d3d34a7-ebc1-4fda-8493-8c1ce5b3d5d7', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'312358c0-4285-426f-944a-e601490a011a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5D42AD13-C3AC-4D5B-A337-72B16D73D07C', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'737a0a1c-d547-441c-a1db-46b79eb12038', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5ef25835-91c1-4385-9fb8-27797fc5079d', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5F0FB6A0-F76E-4E2A-A599-B810A033309D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'5f499073-2f73-4963-8952-0dc4dd5bbb58', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'2896d021-562d-4bd4-8ffc-56161ad4c579', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'64F1784B-C47F-4EC4-B950-563A2C967C4D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'64f82e4e-a43d-4e59-9363-e078ca04a9f8', N'18c84947-438c-4987-b556-1c132b1c8be3', N'1c9bee1f-d92b-4ebf-88fd-3abb65357304', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'674909FE-62B1-4E81-8FD3-1A8FEDA4880B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'68148e1d-4cc0-4a7c-8805-dfe3cb3f634c', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'46e23f0c-b0fc-485e-9e19-e31e20d48500', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'68298832-E896-450B-A2EE-3A744A1CB700', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'74a5586b-8ed6-4581-92d6-be1599147684', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6834feb1-ad02-4182-a110-3a3b5fa19231', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6897a773-a79f-4154-9d9d-b0db6febca95', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6A01A2F1-7441-44B3-BB25-8E8D91254091', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6a50ffd9-1034-4550-9d6a-6a2496229408', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'1d69952a-ff84-4d13-be69-3c9b02068507', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6cfd93b7-af88-4046-9f84-5300715b3d3c', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'805d0b61-ba00-4b77-b367-a0d309694258', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'6d5e6c81-5f55-4f19-920d-1be548708856', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'e85a88f2-5c88-459a-8b5f-0a6245da926a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'702ebe3f-71f3-4d83-9674-d1ce12867d18', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'2fe92677-f9fa-4cc4-bd9b-a96eaa0829d7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'70526A44-040E-419F-8296-044CE03310AF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'73917dbf-7b5c-4970-9bb5-6ef1da7ccc86', N'18c84947-438c-4987-b556-1c132b1c8be3', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'77be3039-9c87-4b9b-9b43-924866ee12f6', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'560608d3-2c82-48ad-b7b3-35aa2aec46a2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'78B65BD8-1898-4A35-B356-9211B30E245A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'7a066a3b-4eff-49e7-8777-1015114526e5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'7BD3E4F4-5B74-4F7C-9041-5021E0E173BF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'df3bb11c-3907-49cf-a091-f9f77b63ed7d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'7cdb5f1c-1d24-44c8-a07a-c9154ee6155f', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'83CD1980-E0D4-4446-B0AA-2865D012B796', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'46331541-77bb-4fcc-9cc0-039ed258048d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8796A8DF-07FF-4A14-9E3A-BC1C9711C531', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'881F2F34-B78F-46A2-B592-71B9C664E05E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'89121e9b-3681-4bf7-9587-d7d009fc70ca', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'7996cea4-5503-4807-87ba-d2da553c4341', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'89a646cb-fa74-4d0a-bd36-675314eada03', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'04782509-7aa5-446d-b63f-eac068c4c05a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8a6a0c3d-ef26-4870-8181-c091b92e6d30', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'4bee319b-42f3-41b6-a716-0fd42ef62642', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8ad9f4d8-d36b-499e-bc3b-73c211ba65cb', N'18c84947-438c-4987-b556-1c132b1c8be3', N'b863d076-37bb-45aa-8318-37942026921e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8b343d94-5e6e-42ad-997e-824e4a1a4852', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'ad7be971-979d-4e02-86ca-7f9d89c72770', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8C264EA9-A458-42A8-BB72-2FC0B032BA3D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c546a78a-7f0d-4cd9-a9ed-96548acb8910', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8DA2ACEB-194D-410C-8E6D-1EFC152757E0', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8e682cd5-6bb7-4ad2-9833-1031bab5ad40', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'3a30471e-a0db-417f-a651-0b9fe35f2100', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8F908785-8CA2-4D70-88B2-BA2AD9B8B862', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'8fefc434-ffc6-4f68-adf2-e06e24266752', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'8c119aab-b70f-4219-bab2-ca0e3a25b79d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'930f5da0-4056-4043-992d-3a44d412a149', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'9471F596-067E-42EC-8A93-103502266C95', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'94C85907-8885-4F57-B1E1-FB2D2E99D103', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'956cb9d5-c01a-4bbe-9ba9-c61d3ad47384', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'58ba9630-b6c1-4925-9916-4c5221291784', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'96DB6E81-BAE8-4455-BCA6-91DAA39C9C69', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'3885ba7f-c246-493f-9053-7aa70a642662', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'97FA5902-F9AF-42DE-8BCD-CDA4AFDFAF62', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f367dc71-5918-45fd-a4bf-84c0091f18e7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'981E07CD-D8CE-4C66-855F-45F378D5E9BE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bf2ec92c-c23b-4376-a1c4-6336061f14ab', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'98387c05-def0-4dbb-bde9-9548226efe86', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'9A1C2F3C-DEDA-4E8B-A0E8-A437FDFBD735', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'9F518348-4291-44DC-BF47-D129D49163CF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'a1bcfe0e-19a5-46b4-a2c7-7abd572eae8e', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'a1d14136-ce79-4bab-9f3c-b2dee377efc0', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'A39FA93C-C058-4F05-AABB-1005EAAA7BCE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'a413390b-ed04-4d8b-8c53-5aec741c6df5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'A45B0103-3C28-42D6-8C35-9981205B1BB1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'6d62927c-4c77-4ef8-b3cf-a3ef2eceea81', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'A5A5CEF6-B10C-4A72-A4B5-03F565551D1F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'123d862c-7965-40c1-bd9b-158582f8bb78', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'AB78CCB3-1E81-4C52-9CBE-E82D516EE73A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'addfd725-788b-481f-a8fd-0b57510e58b1', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B0A52580-F7FC-4255-8027-20D16C0F8A3C', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'b0d9eede-f098-41a9-bb67-01ec717ea453', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'b1111287-928e-4efc-a85d-accdccc4eb93', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'cac72943-b5c7-4d70-8be8-a31f006563d5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B1456B22-1BCD-429A-B4A3-75C9F7A1E001', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'cb8601a7-e15e-440a-aee3-5698aeec05c8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B1CA522A-8312-4A55-B393-9E5D045E7D5E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'b2444b0b-e2f9-4a1a-b2cb-678cd5f3aeb1', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'74a5586b-8ed6-4581-92d6-be1599147684', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B3929303-C4CB-4327-AA56-F414A9EE6E90', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'365c5bf3-b266-4271-bde3-4d33b280abc1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B5244C2D-047F-460F-8316-6C16644C0552', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f4ca7d5c-63cf-471f-9226-d7ce5f298272', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B7547892-4E8D-4199-8F3B-E5F67B9BF222', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B91D4DD5-F28E-4C3E-A327-63944A79759A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f5e0b9d9-5b99-4649-809e-b326dc012f77', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'BA51CD9D-B325-4072-9983-B50AEE1E702F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'04782509-7aa5-446d-b63f-eac068c4c05a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'BAD3A82A-6DBA-4E6E-8D16-C326B2C9C34E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'bfee1d39-a199-4f42-bea5-201dedbc1700', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'cebbeb53-2470-450f-bdc3-f88d4700fb85', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'c32aa8b0-1dfa-4f8b-9445-dac3f708475a', N'18c84947-438c-4987-b556-1c132b1c8be3', N'b27eef9d-55f5-4109-b91a-c0d5d0b600cd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'C56E4838-E6FC-4872-B219-3E2AB6A4F002', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'49CE8797-0DD0-49AB-8378-ADDD948810C7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'C7FBA1CA-5961-4976-A873-F50F4C8449E1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'C83ABE78-7D64-4F8F-9110-E3CCCA828DA3', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'C86B02AD-0C31-48A5-9BD8-D8B1DB47D760', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a1086dca-5677-4107-9a95-9a70259e927d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'cc26a369-35b3-4beb-8f7f-c421ffd0f672', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CC5FF137-60FE-49C9-9384-3DD155B634E9', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CC6255A5-AD12-4DDD-8DE8-6A58A00C1389', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b1d87254-b0ef-4a50-b427-ca0484e4516b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CCD7D1DB-8DB5-4B2E-ADB3-6A11308A74B8', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8884d6af-28ed-466d-9cb1-1a2d55dd12da', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CE97787F-4A08-4109-9B66-80D16F1A313C', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fc08d048-2ff8-4948-b1b4-876c561bb8d7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'cea7bff0-b9f0-47df-8e44-b278806304ee', N'18c84947-438c-4987-b556-1c132b1c8be3', N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CF214551-2038-4B88-AF35-B82B7946F160', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'D0732FA4-0FAD-44AF-9474-54670B091F5F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd84d5f23-9220-4ad5-ac66-fef7e303e819', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'd24a1449-63f3-48ee-8b5d-cdf6be4910db', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'1794476e-90cd-45a1-952d-ee9dc05b95af', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'd36201a0-4abc-4f0e-94f3-b2d305023f48', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bcb976ed-97ce-4d9c-b770-0a5ae3158a75', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'D52055FB-E86E-4D72-820F-19D4246DA91F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'eb76dd47-c269-4f95-8585-cbd786d489f3', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'D812E1AD-6119-4951-B70F-F216CE68EB4F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'd86f0f6f-e796-4001-9269-ce1d511250a0', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5844fd85-bb2c-42b6-b4fa-85176209ecfc', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'D870BC69-77CD-4993-BAA3-C92606309082', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'da00cfaa-b4a4-4156-b867-e2f45c35ffcd', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'DD1CD17C-F181-4A31-B278-49E8752AC36D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'269bf251-0579-428d-811a-75be20089161', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'dd9a5531-dd12-48eb-9856-3fec73fd3569', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5e191896-d3ae-46b0-8327-963e3b797d55', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'df6e2fe4-f40c-4e4c-9bef-b2917bfbcac0', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'E0248423-72A9-4EDF-8F7E-6F7260E4D2DD', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'edb10427-401c-4925-96cc-f7df89ad986d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'e0312bf1-e793-46b0-b09b-ca3b14f50c90', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'e1ccc750-45be-4050-88ff-3b241015bc11', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'E1F0535D-54AE-4D1E-8131-BEC032CF4448', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'9f0af966-630b-47cd-bb05-a4b3d9c5692d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'e34c7fae-2b8e-4401-a1ce-a21200de31a9', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'e12bd45d-5885-40e7-91be-a21e5885a432', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'e489b1a2-1ad6-4921-8c42-b1d014cb8c6f', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'ea8fe030-fc96-408b-982e-b52dbb134f40', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'0180fc7a-70eb-433c-89db-20076b97dd13', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'eb1f8bc4-ffc0-457d-b2e7-d497e74ccbf4', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'b2310443-b05c-4872-8d20-308b6a2b6503', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'ebea05fa-c478-47cc-a672-d68af6a6103c', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'fdd88267-878e-415f-989f-042f23408c50', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F0201B24-CA3B-4861-818F-1B6B69F3D4B2', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F114C11A-6925-4E19-A84F-9C8AED36C62F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ffe5276f-d3af-4af9-b12d-3e969948e8a5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'f14612d5-fdbf-4fc6-8d84-de065c7dd011', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F2BE13D2-FB6A-4B22-ADF1-3E22CF364143', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'f3bd3b24-1ac9-4606-8247-a2114b205b49', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F456AE40-3B57-479A-8CE4-9843E7207E7B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0b85d430-9ec6-4c93-97bb-d1b9fe2af289', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F630FB69-FEC8-49AC-BD1D-33FA509C8DCF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b78f59c1-b6fd-465e-837a-857b77547402', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'f6b16fe7-891b-46e1-b7ce-4d9eff9cc461', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'f8309680-1ad5-4dd1-b2f3-32727d78c3f7', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'F9F82C98-6C57-4A66-A2FF-EDE0A3B1942D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'FA334DD4-DD35-4A4D-AF0E-1F2E5DAD19F7', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'FB4D6E5E-5011-4DB2-9226-29FF5BE4CF8D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
INSERT INTO [RBAC].[RolePermission] ( [Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'FC078607-0AF8-452E-A92E-DA797E31C728', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:25:30.800' );
GO
CREATE TABLE [RBAC].[StaffOrganize]
(
  [Id] NVARCHAR(36) NOT NULL,
  [UserId] NVARCHAR(36) NULL,
  [OrganizationId] NVARCHAR(36) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'人员组织机构',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize',
    @level2type='COLUMN',
    @level2name=N'UserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'部门编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize',
    @level2type='COLUMN',
    @level2name=N'OrganizationId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'StaffOrganize',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'18F69D98-EEB9-4AC9-9F5B-9E227637FC2D', N'452865b1d31c', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:59.633' );
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'231BE6C8-EE3B-47CA-82F6-14AD9280C82E', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:33.120' );
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'B4E6EC27-6B6E-4947-A7C5-B2F16F373319', N'48f3889c-af8d-401f-ada2-c383031af92d', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:09.300' );
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'CF0ABF00-3991-4FE1-8DAD-E91E7C8EBCAE', N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:15.920' );
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'ddbe38af-3cd3-4115-a318-47d56f7d7c81', N'630ecf4b-24b8-4f93-8ca0-2e08f618dae1', N'ebcea0bb-232a-494b-996e-4eb5aa59d1af', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-16 00:00:00.000' );
GO
INSERT INTO [RBAC].[StaffOrganize] ( [Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'E34B6062-B663-4266-98F1-74EFA1979377', N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', N'50578619-6939-4F6D-B421-9176E76ADBC0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:03.937' );
GO
CREATE TABLE [RBAC].[SystemMenu]
(
  [Id] NVARCHAR(36) NOT NULL,
  [ParentId] NVARCHAR(100) NULL,
  [Name] NVARCHAR(100) NULL,
  [Title] NVARCHAR(100) NULL,
  [Image] NVARCHAR(100) NULL,
  [Category] INT NULL,
  [NavigateUrl] NVARCHAR(400) NULL,
  [Target] NVARCHAR(100) NULL,
  [AllowEdit] INT NULL,
  [AllowDelete] INT NULL,
  [Sort] INT NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单导航',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'主键',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'父节点主键',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'ParentId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单名称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'标题',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Title';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单图标',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Image';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单分类',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Category';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'导航地址',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'NavigateUrl';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'目标',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Target';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'允许编辑',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'AllowEdit';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'允许删除',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'AllowDelete';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'排序码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Sort';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(0：删除、1：有效)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'SystemMenu',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'角色 -  详细信息页', N'角色 -  详细信息页', NULL, N'2', N'/Admin/Role/ViewDetails', N'href', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:01:14.590' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'04782509-7aa5-446d-b63f-eac068c4c05a', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'个人信息', N'个人信息', N'387.png', N'1', N'/Admin/User/CurrentUser', N'Iframe', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-06 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'0b85d430-9ec6-4c93-97bb-d1b9fe2af289', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'举报', N'举报', N'20130406014211289_easyicon_net_16.png', N'3', N'report()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'新增', N'新增', N'glyphicon glyphicon-plus', N'3', N'add', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:09.633', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'123d862c-7965-40c1-bd9b-158582f8bb78', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'分配权限', N'分配权限', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', NULL, NULL, N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:32.323', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:19.300', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'269bf251-0579-428d-811a-75be20089161', N'3885ba7f-c246-493f-9053-7aa70a642662', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'新增', N'新增', N'add.png', N'3', N'add()', N'Onclick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', NULL, NULL, N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:36:37.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2df2974e-f90a-4c4d-baf5-fcd16267d36b', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'新增', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:38.433', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2e638140-f718-4879-afeb-2fac02bbce2e', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'新增', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:33.670', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:45:01.940', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'35a27119-4fb7-4b4a-b5f9-9c89999614a8', N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd', N'新增', N'新增', N'add.png', N'3', N'add()', N'Onclick', NULL, NULL, N'1', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-14 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'365c5bf3-b266-4271-bde3-4d33b280abc1', N'3885ba7f-c246-493f-9053-7aa70a642662', N'分配按钮', N'分配按钮', N'bricks.png', N'3', N'allotButton()', N'OnClick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'3885ba7f-c246-493f-9053-7aa70a642662', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'菜单导航', N'菜单导航', N'sitemap.png', N'1', N'/Admin/SystemMenu/Index', N'Iframe', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:16.167' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'3e544d7a-d850-4785-9648-feafc4698a3b', N'0', N'权限管理', N'权限管理', N'fa fa-key', N'1', NULL, N'Iframe', NULL, NULL, N'500', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-31 13:38:33.917' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'首页快捷方式', N'首页快捷方式', N'637.png', N'1', N'/Admin/HomeShortcut/Index', N'Iframe', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'432728c6-8f54-4dd7-9bc1-9fd2bfa602b4', N'3885ba7f-c246-493f-9053-7aa70a642662', N'菜单 - 编辑页', N'菜单 - 编辑页', NULL, N'2', N'/Admin/SystemMenu/CreateOrEdit', N'Open', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:00:33.550' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'46331541-77bb-4fcc-9cc0-039ed258048d', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', NULL, NULL, N'7', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:28:03.823', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'49CE8797-0DD0-49AB-8378-ADDD948810C7', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'3', N'OnBack', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:46:08.443', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'4b48e553-0caa-43a1-b969-8c1c2d157f08', N'0', N'项目管理', N'项目管理', N'glyphicon glyphicon-tasks', N'1', N'#', N'Iframe', NULL, NULL, N'1', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:31:36.490', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:40:18.443' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:11.247', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'545d2450-4dac-4377-afbe-d9aa451f795f', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'角色管理', N'角色管理', N'20130508035646751_easyicon_net_32.png', N'1', N'/Admin/Role/Index', N'Iframe', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:51.403' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'55807012-beb2-435e-a56c-3d0824f99591', N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'Onclick', NULL, NULL, N'2', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-19 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'0', N'系统管理', N'系统管理', N'glyphicon glyphicon-cog', N'1', NULL, N'Iframe', NULL, NULL, N'700', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-18 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:29:30.627' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'分配权限', N'分配权限', NULL, N'2', N'/Admin/User/AllotPermissions', N'Iframe', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:45:17.560', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:47:08.293' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'字典管理', N'字典管理', N'4999_credit.png', N'1', N'/Admin/Dictionary/Index', N'Iframe', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:55:30.773' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'5c5077f0-7703-4fee-927a-b765e1edf900', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'系统个性化', N'系统个性化', N'581.png', N'1', N'/RMBase/SysPersonal/Individuation_Set.aspx', N'Iframe', NULL, NULL, N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-06 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'操作按钮', N'操作按钮', N'567.png', N'1', N'/Admin/Button/Index', N'Iframe', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:34.143' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'68427266-1bdd-42c0-bd60-094cba29bfaa', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'新增', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:33.757', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'角色管理', N'角色管理', NULL, N'1', N'/WebApi/Role/Index', N'Iframe', NULL, NULL, N'20', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:34:54.430', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'6dfa67e5-e897-49ea-ad74-a75fe7ac4cb3', N'cdac0cef-7a6d-4d9c-9212-0e7d08375bca', N'节点1', N'节点1', NULL, N'1', NULL, N'Iframe', NULL, NULL, N'1', N'0', NULL, N'2014-02-19 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'705df84f-f4ee-4a20-82d5-9e0f92bf989d', N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a', N'新增', N'新增', N'add.png', N'3', N'add()', N'Onclick', NULL, NULL, N'1', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-19 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'737a0a1c-d547-441c-a1db-46b79eb12038', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'分配成员', N'分配成员', N'fa fa-group', N'3', N'OnAllotMember', N'OnClick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:15.597', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'74a5586b-8ed6-4581-92d6-be1599147684', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:45:00.610', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'系统设置', N'系统设置', N'4968_config.png', N'1', N'/Admin/SystemSetting/Index', N'Iframe', NULL, NULL, N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:56:15.510' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'授权', N'授权', N'wrench_orange.png', N'3', N'accredit()', N'Onclick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7c200187-5793-430b-9eeb-eced97f9798b', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:40.787', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'新增', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:05.210', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'0', N'动态页', N'动态页', N'fa fa-bolt', N'1', N'#', N'Iframe', NULL, NULL, N'100', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-26 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-31 13:38:07.233' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'805d0b61-ba00-4b77-b367-a0d309694258', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'保存', N'保存', N'disk.png', N'3', N'SaveForm()', N'Onclick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'810a72f0-55d3-468f-8653-10d1b06a4234', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'角色 -  分配权限页', N'角色 -  分配权限页', NULL, N'2', N'/Admin/Role/AllotPermissions', N'href', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-12 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-10 14:14:48.683' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'数据管理', N'数据管理', N'glyphicon glyphicon-random', N'1', N'/DynamicPage/Configuration/Index', N'Iframe', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:18:41.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8884d6af-28ed-466d-9cb1-1a2d55dd12da', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:08.147', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'89BDE962-1348-4A4E-9F10-46E37DCA0466', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'3', N'OnSave', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:46:06.413', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'刷新', N'刷新', N'glyphicon glyphicon-refresh', N'3', N'OnRefresh', N'OnClick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:38.483', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8d541792-ac65-437e-b874-817c44e2ea5e', N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'Onclick', NULL, NULL, N'3', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-14 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'3', N'OnBack', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:47.457', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8f82b5f3-6185-4296-bef6-52eed4e29a94', N'/Admin/SystemMenu/AllotButton', N'查询', N'查询', N'zoom.png', N'3', N'search()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-14 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'用户管理', N'用户管理', N'userregedit.png', N'1', N'/Admin/User/Index', N'Iframe', NULL, NULL, N'15', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:24:24.580' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'90bae59c-0eea-49f4-a2be-401da670816e', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:17.710', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'动态属性', N'动态属性', NULL, N'1', N'/DynamicPage/ExtensionProperty/Index', N'Iframe', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:19:32.313', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:12.410' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:37.453', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'9f0af966-630b-47cd-bb05-a4b3d9c5692d', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'新增', N'新增', N'add.png', N'3', N'add()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a1086dca-5677-4107-9a95-9a70259e927d', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'授权', N'授权', N'glyphicon glyphicon-thumbs-up', N'3', N'OnAccredit', N'OnClick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 14:21:56.453', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'Onclick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'资源管理', N'资源管理', N'625.png', N'1', N'/Admin/Globalization/Index', N'Iframe', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:55:37.207' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'0', N'个人信息', N'个人信息', N'glyphicon glyphicon-user', N'1', NULL, N'Iframe', NULL, NULL, N'300', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:56:49.890' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'aacb438d-bafd-4288-874a-1sae6e8ed4e7', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', N'三级页面', N'三级菜单页面', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', NULL, NULL, N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:36.630', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'b1d87254-b0ef-4a50-b427-ca0484e4516b', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'新增', N'新增', N'glyphicon glyphicon-plus', N'3', N'add', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:16.443', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'3', N'OnSave', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:43.617', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'b78f59c1-b6fd-465e-837a-857b77547402', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', NULL, NULL, N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:35.430', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N' 用户列表页', N' 用户列表页', NULL, N'2', N'/Admin/User/Users', N'href', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-16 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:45:30.397' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'bc011009-243a-4ca4-a52a-1429c92d1867', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'Onclick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'路由规则', N'路由规则', NULL, N'1', N'/WebApi/Route/Index', N'Iframe', NULL, NULL, N'30', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:06.567', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:30:59.983' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'3885ba7f-c246-493f-9053-7aa70a642662', N'菜单 - 新增页', N'菜单 - 新增页', N'153.png', N'2', N'/Admin/SystemMenu/CreateOrEdit', N'Open', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:00:25.193' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'新增', N'新增', N'glyphicon glyphicon-plus', N'3', N'add()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'返回', N'返回', N'back.png', N'3', N'back()', N'Onclick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c2947a69-fc79-4861-92ea-87361d8b5715', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'用户管理', N'用户管理', N'glyphicon glyphicon-user', N'1', N'/WebApi/User/Index', N'Iframe', NULL, NULL, N'10', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:45:51.693', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c43b3e15-7486-4202-91ff-798f011d5ae1', N'fa589b9e-f97d-4e3e-ae96-6fc471a1f63a', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'Onclick', NULL, NULL, N'3', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-19 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c546a78a-7f0d-4cd9-a9ed-96548acb8910', N'3885ba7f-c246-493f-9053-7aa70a642662', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'分配权限', N'分配权限', NULL, N'2', N'/WebApi/Role/AllotPermissions', N'Iframe', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:28.603', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-10 14:13:24.500' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'cb8601a7-e15e-440a-aee3-5698aeec05c8', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'还原', N'还原', N'2013040601125064_easyicon_net_16.png', N'3', N'restore()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'锁定', N'锁定', N'lock.png', N'3', N'lock()', N'Onclick', NULL, NULL, N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'cdac0cef-7a6d-4d9c-9212-0e7d08375bca', N'0', N'新增测试', N'新增测试', NULL, N'1', NULL, N'Iframe', NULL, NULL, N'6', N'0', NULL, N'2014-02-19 00:00:00.000', NULL, N'2014-02-19 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'0', N'组织机构', N'组织机构', N'glyphicon glyphicon-pawn', N'1', NULL, N'Iframe', NULL, NULL, N'400', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:23:45.403', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd396873e-ec5b-4c44-919a-7d206cd0cc90', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'新增', N'新增', N'add.png', N'3', N'add()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N' 所属部门页', N' 所属部门页', NULL, N'2', N'/Admin/User/Departments', N'href', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-16 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:45:44.160' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'd84d5f23-9220-4ad5-ac66-fef7e303e819', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'da9e5953-154c-4435-beb7-de71b99753f4', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete()', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'df3bb11c-3907-49cf-a091-f9f77b63ed7d', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:06.770', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'e620450b-6d17-4192-bee0-66fbd114e82a', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'部门管理', N'部门管理', N'20130508035912738_easyicon_net_32.png', N'1', N'/Admin/Organization/Index', N'Iframe', NULL, NULL, N'20', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:24:40.383' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'WebApi权限管理', N'WebApi权限管理', N'glyphicon glyphicon-cloud', N'1', N'#', N'Iframe', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:45:01.633', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:09:00.630' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'eb76dd47-c269-4f95-8585-cbd786d489f3', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'锁定', N'锁定', N'glyphicon glyphicon-lock', N'3', N'OnLock', N'OnClick', NULL, NULL, N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 14:22:06.170', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'eb78e358-a188-4a4a-911f-a2050a312386', N'a9ad66a8-ef94-408a-9023-45ed79dcc6fd', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'Onclick', NULL, NULL, N'2', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-14 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'ed192e6f-9a49-402b-890b-c46da5468023', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:12.433', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'edb10427-401c-4925-96cc-f7df89ad986d', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:34.143', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'日志管理', N'日志管理', N'4937_administrative-docs.png', N'1', N'/Admin/Logger/Index', N'Iframe', NULL, NULL, N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-18 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-29 18:00:20.877' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'eecb438d-bafd-4288-874a-1sae6e8ed4e7', N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7', N'四级页面', N'五级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', NULL, NULL, N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7', N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7', N'四级菜单设置', N'四级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', NULL, NULL, N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', N'三级菜单设置', N'三级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', NULL, NULL, N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'3885ba7f-c246-493f-9053-7aa70a642662', N'菜单 - 分配按钮页', N'菜单 - 分配按钮页', NULL, N'2', N'/Admin/SystemMenu/AllotButton', N'Open', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:00:40.797' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'f367dc71-5918-45fd-a4bf-84c0091f18e7', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'分配权限', N'分配权限', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', NULL, NULL, N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:36:07.830', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'f4ca7d5c-63cf-471f-9226-d7ce5f298272', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', NULL, NULL, N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:35.240', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'f52158fa-1672-4a69-bd64-03e8bb88f6ab', N'4b48e553-0caa-43a1-b969-8c1c2d157f08', N'我的项目', N'我的项目', N'glyphicon glyphicon-object-align-left', N'1', N'/PM/Project/Index', N'Iframe', NULL, NULL, N'1', N'0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-31 13:39:30.630', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 09:50:19.720' );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'f5e0b9d9-5b99-4649-809e-b326dc012f77', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'分配成员', N'分配成员', N'fa fa-group', N'3', N'OnAllotMember', N'OnClick', NULL, NULL, N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:55.767', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', NULL, NULL, N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:39.597', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'fc08d048-2ff8-4948-b1b4-876c561bb8d7', N'3885ba7f-c246-493f-9053-7aa70a642662', N'新增', N'新增', N'add.png', N'3', N'add()', N'OnClick', NULL, NULL, N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'新增', N'新增', N'glyphicon glyphicon-plus', N'3', N'add()', N'OnClick', NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', NULL, NULL );
GO
INSERT INTO [RBAC].[SystemMenu] ( [Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [AllowEdit], [AllowDelete], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'ffe5276f-d3af-4af9-b12d-3e969948e8a5', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'分配权限', N'分配权限', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', NULL, NULL, N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:27:59.900', NULL, NULL );
GO
CREATE TABLE [RBAC].[User]
(
  [Id] NVARCHAR(36) NOT NULL,
  [Reporter] NVARCHAR(36) NULL,
  [Code] NVARCHAR(100) NULL,
  [Account] NVARCHAR(100) NULL,
  [Password] NVARCHAR(100) NULL,
  [Name] NVARCHAR(100) NULL,
  [Sex] INT NULL,
  [Title] NVARCHAR(100) NULL,
  [Email] NVARCHAR(400) NULL,
  [Theme] NVARCHAR(100) NULL,
  [Question] NVARCHAR(100) NULL,
  [Answer] NVARCHAR(100) NULL,
  [Remark] NVARCHAR(500) NULL,
  [Status] INT NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL,
  [ModifyUserId] NVARCHAR(36) NULL,
  [ModifyDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'汇报者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Reporter';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Code';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'登录账号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Account';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'登录密码',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Password';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户名',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Name';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'性别(0：女、1：男)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Sex';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'职称',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Title';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'电子邮件',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Email';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'主题',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Theme';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'找回密码的问题',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Question';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'找回密码的答案',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Answer';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'备注',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Remark';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'状态(0：删除、1：启用、2：停用)',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'Status';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'ModifyUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'修改时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'User',
    @level2type='COLUMN',
    @level2name=N'ModifyDateTime';
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'094f85f8-bc53-4247-979c-09da591d51b0', NULL, N'000002', N'xingm', N'0EAlVCBMJDOcVR3De5x49A==', N'明星', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:26.670' );
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'094f85f8-bc53-4247-979c-09da591d51b0', N'000004', N'bop', N'0EAlVCBMJDOcVR3De5x49A==', N'彭博', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:33.120' );
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'452865b1d31c', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'000001', N'xiaohu', N'0EAlVCBMJDOcVR3De5x49A==', N'汪小虎', N'1', NULL, N'xiaohuw@flyme.com', NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2000-01-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:59.620' );
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'48f3889c-af8d-401f-ada2-c383031af92d', NULL, N'000000', N'system', N'0EAlVCBMJDOcVR3De5x49A==', N'管理员', N'1', N'软件工程师', N'fenglinz@koteiinfo.com', NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:09.270' );
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'094f85f8-bc53-4247-979c-09da591d51b0', N'000007', N'ds', N'FYnUygl+7z+l510s7urn8A==', N'杜顺', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:15.920' );
GO
INSERT INTO [RBAC].[User] ( [Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime] )
    VALUES ( N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', N'094f85f8-bc53-4247-979c-09da591d51b0', N'000013', N'zhileih', N'0EAlVCBMJDOcVR3De5x49A==', N'何志磊', N'1', NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:03.913' );
GO
CREATE TABLE [RBAC].[UserPermission]
(
  [Id] NVARCHAR(36) NOT NULL,
  [UserId] NVARCHAR(36) NULL,
  [SystemMenuId] NVARCHAR(36) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户权限',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission',
    @level2type='COLUMN',
    @level2name=N'UserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'菜单编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission',
    @level2type='COLUMN',
    @level2name=N'SystemMenuId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserPermission',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
CREATE TABLE [RBAC].[UserRole]
(
  [Id] NVARCHAR(36) NOT NULL,
  [UserId] NVARCHAR(36) NULL,
  [RoleId] NVARCHAR(36) NULL,
  [CreateUserId] NVARCHAR(36) NULL,
  [CreateDateTime] DATETIME NULL
);
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户角色关系',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'Id';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'用户编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'UserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'角色编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'RoleId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建者编号',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'CreateUserId';
GO
EXEC sp_addextendedproperty
    @name=N'MS_Description',
    @value=N'创建时间',
    @level0type='SCHEMA',
    @level0name=N'RBAC',
    @level1type='TABLE',
    @level1name=N'UserRole',
    @level2type='COLUMN',
    @level2name=N'CreateDateTime';
GO
INSERT INTO [RBAC].[UserRole] ( [Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'510D87DF-E5E2-47F1-BA78-F373D62AD39B', N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:15.923' );
GO
INSERT INTO [RBAC].[UserRole] ( [Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime] )
    VALUES ( N'9C1CCF7B-00E9-427D-88BC-5F176EBAE169', N'48f3889c-af8d-401f-ada2-c383031af92d', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:09.370' );
GO
ALTER TABLE [RBAC].[Button] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[HomeShortcut] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[Organization] ADD PRIMARY KEY ([Id]);
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
ALTER TABLE [RBAC].[UserPermission] ADD PRIMARY KEY ([Id]);
GO
ALTER TABLE [RBAC].[UserRole] ADD PRIMARY KEY ([Id]);
GO