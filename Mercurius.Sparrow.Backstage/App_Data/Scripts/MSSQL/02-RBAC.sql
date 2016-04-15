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
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮标题' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Title'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮图标' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Image'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮代码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Code'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'按钮分类' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Category'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态(0：删除、1：有效)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Button' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyDateTime'
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'020e2c2a-e203-4694-85ef-c73bd301ad72', N'备份', N'备份', N'glyphicon glyphicon-download-alt', N'OnBackup', N'32', N'工具栏', N'数据库备份', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:56:09.410')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'067b2de9-037f-4bb9-8a41-285eb3fc7267', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'OnEdit', N'2', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-28 00:01:55.903')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'0e8c3c59-586a-48a0-a1ef-5a83f4a2d6fd', N'恢复', N'恢复', N'glyphicon glyphicon-open', N'OnRecover', N'33', N'工具栏', N'还原恢复数据库', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:56:19.470')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', N'导入', N'导入', N'glyphicon glyphicon-import', N'OnImport', N'5', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:41.430')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'1b88ce60-6438-4bb9-891d-c0bf4832e2d5', N'设置', N'设置', N'glyphicon glyphicon-cog', N'OnSetting', N'7', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:01.670')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2e5d2d97-1367-4036-8040-cfcd261e9e5f', N'锁定', N'锁定', N'glyphicon glyphicon-lock', N'OnLock', N'22', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:12.960')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2f1a1ba6-276e-4e7f-a219-ecfdb50e63fb', N'发布', N'发布', N'glyphicon glyphicon-globe', N'OnPublish', N'18', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:36.663')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'3194373e-1b97-4c92-9cd2-4778b00c3b13', N'清空', N'清空', N'glyphicon glyphicon-trash', N'OnClear', N'26', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:07.433')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'42cef74b-2c60-4d62-93b8-d0f6d16ca3b0', N'上传', N'上传', N'glyphicon glyphicon-cloud-upload', N'OnUpload', N'9', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:21.980')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'43334b34-f78e-4187-ad2f-1600bb932896', N'复制', N'复制', N'fa fa-copy', N'OnCopy', N'11', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:40.533')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'43334b34-f78e-4187-ad2f-1610bb912896', N'打印', N'打印', N'glyphicon glyphicon-print', N'OnPrint', N'13', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:00.973')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'43334b34-f78e-4187-ad2f-1610bb932896', N'还原', N'还原', N'fa fa-mail-reply', N'OnRestore', N'12', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:48.883')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'58d19434-705a-4199-acdc-b6d0322501bf', N'下载', N'下载', N'glyphicon glyphicon-cloud-download', N'OnDownload', N'10', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:31.510')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'73f60b12-fc1f-4927-9803-616fef6ed1b7', N'授权', N'授权', N'glyphicon glyphicon-thumbs-up', N'OnAccredit', N'23', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:24.513')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'79a3ec54-3c07-4204-bfc6-5b1f111474b3', N'刷新', N'刷新', N'glyphicon glyphicon-refresh', N'OnRefresh', N'21', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:51:58.763')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'79a3ec54-3c07-4204-bfc6-5b7f111474b3', N'浏览', N'浏览', N'fa fa-unlink', N'OnBrowse', N'20', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:51:02.440')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7e33c9ec-7573-450b-aa4f-c52771ebdd3c', N'升级', N'升级', N'fa fa-upload', N'OnUpgrade', N'17', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:20.667')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7f6e3c60-4ac5-4c59-a15d-40832b353423', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'OnSave', N'27', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:18.890')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a08fee4b-98c1-4974-be4a-5dbcc0820cbd', N'添加', N'添加', N'glyphicon glyphicon-plus-sign', N'OnCreate', N'1', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-05 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:13:19.600')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a7400cab-6e80-47cd-9cca-e3de79cba1c3', N'成员管理', N'成员管理', N'fa fa-group', N'OnAllotMember', N'31', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:55:57.463')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a7e78077-5c3a-4705-8c58-4c4e696ee201', N'取消', N'取消', N'glyphicon glyphicon-floppy-remove', N'OnCancel', N'28', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:53:49.403')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'b0482c2d-b466-4d05-beb2-45b2bd7981c4', N'帮助', N'帮助', N'glyphicon glyphicon-question-sign', N'OnHelp', N'19', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:50:49.657')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'bc43a78e-2952-4a61-ab1d-e57c2bfa3953', N'详细', N'详细', N'fa fa-newspaper-o', N'OnShowDetail', N'29', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-09 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:54:06.897')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c44ae1e3-8c46-474f-a2a3-517bdf39d68d', N'权限管理', N'权限管理', N'glyphicon glyphicon-tower', N'OnAllotAuthority', N'25', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:54.340')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c9df5a92-ed50-4a8d-9f5c-765b5c15e3bc', N'发送', N'发送', N'glyphicon glyphicon-send', N'OnSend', N'14', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:09.807')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'cd2e937e-7f3a-4823-958b-2acab4711f08', N'举报', N'举报', N'glyphicon glyphicon-phone-alt', N'OnReport', N'16', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:30.160')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'cfa9fe4b-a30c-43fe-b73d-df02516c2e07', N'按钮管理', N'按钮管理', N'fa fa-cogs', N'OnAllotButtons', N'24', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:52:41.293')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd10be9f7-2382-4336-90ed-60193eb80382', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'OnBack', N'15', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:46:18.143')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd6cdbfd6-017b-4639-8c2d-6fb63174b0a5', N'删除', N'删除', N'glyphicon glyphicon-remove-sign', N'OnDelete', N'3', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 16:03:28.180')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd8680d5e-0c3a-41f0-a1d1-dd5152b3014c', N'审核', N'审核', N'glyphicon glyphicon-check', N'OnAudit', N'8', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:45:13.640')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', N'查询', N'查询', N'glyphicon glyphicon-search', N'OnSearch', N'4', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:31.137')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'e7f33901-604c-4a51-b122-e6529066983c', N'导出', N'导出', N'glyphicon glyphicon-export', N'OnExport', N'6', N'工具栏', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-06 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 15:44:50.197')
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
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'首页快捷方式' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'快捷方式名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'导航地址' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'NavigateUrl'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'目标' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Target'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'快捷方式图标' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Image'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'HomeShortcut' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark'
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark]) VALUES (N'40abb9d3-219a-4469-9ce5-40c4eb088b0a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'个人信息', N'/Admin/User/CurrentUser', N'Iframe', N'glyphicon glyphicon-user', N'2', null)
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark]) VALUES (N'970a4af6-ce3e-4424-8e7a-a3184b4e85a5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'数据统计', N'#', N'Iframe', N'fa fa-bar-chart', N'5', null)
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark]) VALUES (N'd3973803-c2bd-4e16-be0d-cd26673ba0dd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'菜单管理', N'/Admin/SystemMenu/Index', N'Iframe', N'fa fa-sitemap', N'1', N'菜单管理页')
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
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'组织机构' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'上级部门编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ParentId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'部门编码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Code'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'部门名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'内部电话号码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'InnerPhone'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'外部电话号码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'OuterPhone'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'部门经理编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Manager'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'部门助理编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'AssistantManager'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'传真' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Fax'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'邮编' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ZipCode'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'地址' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Address'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态(0：删除、1：有效)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Organization' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyDateTime'
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'50578619-6939-4F6D-B421-9176E76ADBC0', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1002', N'财务部', null, null, N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', null, null, null, null, N'2', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:43.513', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:51.693')
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1003', N'互联网金融部', null, null, N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', null, null, null, null, N'3', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:41.870', null, null)
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'1001', N'人力资源部', null, null, N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', null, null, null, null, N'1', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:53:07.437', null, null)
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'0', N'1000', N'武汉星云资本管理有限公司', null, null, N'094f85f8-bc53-4247-979c-09da591d51b0', null, null, N'000000', null, N'1', null, N'1', null, N'2013-04-11 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:10:27.363')
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
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'父角色编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ParentId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色限制' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Restriction'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'允许编辑' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'AllowEdit'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'允许删除' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'AllowDelete'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态(0：删除、1：有效)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'Role' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyDateTime'
GO
INSERT INTO [RBAC].[Role] ([Id], [ParentId], [Name], [Restriction], [AllowEdit], [AllowDelete], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0', N'管理员', null, null, null, N'1', N'管理员所在角色。', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-10 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-08-22 15:52:13.677')
GO
CREATE TABLE [RBAC].[RolePermission]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [RoleId] NVARCHAR(36) NULL ,
  [SystemMenuId] NVARCHAR(36) NULL ,
  [CreateUserId] NVARCHAR(36) NULL ,
  [CreateDateTime] DATETIME NULL
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色权限' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'RoleId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'SystemMenuId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'RolePermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'0414995C-696E-4D16-AED4-BE58F4BA4615', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'04279EB7-2B77-4C53-B1F1-CADA5B55011B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'123d862c-7965-40c1-bd9b-158582f8bb78', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'0C728A41-2ECC-4E1D-BD7F-55B80C1A992D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'0f64f239-188b-498f-894f-6fc6f0a7449d', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'0F936C7D-29AC-4A32-8715-CC510E7D66DA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1201EC0E-71F7-42C6-AC82-15ABA443E93B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'365c5bf3-b266-4271-bde3-4d33b280abc1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'155F9D39-E8AD-497B-987D-AA1F771BF879', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1785DB87-121D-406C-A57C-AEBDF6A6B819', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'62E80369-FE9E-4AAF-97CD-330CDCC3A393', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1797D60D-DF04-44FE-97B9-2AC6A2401A1D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'19ae1d94-e3a0-4e2f-8ed6-d9865a411bae', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1A2AF472-C76D-44F2-B4F9-65A06B873EF7', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'DF7C758E-F021-45A4-A3CE-B870CD343A3D', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1D5F83F6-7C75-4DE2-A36E-96306E65DBB1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'1FD58B2A-38D8-40CD-BB7F-5970BE7A5BE6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2093eb87-1ffd-439c-940f-7b417588245b', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'3885ba7f-c246-493f-9053-7aa70a642662', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'20A1AF09-6E13-4E5D-AA84-F7EA1B3C1C45', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'737a0a1c-d547-441c-a1db-46b79eb12038', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2103870B-8F1F-4572-A4DE-2ECDACD5FDB1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'213DBC3D-D91D-4DD8-94D3-7BD186EF5ADB', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'215A91B3-38E9-4322-8874-9A3A45E7F72E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f4ca7d5c-63cf-471f-9226-d7ce5f298272', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'242740f5-7a68-4051-b338-2b47aaa21f0f', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2540F89C-7252-4164-9B72-DA749E50A29A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'D6991F8E-677B-454F-9B33-E6696636773A', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'26744dde-eea0-434f-8b61-84fd067627a6', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'267CC850-FF71-4287-87A1-F08D00A3AC00', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2C6ED4D3-ED0F-44F7-8589-C4D93EAB8CE7', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'9f0af966-630b-47cd-bb05-a4b3d9c5692d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2d68e4f5-3374-4df9-8de9-a17b2181da3a', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'2E353DA0-B010-48C7-B8BA-ECA3B9644B49', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'3044BF8C-A70F-4C3A-B521-6C15B2B84181', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'30bc5f86-cea2-4072-b96f-cf1f8cbfe057', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'3198893C-7C0D-4F2A-B0EF-720CC478382D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'32E09BAC-88D5-4194-8AB8-D917ED497FBA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'33B3F837-E954-42E2-B259-E823439603DE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'37902EC0-9028-428C-AA5F-DF5A79108EE6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'74a5586b-8ed6-4581-92d6-be1599147684', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'3832C6DE-AE0B-4C25-8119-B1F062DECF97', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'38CFBFCB-F135-4EC6-AFD0-9FE126CAAD83', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ffe5276f-d3af-4af9-b12d-3e969948e8a5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'394F3B28-B5C1-4BEF-B5F3-416BE21954A2', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'cb8601a7-e15e-440a-aee3-5698aeec05c8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'3E811816-F954-445B-B3C3-416F61A60BE4', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0D651E28-A260-43E6-A7BF-522909D96D81', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'3F564DE5-F834-40F0-A31D-09236AE2B420', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'6D94B77D-2793-444D-BDE4-36E59558886C', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'40412647-2236-4EAC-8FF4-13AACD5A085B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'4314A197-BC8C-4BD8-8FE9-8BD70F85C1E6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'43F4889D-7B41-4FAF-BB53-C344F7B22E2F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'4867437B-5853-4E35-BD69-D84A371F110A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'4E613F5D-3F3F-4531-9CDF-2CD090EFE155', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'68427266-1bdd-42c0-bd60-094cba29bfaa', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'51162931-A960-4B53-9965-D91E9F16A508', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'C6804680-1D26-4789-964E-4F0AE673B1F4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'53B937BA-C99C-4F89-A4D4-2EBF23E01DFA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bc011009-243a-4ca4-a52a-1429c92d1867', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'57D1865E-C68D-4FAF-BCFB-9951451BC8F6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'805d0b61-ba00-4b77-b367-a0d309694258', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'5814907D-4E5B-4F2F-8597-01387BF5BEC3', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'5387435A-D258-4C2C-BB23-4A97D17EF177', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'5c048c5c-efaa-4a18-8667-e5d3bd1e3b77', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'bc011009-243a-4ca4-a52a-1429c92d1867', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'5ef25835-91c1-4385-9fb8-27797fc5079d', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'611C003C-60A6-44C5-B122-8BB70CB5B13E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'61D5CF26-5C44-4AF4-A007-C36C6A7041C6', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f367dc71-5918-45fd-a4bf-84c0091f18e7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'63346966-40FF-454A-9080-AEA8DF643857', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'63EE1747-C8BB-4E2B-8838-BB8978DA0879', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'662CCD19-571D-46DE-983C-9742C0734A38', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'66F57970-85D1-43A4-8D52-8037B9FA2253', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8884d6af-28ed-466d-9cb1-1a2d55dd12da', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6834feb1-ad02-4182-a110-3a3b5fa19231', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6897a773-a79f-4154-9d9d-b0db6febca95', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'69060CF1-5829-4449-9F8C-8855C9AB2C68', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6980ADD6-916F-4C17-B52D-93142A097497', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6AE40C0F-C6F7-49C7-8E3A-27899A7285CA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6cfd93b7-af88-4046-9f84-5300715b3d3c', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'805d0b61-ba00-4b77-b367-a0d309694258', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6D363C54-C3E2-42DF-BF5F-FCBC90BE7BC8', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd84d5f23-9220-4ad5-ac66-fef7e303e819', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6D8969BE-695D-4892-83E0-52DF18F223CD', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'6F92433E-98D0-486C-884C-75F02843AEDE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7127C041-1A92-47C4-8490-3076593E582A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'71FFF85A-2DE4-4EEA-881F-4BFAD284139F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'DCACA23C-645A-4D7B-B945-8DA15EBCF214', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'73917dbf-7b5c-4970-9bb5-6ef1da7ccc86', N'18c84947-438c-4987-b556-1c132b1c8be3', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-02-25 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7749AD06-25C2-4EEF-AA13-4343797EDFBA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'd396873e-ec5b-4c44-919a-7d206cd0cc90', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'78DD1E3E-A669-4980-A333-4C59DB500868', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'eb76dd47-c269-4f95-8585-cbd786d489f3', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'793E701D-743E-4E57-86B5-E9DF63FF4CE5', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'df3bb11c-3907-49cf-a091-f9f77b63ed7d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7A02B73C-1D57-4E23-8903-CE996630FF2A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7a066a3b-4eff-49e7-8777-1015114526e5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7B4CD8F1-9C88-4E68-84CD-91C7CCA3BDD3', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'AA6F85E5-E048-4841-AD0B-72AAFCB37524', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7cdb5f1c-1d24-44c8-a07a-c9154ee6155f', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7E3B3614-BA30-492B-9B18-8AD6CE66C773', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'40B4656C-B442-46CE-9B97-B2DD2C38FC2F', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'7E3D4D0B-3160-483B-B4CF-C317D21D9A9E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7c200187-5793-430b-9eeb-eced97f9798b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'832E67DF-CC8F-4252-A0C7-326153EB5C00', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'835858C4-4BB1-43F3-B79F-65E48541DE33', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'89a646cb-fa74-4d0a-bd36-675314eada03', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'04782509-7aa5-446d-b63f-eac068c4c05a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'8B62F0AE-4F50-4FC9-97E0-E97476B07EED', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'8DCC5385-CC64-4406-A4BA-11FC9EE6445E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'8E6C4E18-B14A-4CE6-B738-F58053490419', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'f5e0b9d9-5b99-4649-809e-b326dc012f77', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'930f5da0-4056-4043-992d-3a44d412a149', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'95B95066-4102-4A5D-99F1-BD29035724D8', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'98387c05-def0-4dbb-bde9-9548226efe86', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'9D7A3EB3-7E6C-4F7A-849D-D3DB4B3A6AAD', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b78f59c1-b6fd-465e-837a-857b77547402', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'9E595106-F1F7-4DA2-B873-9B52DD4051EF', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'9EC5CB3E-438B-4DB4-9A90-B6272F6276B9', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'89BDE962-1348-4A4E-9F10-46E37DCA0466', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'a1bcfe0e-19a5-46b4-a2c7-7abd572eae8e', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'a1d14136-ce79-4bab-9f3c-b2dee377efc0', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A408EDE7-A54E-4F91-87FB-71E6CA462729', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2e638140-f718-4879-afeb-2fac02bbce2e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'a413390b-ed04-4d8b-8c53-5aec741c6df5', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A4CED507-4B48-4AF3-9A3F-238B2293673F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A572DAFB-3448-451F-B510-9EAFC4EB7D37', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'49CE8797-0DD0-49AB-8378-ADDD948810C7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A7601862-6FDA-4816-BFA7-70C5E012962A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'3885ba7f-c246-493f-9053-7aa70a642662', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A823E6B1-04DC-4036-9D17-33D3BC228B79', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'269bf251-0579-428d-811a-75be20089161', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A94743C1-CED3-42CA-ADFD-36986397E1D1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'A94B3FD8-95A9-4D97-8CAB-197FDDB6F75D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AA9F8A43-8CDC-4909-BFC6-BA0124954976', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'04782509-7aa5-446d-b63f-eac068c4c05a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AACCC2DC-7553-4BFB-AED7-6CE225128EC4', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AC9947EA-E56A-4D58-B328-4AACEEAAE77C', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AE72637B-9DD4-481B-AAAB-B73136F1A57A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AF810A61-8C60-41AF-AF75-2C79F1B1352E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'b1d87254-b0ef-4a50-b427-ca0484e4516b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'AF9E9115-9C06-47DE-9534-E9EA16D3A3CC', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'E304E93B-EBBA-4C06-A573-58F856F5E0B0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B05A2779-2FC6-454A-A3E0-76E24BF5EC67', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B0845574-B44F-4BFE-BD83-3870ED5DD544', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'b0d9eede-f098-41a9-bb67-01ec717ea453', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B1EA2BC2-6E48-4B79-B1AC-7A3689979D0A', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'fc08d048-2ff8-4948-b1b4-876c561bb8d7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'b2444b0b-e2f9-4a1a-b2cb-678cd5f3aeb1', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'74a5586b-8ed6-4581-92d6-be1599147684', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B2E0C3BE-2A96-4FEF-BBC5-239E6AA8C1A1', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8BB151BA-82C7-4E29-9280-23A182026347', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B3A15000-4A2A-4954-8306-F68C8C320FD5', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B7946A49-4B4B-4DB4-9739-642E1C1926F7', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ed192e6f-9a49-402b-890b-c46da5468023', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'B915DC28-EFCB-4AD5-ABDD-A1BE4ACE1ED4', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'BB991F8F-F197-455E-A565-6E4AEA2FFC2F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'4BEBBCA0-66DB-46E8-A8BA-3389991888D6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C08F9363-30EB-4760-A6A5-16FC01DEC5E0', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C0D505FF-21FA-41A3-9E0B-9FE0C2C2A620', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C3F1D890-7055-470A-AE94-6AAEF7BAC58E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'90bae59c-0eea-49f4-a2be-401da670816e', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C3F7FD72-C6B5-43E1-B13A-6E7D97A5D568', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C741E69C-4440-46B2-BA36-F156A3588B5F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'C934AEC9-0043-412F-912C-7A567B2C8E25', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'CB5F5E6F-F81A-4C6E-9095-ADB6132466EA', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'46331541-77bb-4fcc-9cc0-039ed258048d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'CE556AB2-7468-4AF6-8ADF-A79966BF460D', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'edb10427-401c-4925-96cc-f7df89ad986d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'CF1F5911-9874-4D76-A731-FC34BB43157B', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7A044068-395B-4569-AD29-BB582DF14959', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'D2434C5A-A3EB-4E2D-AD05-914F639F80D7', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'D2D9E363-C01D-4A31-A6B1-AB9D8DD59234', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'41B85D12-882E-409E-B355-5BA0640047AE', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'D98B080B-2594-49D0-B6EA-53614F850288', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'da00cfaa-b4a4-4156-b867-e2f45c35ffcd', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'DB0F55B8-32B2-47CF-A435-735D0936047E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'DC0925C7-8D9A-4FE9-9D12-C2DE1C6E6A18', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'DE59102C-4B37-4C4D-9893-AF189DFC90BC', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'e0312bf1-e793-46b0-b09b-ca3b14f50c90', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'e1ccc750-45be-4050-88ff-3b241015bc11', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'E3D3ECFE-BC9E-4A57-9F7B-CF6A317AB80E', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'2df2974e-f90a-4c4d-baf5-fcd16267d36b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'e489b1a2-1ad6-4921-8c42-b1d014cb8c6f', N'6cc9a788-639a-4c16-940f-da7ee9c9faa6', N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-30 14:15:47.970')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'E5A03827-E6E2-4EEB-AD9E-ED1A464894D3', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'E84A1CF6-0E68-44D6-8BA4-6B99C659C990', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'c546a78a-7f0d-4cd9-a9ed-96548acb8910', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'EA78A24A-3644-415F-B47D-F3D2EB59F0C3', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'da9e5953-154c-4435-beb7-de71b99753f4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'EB75BDCB-9BF8-4109-BDCD-0A3983BADE3F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'EC8DA75C-CC24-457D-9D29-4433F22E14FE', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a1086dca-5677-4107-9a95-9a70259e927d', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'ECA6A9A3-17A7-4A35-9C79-935DCD34A2C2', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'f14612d5-fdbf-4fc6-8d84-de065c7dd011', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'F328B911-9316-4DF3-A25F-4392C827D2A9', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'C4E02B4F-725F-4415-8FAF-BC48BD8267BE', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'f3bd3b24-1ac9-4606-8247-a2114b205b49', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'F75CC8F6-37C7-423D-A75A-91DE7B726199', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'010B7B7D-9FFD-4C5B-A2EF-502AF100C193', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'f8309680-1ad5-4dd1-b2f3-32727d78c3f7', N'91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'F8F81728-6D10-4C7A-9C01-88E413A64A11', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'0b85d430-9ec6-4c93-97bb-d1b9fe2af289', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'F90951ED-507A-43CD-ADA7-CAC9E320DF79', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'FB3603AF-8B85-4E22-940D-847975934112', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime]) VALUES (N'FCE45DAC-E248-4648-8D69-3C001F711A5F', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:31.950')
GO
CREATE TABLE [RBAC].[StaffOrganize]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [UserId] NVARCHAR(36) NULL ,
  [OrganizationId] NVARCHAR(36) NULL ,
  [CreateUserId] NVARCHAR(36) NULL ,
  [CreateDateTime] DATETIME NULL
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'人员组织机构' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'部门编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize' ,
    @level2type = 'COLUMN' ,
    @level2name = N'OrganizationId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'StaffOrganize' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'18F69D98-EEB9-4AC9-9F5B-9E227637FC2D', N'452865b1d31c', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:59.633')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'20C1BC2C-8C8F-4AF6-BA02-63BFB149AD63', N'48f3889c-af8d-401f-ada2-c383031af92d', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:23.533')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'231BE6C8-EE3B-47CA-82F6-14AD9280C82E', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:33.120')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'48676584-3DC0-4391-B9BD-49424D048F92', N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:44.950')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'4AD9AF58-9865-4FF6-9CB8-152A25AFB783', N'568ffebf-a4ea-44c4-80e1-206d39564cd1', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:04.950')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'62E03D13-7CE1-4C99-BB75-FC0C10541331', N'0775cb7b-e973-4070-9633-f909ada925f8', N'5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:45:58.107')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'6ADB2F3C-2A50-463F-8A87-8B6BE83F0D29', N'094f85f8-bc53-4247-979c-09da591d51b0', N'77B51251-0D00-45F9-A39F-8B853E8F812D', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:44:58.630')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'ddbe38af-3cd3-4115-a318-47d56f7d7c81', N'630ecf4b-24b8-4f93-8ca0-2e08f618dae1', N'ebcea0bb-232a-494b-996e-4eb5aa59d1af', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-16 00:00:00.000')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime]) VALUES (N'E34B6062-B663-4266-98F1-74EFA1979377', N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', N'50578619-6939-4F6D-B421-9176E76ADBC0', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:03.937')
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
  [Sort] INT NULL ,
  [Status] INT NULL ,
  [CreateUserId] NVARCHAR(36) NULL ,
  [CreateDateTime] DATETIME NULL ,
  [ModifyUserId] NVARCHAR(36) NULL ,
  [ModifyDateTime] DATETIME NULL
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单导航' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'主键' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'父节点主键' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ParentId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单名称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'标题' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Title'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单图标' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Image'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单分类' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Category'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'导航地址' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'NavigateUrl'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'目标' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Target'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'排序码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sort'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态(0：删除、1：有效)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'SystemMenu' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyDateTime'
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'010B7B7D-9FFD-4C5B-A2EF-502AF100C193', N'0', N'后台', N'后台', null, N'2', N'/Home/Index', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:16:55.330', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:19:43.670')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'02b48102-4e8a-44fb-84a0-7a8c8535676a', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'查看角色权限', N'查看角色权限', null, N'2', N'/Admin/Role/ViewPermissions', N'href', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:46:35.587')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'04782509-7aa5-446d-b63f-eac068c4c05a', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'个人信息', N'个人信息', N'387.png', N'1', N'/Admin/User/CurrentUser', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-06 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit()', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'0D651E28-A260-43E6-A7BF-522909D96D81', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'数据显示页', N'数据显示页', null, N'2', N'/DynamicPage/Dynamic/Index', N'Iframe', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:33:16.593', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'0e35988d-b4a3-4835-a872-d0a32dbcfb5e', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'add', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:09.633', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'123d862c-7965-40c1-bd9b-158582f8bb78', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'权限管理', N'权限管理', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:32.323', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', N'010B7B7D-9FFD-4C5B-A2EF-502AF100C193', N'工作台', N'工作台', null, N'2', N'/Home/Workstation', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:18:20.550', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:19.300', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'269bf251-0579-428d-811a-75be20089161', N'3885ba7f-c246-493f-9053-7aa70a642662', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 16:53:44.600')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'添加', N'添加', N'add.png', N'3', N'add()', N'Onclick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:36:37.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2df2974e-f90a-4c4d-baf5-fcd16267d36b', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:38.433', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:12:48.897')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2e638140-f718-4879-afeb-2fac02bbce2e', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:33.670', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:28.640')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'2fad3cba-f410-41c1-9b6c-5b50739f7bc9', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete()', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:45:01.940', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'添加或修改字典分类', N'添加或修改字典分类', null, N'2', N'/Admin/Dictionary/CreateOrUpdateCategory', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:31:15.463', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'35bf2cc9-a986-4f5d-816c-87fdb062c0b9', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'365c5bf3-b266-4271-bde3-4d33b280abc1', N'3885ba7f-c246-493f-9053-7aa70a642662', N'按钮管理', N'按钮管理', N'fa fa-cogs', N'3', N'OnAllotButtons', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 16:53:44.600')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'3885ba7f-c246-493f-9053-7aa70a642662', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'菜单导航', N'菜单导航', N'sitemap.png', N'1', N'/Admin/SystemMenu/Index', N'Iframe', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:16.167')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'3e544d7a-d850-4785-9648-feafc4698a3b', N'0', N'权限管理', N'权限管理', N'fa fa-key', N'1', null, N'Iframe', N'500', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-31 13:38:33.917')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'首页快捷方式', N'首页快捷方式', N'637.png', N'1', N'/Admin/HomeShortcut/Index', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'40B4656C-B442-46CE-9B97-B2DD2C38FC2F', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/WebApi/User/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:45:35.117', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'41B85D12-882E-409E-B355-5BA0640047AE', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/Admin/User/CreateOrUpdate', N'Iframe', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:41:13.570', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:42:32.547')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'分配成员', N'分配成员', null, N'2', N'/WebApi/Role/AllotMembers', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:46:40.757', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:55:21.677')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'46331541-77bb-4fcc-9cc0-039ed258048d', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:28:03.823', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.790')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'49CE8797-0DD0-49AB-8378-ADDD948810C7', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'3', N'OnBack', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:46:08.443', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'4BEBBCA0-66DB-46E8-A8BA-3389991888D6', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'分配角色成员', N'分配角色成员', null, N'2', N'/Admin/Role/AllotMembers', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:48:17.883', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:11.247', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'5387435A-D258-4C2C-BB23-4A97D17EF177', N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'查看日志', N'查看日志', null, N'2', N'/Admin/Logger/ViewDetails', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:36:37.177', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'545d2450-4dac-4377-afbe-d9aa451f795f', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'角色管理', N'角色管理', N'20130508035646751_easyicon_net_32.png', N'1', N'/Admin/Role/Index', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:51.403')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'0', N'系统管理', N'系统管理', N'glyphicon glyphicon-cog', N'1', null, N'Iframe', N'700', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-18 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:29:30.627')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'分配权限', N'分配权限', null, N'2', N'/Admin/User/AllotPermissions', N'Iframe', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:45:17.560', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:41:46.210')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'字典管理', N'字典管理', N'4999_credit.png', N'1', N'/Admin/Dictionary/Index', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:55:30.773')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'5c5077f0-7703-4fee-927a-b765e1edf900', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'系统个性化', N'系统个性化', N'581.png', N'1', N'/RMBase/SysPersonal/Individuation_Set.aspx', N'Iframe', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-06 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'操作按钮', N'操作按钮', N'567.png', N'1', N'/Admin/Button/Index', N'Iframe', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-03-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-28 14:07:34.143')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'62E80369-FE9E-4AAF-97CD-330CDCC3A393', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'列注释管理', N'列注释管理', null, N'2', N'/DynamicPage/Configuration/ShowColumns', N'Iframe', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:32:45.813', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'68427266-1bdd-42c0-bd60-094cba29bfaa', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:33.757', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'角色管理', N'角色管理', null, N'1', N'/WebApi/Role/Index', N'Iframe', N'20', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:34:54.430', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'6D94B77D-2793-444D-BDE4-36E59558886C', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/Admin/Role/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:47:30.870', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:41:44.607')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/WebApi/Role/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:54:40.350', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'737a0a1c-d547-441c-a1db-46b79eb12038', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'成员管理', N'成员管理', N'fa fa-group', N'3', N'OnAllotMember', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:15.597', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'74a5586b-8ed6-4581-92d6-be1599147684', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-30 11:45:00.610', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'系统设置', N'系统设置', N'4968_config.png', N'1', N'/Admin/SystemSetting/Index', N'Iframe', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:56:15.510')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'77508b76-d17c-4c08-bd9b-cf2d6ce832c6', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'编辑', N'编辑', N'edit.png', N'3', N'edit()', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7961fd3c-6f0e-496c-a656-772742e14d5a', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'授权', N'授权', N'glyphicon glyphicon-thumbs-up', N'3', N'OnAccredit', N'Onclick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.753')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7A044068-395B-4569-AD29-BB582DF14959', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'添加或修改信息', N'添加或修改信息', null, N'2', N'/DynamicPage/ExtensionProperty/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:36:55.290', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:43:38.197')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7c200187-5793-430b-9eeb-eced97f9798b', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:40.787', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7dcdf6fd-346a-4e4c-ba29-dcddac52f417', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'OnCreate', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:05.210', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.960')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'0', N'动态页', N'动态页', N'fa fa-bolt', N'1', N'#', N'Iframe', N'100', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-26 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-07-31 13:38:07.233')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'805d0b61-ba00-4b77-b367-a0d309694258', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'保存', N'保存', N'disk.png', N'3', N'SaveForm()', N'Onclick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'810a72f0-55d3-468f-8653-10d1b06a4234', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'分配角色权限', N'分配角色权限', null, N'2', N'/Admin/Role/AllotPermissions', N'href', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-12 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:47:49.667')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'删除', N'删除', N'delete.png', N'3', N'Delete()', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'数据管理', N'数据管理', N'glyphicon glyphicon-random', N'1', N'/DynamicPage/Configuration/Index', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-31 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:18:41.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8884d6af-28ed-466d-9cb1-1a2d55dd12da', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:08.147', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'89BDE962-1348-4A4E-9F10-46E37DCA0466', N'5894638F-82FD-42E1-97B9-E3F7320A8C5C', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'3', N'OnSave', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-25 12:46:06.413', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8BB151BA-82C7-4E29-9280-23A182026347', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'查看权限', N'查看权限', null, N'2', N'/WebApi/Role/ViewPermissions', N'Iframe', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:48:18.427', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:54:55.313')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8cf9b35c-415e-4906-aa66-4b9f7e2804ac', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'刷新', N'刷新', N'glyphicon glyphicon-refresh', N'3', N'OnRefresh', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:38.483', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:28.637')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'返回', N'返回', N'glyphicon glyphicon-chevron-left', N'3', N'OnBack', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:47.457', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8f82b5f3-6185-4296-bef6-52eed4e29a94', N'/Admin/SystemMenu/AllotButton', N'查询', N'查询', N'zoom.png', N'3', N'search()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-14 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'用户管理', N'用户管理', N'userregedit.png', N'1', N'/Admin/User/Index', N'Iframe', N'15', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:24:24.580')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'90bae59c-0eea-49f4-a2be-401da670816e', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'编辑', N'编辑', N'glyphicon glyphicon-pencil', N'3', N'edit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:17.710', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', N'04782509-7aa5-446d-b63f-eac068c4c05a', N'修改密码', N'修改密码', null, N'2', N'/Admin/User/ChangePassword', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:39:30.303', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'7dfdf495-83fe-4194-a042-35fe28c2e36b', N'动态属性', N'动态属性', null, N'1', N'/DynamicPage/ExtensionProperty/Index', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:19:32.313', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:12.410')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'963f06f5-c1c3-4346-8b0f-7abe22ddeed7', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:37.453', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'添加或修改字典', N'添加或修改字典', null, N'2', N'/Admin/Dictionary/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:30:24.867', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:30:56.607')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'9f0af966-630b-47cd-bb05-a4b3d9c5692d', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'添加', N'添加', N'add.png', N'3', N'add()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a1086dca-5677-4107-9a95-9a70259e927d', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'授权', N'授权', N'glyphicon glyphicon-thumbs-up', N'3', N'OnAccredit', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 14:21:56.453', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a3959557-b2ab-4fbc-8942-f72c52dfe972', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'Onclick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.753')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'资源管理', N'资源管理', N'625.png', N'1', N'/Admin/Globalization/Index', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-28 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:55:37.207')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'a63a0ca2-f2a7-4d27-bffa-67e548513df1', N'0', N'个人信息', N'个人信息', N'glyphicon glyphicon-user', N'1', null, N'Iframe', N'300', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-29 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 12:56:49.890')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'AA6F85E5-E048-4841-AD0B-72AAFCB37524', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'查看数据详情', N'查看数据详情', null, N'2', N'/DynamicPage/Dynamic/ViewDetail', N'Iframe', N'6', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:34:22.630', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'aacb438d-bafd-4288-874a-1sae6e8ed4e7', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', N'三级页面', N'三级菜单页面', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/Admin/HomeShortcut/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:38:33.647', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:43:15.147')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', N'9606167a-fd94-4ad6-88b8-1b419dc3410e', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-15 10:22:36.630', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'b1d87254-b0ef-4a50-b427-ca0484e4516b', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'add', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 14:03:16.443', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'查询配置', N'查询配置', null, N'2', N'/DynamicPage/Configuration/ShowSearchConfig', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:30:58.940', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'保存', N'保存', N'glyphicon glyphicon-floppy-save', N'3', N'OnSave', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:43.617', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'b78f59c1-b6fd-465e-837a-857b77547402', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'详细', N'详细', N'glyphicon glyphicon-list-alt', N'3', N'OnShowDetail', N'OnClick', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-23 14:31:35.430', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N' 用户列表', N' 用户列表', null, N'2', N'/Admin/User/Users', N'href', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-16 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:40:27.797')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'bc011009-243a-4ca4-a52a-1429c92d1867', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'Onclick', N'7', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.800')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'路由规则', N'路由规则', null, N'1', N'/WebApi/Route/Index', N'Iframe', N'30', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:06.567', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:30:59.983')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'3885ba7f-c246-493f-9053-7aa70a642662', N'添加或编辑信息', N'添加或编辑信息', N'153.png', N'2', N'/Admin/SystemMenu/CreateOrUpdate', N'Open', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:50:16.170')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'add()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c191de03-6b68-4e9e-8c5e-ff17aeca341d', N'810a72f0-55d3-468f-8653-10d1b06a4234', N'返回', N'返回', N'back.png', N'3', N'back()', N'Onclick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-13 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c2947a69-fc79-4861-92ea-87361d8b5715', N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'用户管理', N'用户管理', N'glyphicon glyphicon-user', N'1', N'/WebApi/User/Index', N'Iframe', N'10', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:45:51.693', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'C4E02B4F-725F-4415-8FAF-BC48BD8267BE', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'添加或编辑数据', N'添加或编辑数据', null, N'2', N'/DynamicPage/Dynamic/CreateOrUpdate', N'Iframe', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:33:50.610', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c546a78a-7f0d-4cd9-a9ed-96548acb8910', N'3885ba7f-c246-493f-9053-7aa70a642662', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 16:53:44.700')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'C6804680-1D26-4789-964E-4F0AE673B1F4', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'添加或编辑全局资源', N'添加或编辑全局资源', null, N'2', N'/Admin/Globalization/CreateOrUpdateGlobalResource', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:34:33.783', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'分配权限', N'分配权限', null, N'2', N'/WebApi/Role/AllotPermissions', N'Iframe', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:29:28.603', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:55:09.747')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'cc91e8f6-b7ff-4c73-b934-302ad3398922', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'锁定', N'锁定', N'glyphicon glyphicon-lock', N'3', N'OnLock', N'Onclick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-17 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.767')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'0', N'组织机构', N'组织机构', N'glyphicon glyphicon-pawn', N'1', null, N'Iframe', N'400', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:23:45.403', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd396873e-ec5b-4c44-919a-7d206cd0cc90', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'添加', N'添加', N'add.png', N'3', N'add()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'添加或编辑视图资源', N'添加或编辑视图资源', null, N'2', N'/Admin/Globalization/CreateOrUpdateLocalResource', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:33:53.993', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'D6991F8E-677B-454F-9B33-E6696636773A', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'添加或修改信息', N'添加或修改信息', null, N'2', N'/Admin/Organization/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:44:56.750', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:42:49.417')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N' 所属部门', N' 所属部门', null, N'2', N'/Admin/User/Departments', N'href', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-16 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:40:18.190')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'd84d5f23-9220-4ad5-ac66-fef7e303e819', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'da9e5953-154c-4435-beb7-de71b99753f4', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete()', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'DCACA23C-645A-4D7B-B945-8DA15EBCF214', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/WebApi/Route/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:47:24.443', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'df3bb11c-3907-49cf-a091-f9f77b63ed7d', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:06.770', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.960')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'DF7C758E-F021-45A4-A3CE-B870CD343A3D', N'5c5ce6bd-44dc-4903-b1f8-a510ce332c76', N'添加或编辑信息', N'添加或编辑信息', null, N'2', N'/Admin/Button/CreateOrUpdate', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:15:39.403', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'查看权限详情', N'查看权限详情', null, N'2', N'/Admin/User/ViewPermissions', N'Iframe', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:42:27.370', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:35:18.650')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'E304E93B-EBBA-4C06-A573-58F856F5E0B0', N'87b0202d-d6bd-4179-86e7-b1121ddfd0d7', N'添加或编辑数据', N'添加或编辑数据', null, N'2', N'/DynamicPage/Configuration/ShowCreateOrUpdateConfig', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:32:01.810', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', N'010B7B7D-9FFD-4C5B-A2EF-502AF100C193', N'查看日志', N'查看日志', null, N'2', N'/OperationRecord/Index', N'Iframe', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:57:21.893', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'e620450b-6d17-4192-bee0-66fbd114e82a', N'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', N'部门管理', N'部门管理', N'20130508035912738_easyicon_net_32.png', N'1', N'/Admin/Organization/Index', N'Iframe', N'20', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-29 10:24:40.383')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', N'3e544d7a-d850-4785-9648-feafc4698a3b', N'WebApi权限管理', N'WebApi权限管理', N'glyphicon glyphicon-cloud', N'1', N'#', N'Iframe', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:45:01.633', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:55:43.220')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'eb76dd47-c269-4f95-8585-cbd786d489f3', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'锁定', N'锁定', N'glyphicon glyphicon-lock', N'3', N'OnLock', N'OnClick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 14:22:06.170', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'ed192e6f-9a49-402b-890b-c46da5468023', N'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'Delete', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-03-12 11:43:12.433', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'edb10427-401c-4925-96cc-f7df89ad986d', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:34.143', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:28.643')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', N'55ef2c2f-0642-4448-b7f8-0351f4e00ea1', N'日志管理', N'日志管理', N'4937_administrative-docs.png', N'1', N'/Admin/Logger/Index', N'Iframe', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-04-18 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-01-29 18:00:20.877')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'eecb438d-bafd-4288-874a-1sae6e8ed4e7', N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7', N'四级页面', N'五级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'eecb438d-bafd-4288-874a-1sbe6e8ed4e7', N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7', N'四级菜单设置', N'四级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'eecb438d-bafd-4288-874a-3sbe6e8ed4e7', N'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', N'三级菜单设置', N'三级菜单设置', N'576.png', N'1', N'/RMBase/SysDataCenter/DataCenter_Index.aspx', N'Iframe', N'12', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-21 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-05-02 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', N'3885ba7f-c246-493f-9053-7aa70a642662', N'分配按钮', N'分配按钮', null, N'2', N'/Admin/SystemMenu/AllotButtons', N'Open', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-08 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 13:51:15.330')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'f367dc71-5918-45fd-a4bf-84c0091f18e7', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'权限管理', N'权限管理', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:36:07.830', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'f4ca7d5c-63cf-471f-9226-d7ce5f298272', N'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', N'删除', N'删除', N'glyphicon glyphicon-remove', N'3', N'OnDelete', N'OnClick', N'4', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-01-13 09:28:35.240', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:28.647')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'查看缓存', N'查看缓存', null, N'2', N'/Admin/SystemSetting/ShowCaches', N'Iframe', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:41:11.800', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-13 14:41:22.213')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'f5e0b9d9-5b99-4649-809e-b326dc012f77', N'6a8044e3-d6ae-406c-a281-5e4d3ba44f67', N'成员管理', N'成员管理', N'fa fa-group', N'3', N'OnAllotMember', N'OnClick', N'3', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-04 15:35:55.767', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', N'c2947a69-fc79-4861-92ea-87361d8b5715', N'编辑', N'编辑', N'glyphicon glyphicon-edit', N'3', N'OnEdit', N'OnClick', N'2', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2015-08-03 13:46:39.597', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'fc08d048-2ff8-4948-b1b4-876c561bb8d7', N'3885ba7f-c246-493f-9053-7aa70a642662', N'添加', N'添加', N'add.png', N'3', N'add()', N'OnClick', N'1', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-05-04 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'fc85f7df-b8d8-4e12-a2c1-00606d290a95', N'40178207-f2f2-44de-95bc-b5b4beb69e49', N'添加', N'添加', N'glyphicon glyphicon-plus', N'3', N'add()', N'OnClick', null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2014-12-24 00:00:00.000', null, null)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'ffe5276f-d3af-4af9-b12d-3e969948e8a5', N'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', N'权限管理', N'权限管理', N'glyphicon glyphicon-tower', N'3', N'OnAllotAuthority', N'OnClick', N'5', N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-24 16:27:59.900', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 09:11:59.777')
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
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'汇报者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Reporter'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户编码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Code'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'登录账号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Account'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'登录密码' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Password'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户名' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Name'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'性别(0：女、1：男)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Sex'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'职称' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Title'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'电子邮件' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Email'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'主题' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Theme'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'找回密码的问题' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Question'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'找回密码的答案' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Answer'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'备注' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Remark'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'状态(0：删除、1：启用、2：停用)' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Status'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'修改时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'User' ,
    @level2type = 'COLUMN' ,
    @level2name = N'ModifyDateTime'
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'0775cb7b-e973-4070-9633-f909ada925f8', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'10034', N'jiatingl', N'WQJmhpXELQNReG2YoX0Dqw==', N'雷佳婷', N'0', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:45:58.900', null, null)
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'094f85f8-bc53-4247-979c-09da591d51b0', null, N'10001', N'xingm', N'0EAlVCBMJDOcVR3De5x49A==', N'明星', N'1', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:44:58.627')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'094f85f8-bc53-4247-979c-09da591d51b0', N'10031', N'bop', N'0EAlVCBMJDOcVR3De5x49A==', N'彭博', N'1', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:56:33.120')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'452865b1d31c', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'10033', N'xiaohu', N'0EAlVCBMJDOcVR3De5x49A==', N'汪小虎', N'1', null, N'xiaohuw@flyme.com', null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2000-01-04 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:59.620')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'48f3889c-af8d-401f-ada2-c383031af92d', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'10032', N'system', N'0EAlVCBMJDOcVR3De5x49A==', N'张枫林', N'1', N'软件工程师', N'fenglinz@koteiinfo.com', null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:23.533')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'4baa8438-930f-4b02-8fc1-d67bd43d2fb0', N'094f85f8-bc53-4247-979c-09da591d51b0', N'10011', N'sund', N'uenzh5eB73Y/SMSfk0PPvw==', N'杜顺', N'1', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:44.950')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'568ffebf-a4ea-44c4-80e1-206d39564cd1', N'23e714a9-33c6-49bb-be10-0fd455b5f0ad', N'10035', N'yanlingc', N'Qq79ohRP/2f3pbLk5PGE0A==', N'陈艳玲', N'0', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:56:44.730', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:04.947')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime]) VALUES (N'75e1f7a2-74ab-4d21-af74-a601f30f02ee', N'094f85f8-bc53-4247-979c-09da591d51b0', N'10021', N'zhileih', N'0EAlVCBMJDOcVR3De5x49A==', N'何志磊', N'1', null, null, null, null, null, null, N'1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2013-04-02 00:00:00.000', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-03-30 11:55:03.913')
GO
CREATE TABLE [RBAC].[UserPermission]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [UserId] NVARCHAR(36) NULL ,
  [SystemMenuId] NVARCHAR(36) NULL ,
  [CreateUserId] NVARCHAR(36) NULL ,
  [CreateDateTime] DATETIME NULL
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户权限' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'菜单编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'SystemMenuId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserPermission' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
CREATE TABLE [RBAC].[UserRole]
(
  [Id] NVARCHAR(36) NOT NULL ,
  [UserId] NVARCHAR(36) NULL ,
  [RoleId] NVARCHAR(36) NULL ,
  [CreateUserId] NVARCHAR(36) NULL ,
  [CreateDateTime] DATETIME NULL
)
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户角色关系' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole' ,
    @level2type = 'COLUMN' ,
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'用户编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole' ,
    @level2type = 'COLUMN' ,
    @level2name = N'UserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'角色编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole' ,
    @level2type = 'COLUMN' ,
    @level2name = N'RoleId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建者编号' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateUserId'
GO
EXEC sp_addextendedproperty
    @name = N'MS_Description' ,
    @value = N'创建时间' ,
    @level0type = 'SCHEMA' ,
    @level0name = N'RBAC' ,
    @level1type = 'TABLE' ,
    @level1name = N'UserRole' ,
    @level2type = 'COLUMN' ,
    @level2name = N'CreateDateTime'
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime]) VALUES (N'4F2B1E60-83C4-42D3-8BD2-9F33382276D8', N'48f3889c-af8d-401f-ada2-c383031af92d', N'd0533453-9cf8-459c-b28c-98cf397efaf1', N'48f3889c-af8d-401f-ada2-c383031af92d', N'2016-04-14 10:57:23.537')
GO
ALTER TABLE [RBAC].[Button] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[HomeShortcut] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[Organization] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[Role] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[RolePermission] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[StaffOrganize] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[SystemMenu] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[User] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[UserPermission] ADD PRIMARY KEY ([Id])
GO
ALTER TABLE [RBAC].[UserRole] ADD PRIMARY KEY ([Id])
GO