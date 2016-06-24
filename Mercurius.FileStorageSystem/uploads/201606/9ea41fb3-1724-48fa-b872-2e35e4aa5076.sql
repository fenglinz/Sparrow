/*
Navicat SQL Server Data Transfer

Source Server         : Saprrow
Source Server Version : 110000
Source Host           : .:1433
Source Database       : Sparrow
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2016-06-24 12:14:14
*/


-- ----------------------------
-- Table structure for Dictionary
-- ----------------------------
DROP TABLE [dbo].[Dictionary]
GO
CREATE TABLE [dbo].[Dictionary] (
[Id] nvarchar(36) NOT NULL ,
[Type] int NULL ,
[Key] nvarchar(400) NULL ,
[Value] nvarchar(400) NULL ,
[ParentId] nvarchar(72) NULL ,
[Sort] int NULL ,
[Status] int NULL ,
[Remark] nvarchar(500) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字典信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字典信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Key')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Key'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Key'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Value')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Value'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Value'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Sort')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Sort'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Sort'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Dictionary', 
'COLUMN', N'Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Dictionary'
, @level2type = 'COLUMN', @level2name = N'Remark'
GO

-- ----------------------------
-- Table structure for FileStorage
-- ----------------------------
DROP TABLE [dbo].[FileStorage]
GO
CREATE TABLE [dbo].[FileStorage] (
[Id] int NOT NULL IDENTITY(1,1) ,
[FileName] nvarchar(1000) NOT NULL ,
[ContentType] nvarchar(250) NOT NULL ,
[FileSize] int NULL ,
[Description] nvarchar(250) NULL ,
[SaveAsPath] nvarchar(1000) NULL ,
[ScanStatus] int NULL ,
[UploadUserId] nvarchar(36) NULL ,
[UploadDateTime] datetime NOT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传文件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传文件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'FileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'FileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'FileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'ContentType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件MIME类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'ContentType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件MIME类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'ContentType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'FileSize')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'FileSize'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件大小'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'FileSize'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'Description')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'Description'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'Description'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'SaveAsPath')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'文件保存路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'SaveAsPath'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'文件保存路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'SaveAsPath'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'ScanStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'扫描标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'ScanStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'扫描标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'ScanStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'UploadUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'UploadUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'UploadUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'FileStorage', 
'COLUMN', N'UploadDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'UploadDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'FileStorage'
, @level2type = 'COLUMN', @level2name = N'UploadDateTime'
GO

-- ----------------------------
-- Table structure for Globalization
-- ----------------------------
DROP TABLE [dbo].[Globalization]
GO
CREATE TABLE [dbo].[Globalization] (
[Id] nvarchar(36) NOT NULL ,
[Culture] nvarchar(20) NULL ,
[Area] nvarchar(400) NULL ,
[Controller] nvarchar(400) NULL ,
[ViewName] nvarchar(400) NULL ,
[Key] nvarchar(400) NULL ,
[Value] nvarchar(400) NULL ,
[Remark] nvarchar(500) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'国际化信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'国际化信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Culture')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'区域语言'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Culture'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'区域语言'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Culture'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Area')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'区域'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Area'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'区域'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Area'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Controller')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'控制器'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Controller'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'控制器'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Controller'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'ViewName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'视图名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'ViewName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'视图名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'ViewName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Key')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Key'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Key'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Value')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Value'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Value'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Globalization', 
'COLUMN', N'Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Globalization'
, @level2type = 'COLUMN', @level2name = N'Remark'
GO

-- ----------------------------
-- Table structure for News
-- ----------------------------
DROP TABLE [dbo].[News]
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
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'新闻'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'新闻'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Category')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Category'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Category'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Title')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Title'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标题'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Title'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Attachments')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Attachments'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Attachments'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'Status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态(1：待审核，2：已发布，4：已删除)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态(1：待审核，2：已发布，4：已删除)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'Status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'BrowseTimes')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'浏览次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'BrowseTimes'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'浏览次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'BrowseTimes'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'PublisherId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发布者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'PublisherId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发布者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'PublisherId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'News', 
'COLUMN', N'PublishDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发布时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'PublishDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发布时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'News'
, @level2type = 'COLUMN', @level2name = N'PublishDateTime'
GO

-- ----------------------------
-- Table structure for NewsComment
-- ----------------------------
DROP TABLE [dbo].[NewsComment]
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
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'新闻评论'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'新闻评论'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'NewsId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'新闻编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'NewsId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'新闻编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'NewsId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'ReplyCommentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'评论编号(回复评论)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'ReplyCommentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'评论编号(回复评论)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'ReplyCommentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'Content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'Status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态(1：代审核，2：审核通过、4：审核失败)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态(1：代审核，2：审核通过、4：审核失败)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'Status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'LikePoints')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'点赞次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'LikePoints'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'点赞次数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'LikePoints'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'CommentUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'评论者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'CommentUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'评论者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'CommentUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'NewsComment', 
'COLUMN', N'CommentDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'评论时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'CommentDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'评论时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'NewsComment'
, @level2type = 'COLUMN', @level2name = N'CommentDateTime'
GO

-- ----------------------------
-- Table structure for OperationRecord
-- ----------------------------
DROP TABLE [dbo].[OperationRecord]
GO
CREATE TABLE [dbo].[OperationRecord] (
[Id] int NOT NULL IDENTITY(1,1) ,
[BusinessCategory] nvarchar(250) NULL ,
[BusinessSerialNumber] nvarchar(250) NULL ,
[Content] nvarchar(MAX) NULL ,
[LogOnIPAddress] nvarchar(50) NULL ,
[AddedUserId] nvarchar(36) NULL ,
[AddedDateTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'操作记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'操作记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'BusinessCategory')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'BusinessCategory'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'BusinessCategory'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'BusinessSerialNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务流水号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'BusinessSerialNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务流水号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'BusinessSerialNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'Content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'Content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'Content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'LogOnIPAddress')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'LogOnIPAddress'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'LogOnIPAddress'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'AddedUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'AddedUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'AddedUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'OperationRecord', 
'COLUMN', N'AddedDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'AddedDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'OperationRecord'
, @level2type = 'COLUMN', @level2name = N'AddedDateTime'
GO

-- ----------------------------
-- Table structure for SystemLog
-- ----------------------------
DROP TABLE [dbo].[SystemLog]
GO
CREATE TABLE [dbo].[SystemLog] (
[Id] nvarchar(36) NOT NULL ,
[LogOnId] nvarchar(36) NULL ,
[LogOnIP] nvarchar(100) NULL ,
[ModelName] nvarchar(200) NULL ,
[Summary] nvarchar(500) NULL ,
[Details] ntext NULL ,
[LogLevel] nvarchar(100) NULL ,
[OccurrenceDateTime] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'LogOnId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogOnId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录者编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogOnId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'LogOnIP')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'登录者IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogOnIP'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'登录者IP地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogOnIP'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'ModelName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'ModelName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'ModelName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'Summary')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志简介'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Summary'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志简介'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Summary'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'Details')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志详情'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Details'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志详情'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'Details'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'LogLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日志级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日志级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'LogLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemLog', 
'COLUMN', N'OccurrenceDateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'OccurrenceDateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemLog'
, @level2type = 'COLUMN', @level2name = N'OccurrenceDateTime'
GO

-- ----------------------------
-- Table structure for SystemSetting
-- ----------------------------
DROP TABLE [dbo].[SystemSetting]
GO
CREATE TABLE [dbo].[SystemSetting] (
[Id] nvarchar(36) NOT NULL ,
[ParentId] nvarchar(200) NULL ,
[Name] nvarchar(200) NULL ,
[Value] nvarchar(500) NULL ,
[Remark] nvarchar(500) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统设置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统设置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
'COLUMN', N'Id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
'COLUMN', N'ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
'COLUMN', N'Name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
'COLUMN', N'Value')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Value'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Value'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SystemSetting', 
'COLUMN', N'Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SystemSetting'
, @level2type = 'COLUMN', @level2name = N'Remark'
GO

-- ----------------------------
-- Indexes structure for table Dictionary
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Dictionary
-- ----------------------------
ALTER TABLE [dbo].[Dictionary] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table FileStorage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table FileStorage
-- ----------------------------
ALTER TABLE [dbo].[FileStorage] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table Globalization
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Globalization
-- ----------------------------
ALTER TABLE [dbo].[Globalization] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table News
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table News
-- ----------------------------
ALTER TABLE [dbo].[News] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table NewsComment
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table NewsComment
-- ----------------------------
ALTER TABLE [dbo].[NewsComment] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table OperationRecord
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table OperationRecord
-- ----------------------------
ALTER TABLE [dbo].[OperationRecord] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table SystemLog
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SystemLog
-- ----------------------------
ALTER TABLE [dbo].[SystemLog] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Indexes structure for table SystemSetting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SystemSetting
-- ----------------------------
ALTER TABLE [dbo].[SystemSetting] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Uniques structure for table SystemSetting
-- ----------------------------
ALTER TABLE [dbo].[SystemSetting] ADD UNIQUE ([ParentId] ASC, [Name] ASC)
GO
