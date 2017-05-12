INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('2771adf2-1dd4-4a0e-ad09-fa186631b8ea', NULL, '省内新闻', '省内新闻', 'b94628af-32a2-47cb-9f01-33e0843d0a91', 1, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('2fbadbb1-dbb1-4534-af6f-b68983ee47aa', NULL, '错误', 'Error', 'f871b534-81ec-4f73-a2cc-e2dac035584c', 4, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('3882599d-2d3d-45f0-af84-f911d390df9b', NULL, '信息', 'Info', 'f871b534-81ec-4f73-a2cc-e2dac035584c', 2, 1, '')
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('540c76b1-d4b2-47d6-b8ef-1fff76d60067', NULL, '调试', 'Debug', 'f871b534-81ec-4f73-a2cc-e2dac035584c', 1, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('63ed1ebc-f24d-460a-9d76-a73d4cf09330', NULL, '记录', 'Record', 'f871b534-81ec-4f73-a2cc-e2dac035584c', 5, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('876fd86f-7df7-47c0-bcdf-984e961ffbf1', NULL, '国内新闻', '国内新闻', 'b94628af-32a2-47cb-9f01-33e0843d0a91', 2, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('92bac52f-324c-4d70-a083-5f6919bdafdc', NULL, '国际新闻', '国际新闻', 'b94628af-32a2-47cb-9f01-33e0843d0a91', 3, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('b94628af-32a2-47cb-9f01-33e0843d0a91', 1, '新闻分类', '新闻分类', NULL, 6, NULL, '新闻分类信息')
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('d4dea6da-2c0f-4a7c-bbcc-cdccb85baaea', NULL, '警告', 'Warn', 'f871b534-81ec-4f73-a2cc-e2dac035584c', 3, 1, NULL)
GO
INSERT INTO [dbo].[Dictionary] ([Id], [Type], [Key], [Value], [ParentId], [Sort], [Status], [Remark])  VALUES ('f871b534-81ec-4f73-a2cc-e2dac035584c', NULL, '日志级别', NULL, NULL, 5, NULL, NULL)
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('0a564fd0-80d4-49f0-b8c0-8ef958f50915', NULL, NULL, NULL, NULL, 'add', '添加', NULL)
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('1226AF72-F686-4A19-8A77-C08E6A6E0608', NULL, NULL, 'Resource', 'Index', 'area', '区域', '区域标签')
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('1D4C983E-A674-419B-812D-6BF4D76466C2', NULL, NULL, NULL, NULL, 'empty-data', '没有找到符合查询条件的信息！', NULL)
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('2a075689-42d9-4fae-85e9-6485a1f95567', NULL, NULL, NULL, NULL, 'query', '查询', '查询')
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('5cb0b7a6-02b5-464c-ba13-3539ff490e07', NULL, NULL, NULL, NULL, 'close', '关闭', '关闭')
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('663689c3-d9ad-4f30-9df1-985ba257161e', NULL, NULL, NULL, NULL, 'back', '返回', '返回')
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('74e7f402-fdb1-4d5c-9f97-8cf93417a171', NULL, NULL, NULL, NULL, 'delete', '删除', '删除')
GO
INSERT INTO [dbo].[Globalization] ([Id], [Culture], [Area], [Controller], [ViewName], [Key], [Value], [Remark])  VALUES ('a3a03e02-db48-4139-aeb1-fa2503278714', NULL, NULL, NULL, NULL, 'save', '保存', '保存')
GO
INSERT INTO [dbo].[News] ([Id], [Category], [Title], [Content], [Status], [BrowseTimes], [PublisherId], [PublishDateTime])  VALUES ('1CC526A1-427D-4FE4-8305-BEEB1948C4AA', '国际新闻', '工作周报', '<p><img src="http://localhost:59000/File/Index/fi91cGxvYWRzLzIwMTYxMC9mYTUzOTc3ZC0xNGIzLTRjMGQtODlhNy05NmZjNTRlYTI4NDgucG5n?mode=Medium" alt="HanKouBank" style="max-width:100%;" class=""><br></p><p><img src="http://localhost:59000/File/Index/fi91cGxvYWRzLzIwMTYxMC9iNDUxNmUyYS1jYTgxLTQ3OWEtOTI5MS0yYjE3NmM3ZWFiYTYucG5n?mode=Medium" alt="PingAn" style="max-width:100%;" class=""></p><p><img src="http://localhost:59000/File/Index/fi91cGxvYWRzLzIwMTYxMC83MTI1YzRmMS05ZWE1LTQ2MjgtYjczZC1kZjUyZDhjMWQ0YWYucG5n?mode=Original" alt="XingYun" style="max-width: 100%;" class=""><br></p><p><img src="http://localhost:59000/File/Index/fi91cGxvYWRzLzIwMTYxMC83MTI1YzRmMS05ZWE1LTQ2MjgtYjczZC1kZjUyZDhjMWQ0YWYucG5n?mode=Medium" alt="XingYun" style="max-width:100%;"><br></p><p><img src="http://localhost:59000/File/Index/fi91cGxvYWRzLzIwMTYxMC8xYjRlMDg1ZS01Y2I1LTQyOGQtYTY2ZS00NjAxMWIxZjgxNDgucG5n?mode=Medium" alt="cnhbgt" style="max-width:100%;" class=""><br></p><p><br></p>', NULL, NULL, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-14 15:53:18.373')
GO
SET IDENTITY_INSERT [dbo].[OperationRecord] ON;
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (1, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-19 09:32:09.547')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (2, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-19 12:59:55.720')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (3, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-19 15:49:21.910')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (4, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-19 17:14:12.980')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (5, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-20 10:37:06.970')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (6, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-20 15:07:15.110')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (7, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-21 13:21:43.017')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (8, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-24 09:19:19.970')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (9, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-25 11:21:49.513')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (10, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-25 13:43:22.607')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (11, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-25 14:05:24.300')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (12, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-26 09:15:38.973')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (13, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-10-26 11:57:13.317')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (14, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-11-14 19:10:31.783')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (15, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-11-15 15:21:17.830')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (16, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-11-16 09:29:00.920')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (17, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '退出', '127.0.0.1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-11-16 12:43:00.613')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (18, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-11-16 13:40:51.127')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (19, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2016-11-22 11:15:04.370')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (20, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '退出', '127.0.0.1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-11-22 11:29:03.010')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (21, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', NULL, '2017-01-26 10:39:18.253')
GO
INSERT INTO [dbo].[OperationRecord] ([Id], [BusinessCategory], [BusinessSerialNumber], [Content], [LogOnIPAddress], [AddedUserId], [AddedDateTime])  VALUES (22, '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', '登录', '127.0.0.1', '48f3889c-af8d-401f-ada2-c383031af92d', '2017-01-26 10:39:47.730')
GO
SET IDENTITY_INSERT [dbo].[OperationRecord] OFF;
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('00d81696-de36-41b1-aece-6e477bea5b56', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:10.153')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('02acf4ab-1e9a-42bb-8a6e-b8ae2dd7bbdf', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:02.103')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0300ca4f-f39d-4f7b-a1d5-4cb3779d4b63', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:24.383')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('03b22074-70a1-43ea-b627-109cc3b303cf', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:34.450')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('03beb593-eb23-4d40-be67-1d5e201da21a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:36.560')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('04fc2aa2-4891-451a-8998-77fb7e83cc83', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:38.343')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('05466b02-1142-4659-b101-88d9c288f646', NULL, '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-13 20:21:37.810')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0698c24e-c830-4b5c-a616-75aacd2ba0c9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:07:03.470')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0757c640-81cb-4c24-bf1d-942d3eb8f178', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:03:04.490')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('08253ab8-bbe1-443d-a41f-d5c6ae37a91f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:14:17.037')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('08794b14-346c-441c-802b-4c0d40b1dfea', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.897')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('08a8e5bc-fd3f-4f05-b3c2-e8148d4e9a07', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 21:52:16.293')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('09a1ccaa-3ba3-44fc-b65e-cc876e7c0f36', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:06.597')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0a20003e-5430-4f4e-a2f9-e489613ce8b3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:38.520')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0a711547-b94d-4d54-bb0a-7255c0a0a99d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:06.597')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0a9858d5-3b19-4b97-a2da-644f8286b3cc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '新闻中心', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:12:33.523')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0bb38914-75a0-4135-979f-9ff15a20a819', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:46.060')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0bb7adf2-7750-43ca-91ba-47f9d08ba718', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:33.370')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0beccf1d-530f-408b-995d-67a9bacbb27f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:00.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0c383971-13fa-478e-8037-4751886e0a8e', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0da4a3e1-a966-456b-b239-32d3a5d2250d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.383')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('0e1129df-91ff-4f13-ae4a-c63828b46836', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:03.993')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1021c779-293c-4606-a693-095ca0e30c43', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:14:08.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1151f7f7-b141-49b4-ac6d-3349b292fe40', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:12.943')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1177b174-6081-4dc0-a0c1-ca7fbebd4442', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:00.707')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('120e6a49-bffc-46b6-a52f-e30268a51459', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:02:55.420')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('121d9527-6a41-432b-bc2a-645cf3e1328e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:41.577')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('125119ec-d6d9-4d0d-b02f-096ea2e5c59e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:44.377')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1271ecff-7149-4f42-8343-cb671396d4f5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.207')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('12b022eb-e121-418d-a578-a9711080a4dd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:25.520')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1311d1f0-0d27-4341-8334-554ca7c4ee9b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1381fff3-6c90-47ba-be96-ab4ebbdc41bd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:56.927')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1396d420-6b4e-4d75-9fe5-e2e17f4937f7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.067')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('13d96086-e98f-4047-a133-c3c053f64e90', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:49:45.443')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('14d69eff-64b3-435f-9b09-d198326d1c69', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.203')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('15377501-a657-41d3-9ae1-4e0ab39b5be5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:34.123')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1587a64e-b18e-48dc-9e1e-e2baea80a181', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IExtensionPropertyService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.483')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('15968925-a326-422c-a17b-8881653ce754', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.243')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('15ec39bc-5459-4eec-8e00-07393794404e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.367')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('163a8fbd-8159-477d-b223-199abc32fc03', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.987')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('166c7339-59f2-42c0-86a9-f2bf2a76d3d7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:22.793')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('170ca032-0fbc-4fc5-98c3-b598a5b04307', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:52.503')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('172bc478-9726-4c52-bf9e-a91a4ccd8c37', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:49.700')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('177977f1-8079-4091-9111-3460c6c80dac', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:19.710')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('179149a7-f68d-4abb-a9df-61b761c20776', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:42.583')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('179c43ee-bc84-4e29-ba7f-013188bc7f41', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 16:21:37.237')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('17c2b714-12be-4d6a-b9da-054293fbc03a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:32.373')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('195f45fc-0f61-47d9-9eed-b9e3b59703dc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 18:02:42.510')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1a02c5df-26f0-4412-b459-be651712814b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:52.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1a6b53bd-a660-4f51-9494-84873a6b30a4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1b4a0b10-20a1-4f74-8825-ab2c851dfaad', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.087')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1bc873a6-6611-4c7c-a29e-eb63985c5bc8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:12.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1bcefe69-3f55-49ac-a6cf-a451bd483dce', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:09.973')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1cbddccf-0efd-4f94-bdb0-231be4c0487d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:50.047')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1cd44bb2-0196-4783-b073-ce9b43d0440b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:23.653')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1d829afc-5ab5-415f-9636-66ed8337f6da', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-07 14:26:56.027')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1dcb38f1-459e-4764-bfea-48a7f5bfdac7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-21 15:54:57.643')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1e221f83-3b64-4c15-8047-3a7713389e42', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:22:06.840')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1ea38e1c-ead1-4511-91b1-3449be542ae2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:23.520')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1f5e274a-9482-4f3a-99ec-f4a4ed6641cd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:53.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('1f76cbd3-09cb-4a5a-8379-8374caad3be4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:49:45.430')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('209650cd-57e4-4e50-afca-41c5a1bab0f3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:44.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('20ae706e-95e9-424c-be8b-64b2785abb58', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('20c362f2-de11-4cf6-ad3e-056d925d2838', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:50.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('224d8a22-67cc-4968-8c77-9e78a3f19054', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:42.723')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2307ab22-d08b-4204-8007-78132a4882a4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:26.690')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('240baeaa-2671-4ee9-b1e0-bb6573251c48', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:24.243')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('247d90f1-196d-4d84-88ee-f24446635012', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.970')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('24952d0a-bb60-4684-bdaa-820f889ac97a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:21.887')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('25c7cdde-2139-4354-ba1a-02f454433bea', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:49.707')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('25da6080-65bf-404b-bd86-2ee539257184', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:48.010')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('26745a51-4dc7-4c9c-9ec0-040d5518cdd0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:21.373')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('26c901ef-f646-4e3a-bffc-df5305e1e7cf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:43.650')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('26e49a43-1f9e-428a-bcf3-929b2ff25778', NULL, '127.0.0.1', 'Web Api模块', '发生异常：列名 ''ProtectedToken'' 无效。', NULL, 'Error', '2017-02-13 20:34:23.967')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('27028ec8-5058-4dc0-9d5b-4b5576cb50d4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.700')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('27fd7e17-705a-4a72-85f3-fb82cd098aa0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('28659d2c-c2c7-4dfa-b520-e3a39b23bae8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-07 14:26:41.033')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('292f6751-867c-4ee1-8b08-0e779ab50e73', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.747')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('296273cd-7e31-48d3-9212-b886db782d49', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:49:40.317')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('299ffc30-8cbf-4c58-98fc-ad0c0333cd5a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:54.493')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2a21d420-648b-41e3-8305-7c4be09e15d2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:04:41.700')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2ae11f9b-62f9-4fb8-bd03-2bcf190e6fcf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IOperationRecordService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:44.243')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2baf03e6-a4a0-4613-9a9a-338199725493', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:09.217')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2c6f763f-24fd-47ab-88c6-75c0dfbc2d80', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:58.683')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2c782e1b-0c50-4358-b0f4-70ff059e9c74', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:50:48.450')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2cbf1b28-f774-4b4c-bdc5-effaa5423a62', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:37.610')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2d339d75-ac59-460a-b7f5-8cb0bf5773b8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.330')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2d4b109b-8101-4886-891a-26966369f7a5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:41.110')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2fb38e80-f29b-409f-a360-c8503cc194b9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('2fd4486a-0ca3-4cf9-82de-89fb38eeb2ef', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.003')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('30054756-5e8c-4009-b6ff-20887c8de360', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 14:58:08.273')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('302902f6-b620-4ce2-81c6-1fde75ff5bc4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.240')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3033334c-a8c1-47c5-b075-22fe2441926e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:23.653')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('30a44c96-6ef9-4afe-8c40-7acbe085afa2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:43.297')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('30e2e13a-7e33-4416-9691-60e62b8d9923', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:22:20.003')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('327dff6a-7f6f-4313-a746-cdd7126ba991', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:11.090')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('333c924f-d542-4b38-acd3-0f7a4a309141', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:56.837')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('33bae76b-bdc8-414b-a638-b4c11e268dd1', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:14.530')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('33e9ce16-9528-4414-8a68-891e77edb112', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.367')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3427c3df-cbfd-4298-a7aa-187af3fd4e05', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:50.277')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('348a3bcd-a80a-447a-bf1d-75c5338f291c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IRoleService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:53.423')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('34d2d297-e567-4b2b-9efd-4967eb9a0049', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:07.647')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('35a01c71-bd46-4f40-8f94-a46ccb21d0eb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IGlobalizationService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('361b295b-c5d2-4adb-bd44-9f230e77b7d7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:18.963')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('362f8413-0aa4-4f11-950a-3896d13d6c55', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:55.433')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3636ea55-b47e-4678-9bf7-fb6d6ee73e64', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:05:15.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3673f636-2776-4cf2-9902-f64d0c07aa71', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.110')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('36c623ee-8c02-418a-9a62-3bbe4fa218e6', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:13.470')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('36e59e08-f9d9-4d66-8c6a-7ad106e1fdc6', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:19.330')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('37aa2fe9-1967-4b80-8910-29f3d223ba83', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:41.273')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('389d87c4-0246-4738-9820-a1c8e52272e4', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.653')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3904f981-920f-4634-b2f4-cd32601527ec', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:43.310')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3926bb95-b055-43bd-b958-d1fcaac030ea', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:27.873')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('397cdc50-a03f-48be-b7b7-e0ea7673d194', NULL, '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:17.653')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('398e0ad2-8de6-4dd3-ae35-32d188a91844', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:38.057')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('39bd14d1-d86e-481b-93c6-1bdf59504a35', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:36.567')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('39f2203e-88fb-46b4-a929-6e98bc2ac9f0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.120')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3a2007c4-99df-407f-84c5-3a326a11bf99', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:21.883')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3a3d74cd-e98a-489a-ab3e-60681352c0b1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.987')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3b2e5fc8-6022-4214-8e5b-6bc5b0b614fc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.523')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3b4e1e0f-722c-40c4-a189-f6f24c259ca5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:18.930')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3b74ef53-aea4-40e4-a5fb-58b4b81db7be', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '发生异常：已添加了具有相同键的项。', NULL, 'Error', '2017-02-07 00:15:48.193')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3b9d1714-9235-47b0-afcf-7199132a2eb5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:44.247')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3bfa5018-8df1-4368-af32-eff65eb2d42d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.743')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3c4ab7fc-bea8-4e2f-9115-170ebdf44b32', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:24.487')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3c54492d-f8cb-4d90-868d-5f0351d9fade', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:33.963')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3ca56bf3-6f52-46c5-b5f5-0d3f5b449e25', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3ce8c715-9e94-4b8b-932e-d4a3dc6d1600', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3d3d91f3-eab0-4500-8f5e-8cee62c63c40', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3d52e85c-6764-4b13-86d0-025ccdcd38bf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:21.870')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3da5a34c-b8a6-4c32-b1c4-61dcf3673adf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:05.337')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3e24525a-cafa-4e67-88d5-99621e5e3d5e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:25.280')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3e52710e-cf5c-4882-a35b-b33e58eb3946', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:05.337')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3ec87e1b-840c-4d21-b414-7276d3ff4c02', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:00.853')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('3ef87a0a-f338-4939-bd43-554a94442ce2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:12.950')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4035bc58-bbb6-4324-b377-bb9c7b35f66b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:21.887')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('404c2f74-db12-40fc-b41d-c423e07b9b98', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 14:58:23.230')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('409cea1b-070e-4ebf-ad21-2e4743691c1f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:42.737')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('411f792a-69f9-4d82-a6ff-61beb44ec531', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.343')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('41ad297f-ec79-4e66-95c1-b57cc0629f5a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:54.477')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4269ddb0-998b-4926-883e-d13d1acffa74', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:24.480')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('427918e7-0e1c-45dc-b414-1837f21878df', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.303')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('44f75a3f-b6ba-4ef8-94f3-b2dbdeb3cfe8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:00.983')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('45fd6c0c-ac9c-4efb-bea8-6a09996a829b', NULL, '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:33.947')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4616fa5c-ff66-476d-9218-c1ed745f56a8', NULL, '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:52.507')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('462b20d3-8c38-4fba-abce-6d18d668cfb7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:24.900')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('465446a7-a88c-4f98-8e6e-e4f55881282b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IGlobalizationService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:40.053')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('465b6b4d-15a5-4b6a-9b4c-8b1d95e837ac', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.920')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('46d45caf-01b9-46ce-85e0-ee0eb0601c67', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.120')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('476031d8-2f9c-4807-b4bd-ad866ea80c6a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:01.037')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('48037308-fc88-4889-a0fa-68be0ee8f6d6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.360')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4891f1bf-aef3-4910-8e3e-0f34682cd70c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:50.880')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4936eee2-2cb7-4cfd-8c53-7cc5ab87c33a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:24.483')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('49ae5b19-e15a-4780-b8a6-c086d586679b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:44.353')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4a929881-28ba-4fa2-b52e-8fc6341603f6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:06.597')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4b796225-aa43-4494-bd3c-73e520914a03', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:53.463')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4b9731ff-c472-4487-90b5-5bc713fd3bbd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:36.980')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4cc0f7ee-9702-4b55-aa20-768454902096', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:42.667')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4d0d76d2-dc47-4672-9095-9354745a3ab8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:24.483')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4d50e5b5-06de-422a-a481-b5412df6611c', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.650')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4d8130fa-b5c6-4be8-ae42-78e26fdc0b99', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:39.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4db0ebf9-4f8c-4d00-80c2-a8c8d1c96d03', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:18.307')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4e304433-7522-4f49-a12c-c20956fce086', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IOperationRecordService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:42.220')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('4f8e6a40-9989-4efd-a8d1-c2c66c4c80fb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:42.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('50d7a5f6-aebf-45f1-9fd1-f5288468fc24', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.367')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('510b8cf0-3182-49f4-a11e-0805558f7245', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:24.247')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('51a83e5e-8355-4fb5-ab06-ebd0c1c888fa', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.300')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('51fc1e88-2f5e-497f-963b-4988c10a48bb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IExtensionPropertyService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:46.120')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('52040abb-5b5d-45f6-b4c4-6d01a8e9b49c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:54.420')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5246923a-be67-4bf7-a725-456c20db3bc0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:15.953')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('52652cf0-5d3c-4712-8460-1d20de64e54f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:15.373')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('54b4d345-a8f5-4e23-b07c-9c4cb35a24e4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:41.263')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('556826f1-0ebf-494e-bc81-dedd2314f460', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:34.007')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('558fa0cc-dbd8-4cf5-a0d5-f2dcb20d517f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:46.193')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('55a5038a-e232-4197-99b9-cf986025f717', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:23.517')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('56069713-e908-44df-91a9-4a6735b49ea7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:54.483')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('574ff384-7d74-4953-b926-95e950cde895', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:21.150')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('57510444-7413-472e-ba18-13b2eae08ddf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 22:05:31.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('579dadb3-4106-4659-956c-8fd3429370d7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:06.600')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('57e18416-f3e6-4a6c-bbc7-e248640c2f83', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:24.333')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('57f28297-7746-4840-9ac5-5fdf11c03ad1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:42.527')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('58ebd7e2-089e-4d38-b19a-bd2eaa9d9a6c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.460')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('591a11a2-acdb-472b-a42c-11a67ec9635b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('593f9238-1c45-4d52-92df-b466de687a2b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.120')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('59bc0f62-ec56-4b59-afd3-e10315ad931a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:00.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('59f0cda0-03e4-4886-a46d-11fa71ac1777', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:46.030')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5aa438e0-82b3-41ca-855f-c65715c5bbce', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '新闻中心', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:12:23.207')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5ab2a257-a19a-425b-a472-1d1e74e34f21', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:44.327')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5c93a55e-1cd4-4fec-a2bb-f83930e7206c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:06.640')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5c958fe8-d6b7-4d75-b19d-e1abb298fc8e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.983')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5d6eb8e2-c7ac-4579-9009-acca7ed63c22', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:18.460')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5dbfabdb-2c5d-43ed-beb4-f1ef903baf73', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:16.833')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5e04642f-5bdc-4238-a951-726dc3c0ac1c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:18.930')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5e83b273-c4d2-4366-8243-1b4d9fc1e1f4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:03.463')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5e8ffa3c-cc57-4f20-97de-01cb860089c6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.240')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('5f983b99-1e81-4da1-9d79-f9b069a6a11f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-07 14:27:11.030')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6010e868-360e-4aa3-9438-8702e116e311', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:45.433')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('613a8ba8-8750-4ba4-aa69-5d70c6f9a07e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:50.880')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('61b4b4c7-d1f8-4add-b445-78fb07037938', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:53.453')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('621ae1ec-fc36-4453-956f-b383b84a77e5', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:55.403')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62426f68-4b48-491a-a59a-13b683adf81b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.487')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62b19faa-2ac1-439b-807a-bba71caf9176', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:12.957')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62c2da08-9002-4506-9340-3f97fb2c804e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:00.707')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62cb2b55-4153-4dd5-a76b-881126f0c04a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.203')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62d75a62-bf6d-4d4b-9146-bd9bc1f3ca35', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:31.327')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('62e89b6f-c988-4bac-90bc-ab5759b06b3a', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:19.863')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('63570cbb-833e-4c4a-8c77-397889508a65', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IRoleService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:44.267')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('63906fae-b45a-439d-aebc-966864143935', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:39.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('63b0b89e-16dc-4aba-9ddd-e500808a42c5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:48.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('63d3ee3b-b046-4423-af91-253cd02adfe3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:50.880')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6443297b-63ee-47c2-9a98-e98e0859c962', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:06.583')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('64912658-ea5a-45c1-860d-a26c430a683b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:28.223')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('65372506-db29-4d13-9a06-354dcf25ee40', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.203')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('66608b33-9389-4d7a-b436-9b52c87224fe', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:25.283')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('67088aca-c1bb-4d90-882a-de32c447c595', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('688e3db1-7cdc-4146-9a0d-8e3b1297f37c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:56.930')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('68e7f2af-c97c-433e-8f05-7d282acba5c7', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:56.823')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('696fdc45-22cd-42b1-89ac-19bf35fd4e95', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:10.157')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6a2d4d15-2c94-481f-b472-bf97b6ce3c03', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.933')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6a66c882-1740-4906-8dd6-2e9b601dd326', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:48.440')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6a93478d-157c-4ae4-bc9f-c6c69617b1e7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:25.267')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6ae83091-a47b-4c5c-8739-d0ed863d7568', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:37.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6b2d6674-6b51-4452-8b32-e16005a6b16d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:45.543')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6b4da1de-9ecf-4d8b-b970-92a9740a8952', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:05:42.733')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6bb8e282-d3b7-4cd8-9146-6a532a619624', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:55.560')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6bd1e49f-70c2-40c6-a83e-ee46c2a75124', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:36.837')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6cbb3ca9-6f09-42d4-8b2c-bcc6f910cf99', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:50:48.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('6f190998-a05a-4974-b77f-15c75a3745d6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:20.513')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('704d8825-c634-4a1c-9723-4871282e9c8d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.983')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('716d406d-d826-48db-8b16-6c0735997bb4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:14.870')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('718e1b45-f166-4c52-be42-e614c29daf9a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.453')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('72187dc9-58d9-4a7b-b35e-704f9d4f2335', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.377')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('723caf4c-708a-48df-901e-a720ae09b0cf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:27.857')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('72462f4b-b8d5-4f9b-98f8-37ae07507ebd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.370')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7286ccec-f6df-43d6-93ff-7d503e7a881d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:36.517')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('747367f6-067e-4961-808b-8bdeeabf137a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.330')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('749a5cfb-224e-4687-9437-05c2756d07cf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('74d1b716-b275-429a-94c7-a4a8269f342a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-21 15:54:27.637')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7515c660-0f9d-49ee-b8a3-5d578ef13894', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IOperationRecordService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:42.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('76c6ca73-0aa0-448b-80b1-7aaa1626c02f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:49.297')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('76f8e53e-4a68-457f-b33f-6a1789f2419c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('78a10098-5524-4c61-86d6-937f3e6dea5d', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:02:55.403')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('78a289e2-6197-4fa6-90f3-c2271254f704', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:56.557')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('79547e88-0134-4cba-8c99-4399d4869ce7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:41.273')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('796eafca-ec66-49c6-b978-354be81fcc05', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.237')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('79c89f7b-3667-4c06-a419-4e3dee77a0a2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:43.303')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('79f896a1-c458-47dc-9ad3-edbb177a5422', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:24.900')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7a26a03d-56cb-463a-9e12-919771cdaa10', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.983')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7b013125-1955-4c20-8194-f9480891df52', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:27.857')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7c0142ec-f324-4f5c-a2fc-3a822779544f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:24.480')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7c0620a8-df07-4b8b-8a71-5372732de9cf', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:19.790')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7c7b8998-9561-43e8-a597-f998d4c96a10', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:08:05.913')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7d4622d2-dbde-43bf-bef8-3ff7aaa30bb8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IExtensionPropertyService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:46.067')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7d593d3c-7b1c-401e-b35f-a40b22021430', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:12.957')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7d6426b5-d9aa-41ff-a06b-1727921ec270', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:34.013')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7e27c50b-72c3-443c-81c4-a82fc3a9a3bd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:52.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7e44a5dd-59e5-4ba8-8e0c-5a329bf5744e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:32.363')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7e6aa7f0-c9ff-4835-894a-3cf0b81d11d4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:54.007')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7f253be6-79d7-4ca3-9f4c-a58a490315ac', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:10.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7f775134-03ef-4590-9f76-ff04f0dd07fb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:36.577')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('7f9b3889-97e1-48d8-92a3-bc4d59fd51ff', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:11.473')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('80b9ee99-39ac-4575-9567-5160215abe93', NULL, '127.0.0.1', 'Web Api模块', '发生异常：列名 ''ProtectedToken'' 无效。', NULL, 'Error', '2017-02-13 20:32:32.087')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('80f63b53-b4f4-4d9f-a306-238daf7a9348', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:32.523')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('81108181-6f5d-4a9a-8a05-9f0a718868a3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IOperationRecordService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:44.230')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('817508cc-8c27-4241-81c3-71bc6ff9732c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:20:07.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('81b347d1-c9f3-416c-93bc-26080a260586', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:29.117')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('82311ddd-cdc3-4c2a-b0f9-2b5a86027ab0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:50:19.333')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8292a78c-4f2a-489c-a515-05f62d030ddc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:24.907')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8307286e-e8ca-49dd-86c5-85434df37d21', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:19.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('832ea9fc-0960-4e73-a2b5-c2aebc379b19', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.503')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('84ba7c7d-4b8f-4ff1-bcfc-24a1acba4a18', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('84ceffd4-0062-4d84-81dd-29e97ff41231', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:06.600')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('84dc4222-a460-454f-90bc-a9791aa07f8a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 14:58:38.250')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('861f6825-a495-4d16-bc59-55560e7f81da', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.370')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('866e400e-21eb-4788-9c52-fd858988e171', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.760')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8691d71d-ce01-4a50-b76d-29e0b1f41537', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:08:04.227')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('87de5728-47f1-48c9-b1df-1e78f8a753ee', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.403')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('893636b5-01e1-45c4-994f-e5b956f12777', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('893c3909-b139-4a6a-9322-5c8d2c45138e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.683')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('89428ee7-5cd1-4c73-a8e8-02880b02121e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:50.880')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8ae97d0a-2e77-4ea7-bd0c-bbd8829052af', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:45.447')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8af85a24-2dbf-49a4-ad53-da7ddd246fa0', NULL, '127.0.0.1', 'Web Api模块', '发生异常：列名 ''ProtectedToken'' 无效。', NULL, 'Error', '2017-02-13 20:36:55.533')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8b3edaab-bb9c-41de-a9ee-a91fb990e5ab', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:55.563')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8c032a13-ffe1-41d1-bab9-bc3491fbf3f6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.423')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8ca898db-779e-4857-a806-d6f6024eb670', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.370')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8d0a9e38-544f-4560-8e27-e3000d8f2033', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:07:05.357')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8d113d3d-73a3-4c4b-98d4-92f4b240aec9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:10.153')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8d4ccb3d-8fc6-4b6d-8cd4-d639e1b68ff0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:29.593')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8e2a8dc5-5779-4e6f-8621-df92c2512ffc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:30.173')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('8fe0ae52-fe62-49b2-9eec-ae028ded6f18', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('900518a1-f82b-45f4-973a-b4e1a85a79ba', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:29.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('90c476f3-7d15-4bf3-b8f0-248b4ac174dc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:00.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9120848b-9d3f-4415-b44b-8ea30874eace', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:50.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('91784b0f-f799-4447-bac8-55552b5fda88', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.367')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('92ba5161-2a37-48c9-88f1-a9c802a4d9a1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:06.600')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('92c3dba8-c726-40bb-bd0f-ce41524489e7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:56.107')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9311ec87-7e35-4022-8874-1b6fc79181a8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:05:33.387')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9334850e-b1b7-420e-a2d3-d96396c11915', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:21.883')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('93859c5c-68eb-40be-b69d-f3ac40ea5a2b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:27.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('93ddd91c-ac41-449c-b378-e23f8ad1142d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.473')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('94152a24-8f1d-4a85-bb1b-e0b2b01d1990', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.973')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('94c1b81c-cb6e-4c8e-875c-ba1d948adec7', NULL, '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:49:55.780')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('94f2c130-c9b9-47bf-ab75-789d6dd231bb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.217')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('955d1322-a0b9-46cd-9b51-ae143168fe56', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:36.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('958df689-8e09-439a-aad6-da5525527183', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.457')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('95e5d169-e5ea-44d4-9d72-12053cef49e4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:49.670')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9624cfd4-98f4-4e86-bf08-107b99e6f4e9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:38.383')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('977305f6-325c-4c1c-b65d-7b9658234f7e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:24.480')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('97970a64-30e4-41cf-8182-33ef52002786', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:20.283')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('97afc596-7f26-42de-993b-041d0b3ba16e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:39.007')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('98f5e7c9-32f0-423d-bca6-3ea693f3cf1d', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:51.897')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9bc6e488-7b24-4722-8632-7064b5cbe180', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:37.613')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9bf34ebf-c4e2-4c49-8bae-86c6299735f7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:46.140')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9ce1f1b2-764f-45eb-934c-229c976630e0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.380')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9d12b2d0-4c39-443d-af8a-116963c816cf', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:10.073')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9d3b1c65-9a99-46be-a25f-def1b2992221', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:33.463')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9d7b4729-3ad7-4ce7-a0ee-9409d3647312', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:25.403')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9dc5b9e0-9633-4269-ac84-1f042a91454c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:57.890')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9dcd85cf-7cc7-4de2-8bdd-90b52dc4aa7f', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:00.850')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9e136048-a50b-4fbd-bddc-156a16263776', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:30.147')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9e403866-8317-4320-b327-a626b95a4d47', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.987')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9ec69905-894c-4698-93ac-51ac35c543f4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IRoleService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:44.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('9fcf3e43-1087-435d-a98e-b23a138b70b3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:39.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a09785a3-6c2a-49af-94e2-e62775544507', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:02.147')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a1e7ce7a-2e37-49a6-8387-8b7a863c35b4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:08.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a206ddd9-d39c-4a37-80c8-ba7d416972ba', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:08.683')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a3d7092f-d40e-4dc0-97b4-94f44fda041d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：不能直接删除包含子菜单的菜单项！', NULL, 'Error', '2017-02-17 15:36:42.997')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a3f924b0-52d1-42f3-a65a-339a618fb106', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IGlobalizationService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:37.343')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a40ae8a2-1a7e-48d4-b426-8d0de79bff10', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:44.270')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a414e4ff-1872-4a20-8df7-6262d8a178d8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:22:09.123')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a50cf49d-7c98-4a14-978f-051f4d338699', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:25:40.933')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a5ac4e08-0b01-4a41-ae87-8ee878612717', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:18.003')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a5c146e9-34f2-40e7-bf7f-a9648efbcfdb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:42.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a62983fb-1304-4866-9183-4187f47532dd', NULL, '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:49:55.760')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a6640d2e-ad98-4277-8697-6d11a1963b2d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:41.113')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a6a9e9da-d7a3-4755-a192-8779ca549c2c', NULL, '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:17.933')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a72d7b6d-96c1-4ea9-8c39-9dca66777c9f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:19.203')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a7540376-956c-42c1-a44d-ce48bd2962f5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-21 15:54:42.637')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a786dced-c9e0-4410-a3cb-e03df366cefa', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:36.550')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a789e7cc-6995-427c-8403-e36eb7b569fa', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 16:24:03.670')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a7ed07fc-08a1-48b7-9bee-3d60a59ddda0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:52.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a80a7143-54c0-4aea-a829-f83730a83b73', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:50.353')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a8e5e73f-a706-4946-9ba5-e14c6e16d029', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:14:08.677')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('a9627088-245d-4d0e-a56f-b8624df2d492', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 21:57:04.610')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('aa656670-95d0-4b9d-b99c-1eafbc5d5bb8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:24.127')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('aab41997-8cb6-42d6-b76c-5aae420e3249', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:25.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('aad7165b-e8b3-429b-adce-6af3165532a9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ab327944-fe0e-40e8-a57e-1496a77191d5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:50:22.147')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ab50a14c-7013-4141-969a-3bfc664312ed', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:22.957')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ac6f10b1-7053-45d3-b80b-1e404cd64f3b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IRoleService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:53.417')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ad16679a-6e10-4fb6-8ef3-e5ff2517f689', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:03.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ad16855e-aa05-4a13-87a4-8475f983cec6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:18.310')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ad3c9cdb-0cd8-4d82-9248-88b7c8c655af', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:28.210')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ad60a144-9e60-4982-bc8f-e51a91c50500', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:24.350')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ad9b9eb7-e321-4195-b7ff-1dc46c7a9524', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:06.710')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('adb07cfe-efcb-432b-ab7c-dd012de7d088', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('adcb86fe-1d71-4b3c-b6d4-b30f8246021b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.643')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('aeb0dbbf-a70a-414f-8ade-7dca96a058de', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.383')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('af472b1b-27c8-423e-a503-41780f0932a9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:30.113')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('af5e16eb-b6aa-4af0-854b-3988a9ef3cdc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:11.443')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('af82df3d-e245-46ba-837d-c8df71456c8a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:05:42.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b0074a2e-4341-4ff8-8f49-fcab913f4dc3', NULL, '127.0.0.1', 'Web Api模块', ' 发生异常：列名 ''ProtectedToken'' 无效。', NULL, 'Error', '2017-02-13 20:38:00.000')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b01ace94-e280-46b6-a407-6bfcd381e5fa', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:42.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b0605d81-a4d7-4dc8-a5f0-511b6a133ee9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:24.473')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b06eefc1-d03d-4281-ad74-f8c0d76b97f3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:06.600')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b1285ede-f72a-4eef-867a-a45c549003e6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:23:59.440')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b19166d0-7ead-4eb1-be45-683e5c1cdb03', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:49.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b3342651-1cad-41c0-8cc5-4a2719d4b90b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b33f408c-c888-4e6e-9818-de4eb5be8963', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:03.013')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b364d6d0-2298-4343-8510-0e35d4104704', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:44.100')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b4878411-8ca5-478c-8e83-886c055753b5', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:02.093')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b504e259-0080-4fdc-902a-a996ee7585f0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:56.927')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b5108176-1765-4cd2-a8ca-15d52464a6b1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:49:40.267')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b56a23cf-320e-490e-889d-4cc5bb3ff70c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b56cb5db-0244-4c05-84d0-135502ca2498', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:50.860')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b57b1947-1108-4628-8820-18f85b598ab7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:36.517')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b5e97a5c-45d8-403b-8f6c-8940bee73018', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:34.463')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b6bedfa2-388d-4022-a06d-40c4ef5759cd', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:19.713')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b77c46a9-5a76-4574-abf5-1f1621bc7ded', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:03:04.050')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b82f21fd-18ff-4816-b8d2-ec3210d95726', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:22:24.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b834d418-2f47-482f-abc1-5eca7b6e4174', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:15.837')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b8991dd4-1ada-406c-819b-74d55b6f3590', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:12:56.593')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b8a2031d-c3f6-440b-a6b4-0072a33cf108', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:46.057')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b8eee601-4f08-4ebf-a483-47c1cc43539c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:22:20.173')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b908333d-bf7c-4fca-a128-e341c0b7e8f5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.460')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b9aa989a-07e3-4ba4-96e3-9038ae7f059a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:50.270')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('b9e388bf-533f-404d-ad20-fcc2c4e6f398', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:41.593')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ba38802e-4b70-4eab-947f-9527ee7a409c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:08.663')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ba597c27-c7ec-4e06-8192-fc191cd25bf5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:41.573')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ba615ed0-fd1c-41db-b019-c30cb2d2e546', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.170')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ba6b8306-d400-4c34-9de0-2f4fa110bc66', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:36.557')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ba72fe78-cc24-41ad-8a58-94faabf42ed5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 21:50:10.807')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bb239c36-e56d-4391-af67-58a41f4e5d89', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.460')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bbfd5261-51ba-4ccc-b677-65ee29b227a4', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:00.657')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bcbab654-cb73-4c09-820a-095a26f82cd9', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:34.450')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bd2116b9-a273-43f5-8d7b-6935a82ba3ff', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:48.457')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bd87eff4-ae4e-4de1-bb35-8268c7659a6e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:03:10.973')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bd96d8fd-8681-4e22-bac2-a3f144c71ae6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bda0303a-4b71-4e6b-b7af-f793afec62b4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:14.853')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bf635c34-a590-49bf-b12e-9dd6ffceb6fd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:49.333')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bfbf38f3-cc6e-4342-a84d-d3c433fb6ad5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:25.987')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bff338f7-a06e-41e9-93ee-3b5cf5754814', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:27.147')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('bff348fd-1e0a-45db-a77d-7ca3a86a3877', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:55:30.177')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c0925ffa-4234-488a-917c-5c42579679e4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:39.700')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c0cdab6d-375f-4cdf-a811-36e21a8b4c53', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:11.743')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c0d2ab88-4e86-419e-b7fb-b8e4d8d0179b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:54.463')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c15bb41a-5514-402d-af37-2e7059824a92', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:50.263')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c1edb8c5-2222-4b61-9666-cf5c97677c78', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.237')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c20caec7-4ea7-4fc2-a27d-f84a4c3f9397', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:28.787')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c22d3f55-d690-4440-968f-6d668b26f17e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c23e400a-c454-4586-9d1c-5445876fb7b5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:03.137')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c25151f0-3584-4ec2-9ce5-8da5ef6c25fc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:30.710')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c3473adf-db3a-44db-8469-6b743108bf50', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:28.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c421c707-ab58-4c09-a78f-c66f3931028c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:05:34.337')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c440aae6-040d-4077-b704-9246e15d2bb9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c453c020-e950-4268-853b-ee8303e6d862', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:20:29.087')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c5813a55-9cd9-4835-8e3d-41fb191fbd96', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:36.980')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c58291f8-f214-4c2e-8535-ccc8e806d381', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:28.180')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c5da56ab-ba07-4587-8281-cb22180b69cc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.483')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c62c67f2-4470-48b8-8ca9-f19030e1b953', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:28.220')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c6faa51c-5da0-4a36-b99d-8c9a4af6c81e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:24.480')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c73fb4e9-9d72-4dc6-babe-a7dedc8ca56e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:12.943')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c763a1c3-1a20-4d8f-ada4-aa9952fc0dd5', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:33.967')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c7b4b262-1bce-4de8-9595-7f1b660a5e20', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '发生异常：已添加了具有相同键的项。', NULL, 'Error', '2017-02-07 00:15:48.193')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c820f288-5a9b-4594-93de-afb94a7fa089', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:57.890')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('c999d2b1-f7c1-4597-9177-3c2a3add95fe', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 21:55:21.447')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ca5517b7-703b-4ab8-b57e-43e962812771', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:02.177')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cac02748-c6f1-4e91-8a38-e2f5454bacdd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:20:18.847')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cb227439-65f8-4fe0-bc4b-9737616cf289', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:56.220')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cb71effc-3bab-4875-a529-04c2a776ee44', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:02.273')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cb90b5fb-8fc0-448c-bce6-40054975c511', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:27.857')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cbfd6247-8477-4bf2-9517-1f1ce278b535', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：This SQL map does not contain a MappedStatement named Mercurius.Sparrow.Repositories.RBAC.User.GetRolesByUser', NULL, 'Error', '2017-02-06 21:50:19.077')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ce2fe79b-9b4f-457e-a89d-0ff572da2bf5', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:27.857')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ceb9607f-59a8-493a-99fc-4adc08a00a77', NULL, '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:12:19.813')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ceea649f-b556-4ab6-b430-8fd81e7b7569', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IGlobalizationService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:41.680')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cf9b4700-2b84-4ee3-952e-a3963a81fd96', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:00.947')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cfc22e37-ffc0-4ba1-b180-27152785ce8b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:37.443')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cfd7302e-ae18-4275-b0ea-a7d8b75d4cea', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:22:03.433')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('cfe2eb81-2d73-4a3c-8e7b-72ea1a0ddf3a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:54.287')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d07c1c65-8208-4378-bb3d-5e92bbbd6985', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:13.747')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d0b42d7c-69c2-44f1-b2fd-680e00f537f7', NULL, '127.0.0.1', 'Web Api模块', '发生异常：列名 ''ProtectedToken'' 无效。', NULL, 'Error', '2017-02-13 20:33:21.527')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d1ae2bee-4eee-4a57-b8a7-27e5586a7ee4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:47.743')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d327913b-aae6-4a25-ad9e-fcc48225721c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:27.143')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d3616fb7-5dee-43e8-b7a3-c9d34c5a529a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-06 18:06:35.333')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d46e3aaf-56ff-4447-b94a-5e9552fb9ed2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.297')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d53fa470-21f0-4f56-8ccd-3354e9e19867', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-21 15:39:59.530')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d54ecfb6-97b1-464a-bb1c-22f2daeb13ab', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:24.920')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d55344cb-4d5b-472a-8cad-42fb98ef2046', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.163')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d613b3a2-b255-4a69-9865-951f530631a2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:49.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d6675d2c-89d1-4664-9397-3b542b59034c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:24.857')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d6897173-44eb-4621-87fc-e6806e875bd2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:39.757')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d6eb0cd1-0a04-4374-a5e7-58ae7c219007', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:02.157')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d70c3c5e-60a8-4f72-b0dc-e29f81469f33', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:55:43.660')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d77a5e13-c8d8-457b-996b-3a8f1007298f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:41.583')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d7ae5da2-4a43-46d3-86c0-4c7e2a566851', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.163')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d7d66f47-3325-4e57-94e8-ee6fe4c665dd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d7f7a91f-c2f5-4b64-9dd1-72dc381d4679', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:47.743')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d80c4155-1eb5-4ae3-938c-3e0de512b672', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:51:21.783')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('d885b5d6-af33-4f94-90f5-b1e026c98ecd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:37.617')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('db4ae618-ee4f-49d6-bcb9-3674457e0e3f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:34.343')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('db78e384-fc1b-486f-9177-2da2b54cf3bc', NULL, '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:02:52.597')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('db98f4f4-b107-4f5a-a205-22aebaa36fc7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:58.370')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('dbe9cb90-927a-4479-86fc-71c04767b583', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:49.460')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('dd8c9bc4-7401-4972-9f2a-6d686f0fb3a7', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:36.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('dd9a558d-3c54-4c9d-8632-792d3bec4588', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:51:27.130')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ddf17826-7042-42ef-bbcc-274f634ed6a1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:38.353')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('de1b5bce-30a8-44c8-ad9a-803c0ae54219', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:20.603')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('de66789c-3c53-4603-8982-939d376951ba', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:44:46.193')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('deb69ad2-57b3-4a20-b97e-b1280886a0a1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.973')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('df866170-7a18-4b01-b5fd-683e8882dc3b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.970')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e009da52-ca55-4ea4-bd58-e7b4f74c53bc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e0375ba6-8007-4e98-af96-f0defd7081ca', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:56.560')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e0379c93-60d1-47b3-9c9e-f57b131a59c6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:49.693')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e09566a0-fc9f-421c-a49f-fac85a3f04a6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:42.697')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e1629ce2-90a7-4189-902b-ec0b75733d6a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:42.250')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e16a93ea-acb0-4f4c-ae18-a445fd35177b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:22:03.400')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e253a854-71af-4c6f-9a81-c483994e3336', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:30.357')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e2b48e83-7129-4766-8232-145c5ff711a4', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:31.327')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e31c965d-6c6a-476f-b658-cf60e5127c3c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:25.110')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e34245cb-8efd-4e38-ad53-6e803516350c', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:37.487')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e43e808e-56aa-4274-a289-8cbfeb89c3a6', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:44.290')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e46a72a0-f3c3-4b21-8f16-5f61e101b4de', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:00.703')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e46ed5b4-1430-4433-8556-d93bf6b42fc3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:20:38.963')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e5e9d5c1-e4ba-4b3c-9985-ef263cb2441f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:46:37.467')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e646d728-8299-4765-85c5-16f305931a78', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法执行完成', NULL, 'Debug', '2017-04-21 15:50:38.213')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e66bb305-74dc-4f8c-94d8-8958fcd0270c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:12.333')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e6772ba5-1027-451b-958e-941f36610750', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-26 10:03:04.127')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e67b25d3-12d5-461c-bae3-64d7c264c195', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:25.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e6ac620a-8ba3-4dc0-8f11-1e7eaaa94f9e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:14.873')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e6b74d23-683b-4234-9a32-d3c6a6c032a0', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:45:32.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e7ba0387-083b-48b5-a1f1-2ad7d73bfe8e', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:20:18.850')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e7ba48de-3a88-45d5-b10e-fec6d328b52a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:44.400')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e835ffb4-a364-4f10-a22e-ce42e20fa263', '1', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:52.123')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e901b9e3-898c-404b-bf5c-bfbb1c7563ad', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:44:21.340')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e96d7881-4b72-4ad4-ba56-122eb590af6c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:54.430')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e9ab0e95-f5d3-4643-b4ab-17cdc79ce7c2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:12:30.163')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('e9c63ac1-111c-4815-99a9-9240ef425518', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:40.157')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('eac9fdea-d89b-4ab0-84f8-17d135411b78', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:39.753')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('eb0f52aa-273c-4092-94b4-943a769ccf6c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:14:16.997')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ebbfa666-fd6f-4e9b-85e6-60ed14f871e8', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:51.543')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ebd578a4-4558-47ff-a665-6cdb268432fc', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:34.450')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ebf67693-a9d2-42ac-bbb0-eb24a97e66cd', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('eca1e17e-7de1-416f-8725-1b70f5dc9807', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.973')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ee20c6e7-7091-4386-811a-f763743c6814', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:22.090')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('eef067b6-2934-43f9-ba28-7b633fbf949c', NULL, '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:50:02.103')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ef08099e-7ef9-40b7-bedf-1c7103282d50', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:24.247')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ef5886eb-7bad-4a85-9c90-eaf9f1a7c0f1', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-17 14:58:53.253')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ef60cf96-1c16-4900-a73a-26786e8c4e49', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:24.383')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ef9480c5-12b7-4f2e-9e60-5603da9e91bc', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:54.543')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ef96339f-b752-4645-87f9-4b2a7c2330c2', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法执行完成', NULL, 'Debug', '2017-04-25 21:04:21.897')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f0355906-2bdb-4cd4-bd27-a15723ae800b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:05:06.620')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f080224d-c423-456f-bf30-0fc13efa526b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:44.380')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f08d7ff2-400c-4001-ba07-4d87622fd60a', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:02.093')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f1c171d4-e7d2-42c3-b1e3-b3396964217b', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:13:33.967')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f332ee92-e01c-45a0-85a5-78c650d73e35', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:40.150')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f3c314d4-0747-40b1-86ab-2f5a424209af', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:47:50.877')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f44df9d7-5b0e-43b7-a9f4-751fcc9f6f05', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:23.677')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f483124b-0c0c-4ffd-bac5-cb2fc62bc89a', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:47:03.233')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f515ff77-99b1-43b8-8632-c3c3920bc527', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:51:23.760')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f61bf006-004f-415f-97ab-a1c6b0b8f874', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-07 14:27:14.207')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f6d069fa-e78f-405a-97ef-8a2aedacbeca', NULL, '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:50:02.273')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f706bc42-f904-4ecf-8d2d-eef0d73ad1d3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法开始执行', NULL, 'Debug', '2017-02-06 23:51:17.993')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f85eb93a-e282-452c-9030-74a4ec06d92b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:04:49.700')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f920aacb-f00d-45c5-90ae-0ce2d98abc34', NULL, '127.0.0.1', 'IPermissionService', '方法执行完成', NULL, 'Debug', '2017-04-25 20:13:34.447')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f95fa4d7-e024-4bfc-bfec-dec4831639d3', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IHomeShortcutService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:16.717')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('f9c8b671-e888-4b5d-8bfd-c941c0cc34b9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 10:39:54.010')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fa93c6b5-21fc-43a4-b34b-4f3ecd95a55f', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:45:32.897')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fa9a36dd-ec1c-4f01-9c7c-66b18eff62d9', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:42.527')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('faa16a9c-fa43-45e0-8d9b-904390d64f7b', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ILoggerService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:07:57.043')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fb9a8c02-0c08-4545-a609-2ba9b0d349a7', NULL, '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-26 10:02:55.367')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fbb35e28-93c9-4c61-a65d-f36c1433d68c', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基于角色的访问控制模块', '发生异常：执行超时已过期。完成操作之前已超时或服务器未响应。 ', NULL, 'Error', '2017-02-20 14:01:40.280')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fcc9d9c5-f67f-443a-9733-0c6c7537093d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '日志管理', '方法执行完成', NULL, 'Debug', '2017-02-06 23:56:32.537')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fcdf8d26-8f0a-4b55-b288-b599e4c8b243', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IPermissionService', '方法开始执行', NULL, 'Debug', '2017-04-25 21:05:36.977')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fd2724df-1bc1-458d-b81a-e524dfdc7987', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'Core', '发生异常：Client sent AUTH, but no password is set, sPort: 0, LastCommand: ', NULL, 'Error', '2017-01-26 11:13:34.690')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fd47f8c7-8fe5-4bd6-9890-7ada428fddfe', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'IDictionaryService', '方法开始执行', NULL, 'Debug', '2017-04-21 15:50:38.200')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fd91917d-a448-42e9-9367-1a0bde09a0ff', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法开始执行', NULL, 'Debug', '2017-02-06 23:56:48.940')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fde28a67-be35-48e0-a7f8-0519359018f1', NULL, '127.0.0.1', 'IUserService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:14.523')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('fe20be5e-b2b1-44b1-8d90-93bbaba0b4eb', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', '基础模块', '方法执行完成', NULL, 'Debug', '2017-02-06 23:46:56.937')
GO
INSERT INTO [dbo].[SystemLog] ([Id], [LogOnId], [LogOnIP], [ModelName], [Summary], [Details], [LogLevel], [OccurrenceDateTime])  VALUES ('ffee8daa-eaa8-4993-9f8f-8507886c584d', '48f3889c-af8d-401f-ada2-c383031af92d', '127.0.0.1', 'ISystemSettingService', '方法开始执行', NULL, 'Debug', '2017-04-25 20:24:10.410')
GO
INSERT INTO [dbo].[SystemSetting] ([Id], [ParentId], [Name], [Value], [Remark])  VALUES ('015B6ED3-B4FF-4A61-B200-59203A7DBC77', NULL, 'LogLevel', '2', '')
GO
INSERT INTO [dbo].[SystemSetting] ([Id], [ParentId], [Name], [Value], [Remark])  VALUES ('03d5f601-e11e-4a44-982b-baed7eab37a3', '6b9d4e26-8066-4fc2-bb45-fb02824be265', 'ProductVersion', '2.1', NULL)
GO
INSERT INTO [dbo].[SystemSetting] ([Id], [ParentId], [Name], [Value], [Remark])  VALUES ('6b9d4e26-8066-4fc2-bb45-fb02824be265', NULL, 'ProductName', '后台管理系统', NULL)
GO
INSERT INTO [dbo].[SystemSetting] ([Id], [ParentId], [Name], [Value], [Remark])  VALUES ('E402EAAF-B0C6-4D38-8809-B7F6FACDB051', NULL, 'WebApiDocumentUrl', 'http://127.0.0.1/FileStorage/Swagger/docs/v1', NULL)
GO
SET IDENTITY_INSERT [Dynamic].[Condition] ON;
GO
INSERT INTO [Dynamic].[Condition] ([Id], [TableName], [Column], [Op], [DictionaryKey], [ValidateRule])  VALUES (1, 'dbo.Dictionary', 'Key', 5, NULL, NULL)
GO
INSERT INTO [Dynamic].[Condition] ([Id], [TableName], [Column], [Op], [DictionaryKey], [ValidateRule])  VALUES (6, 'dbo.SystemLog', 'ModelName', 5, NULL, NULL)
GO
INSERT INTO [Dynamic].[Condition] ([Id], [TableName], [Column], [Op], [DictionaryKey], [ValidateRule])  VALUES (7, 'dbo.SystemLog', 'Summary', 5, NULL, NULL)
GO
INSERT INTO [Dynamic].[Condition] ([Id], [TableName], [Column], [Op], [DictionaryKey], [ValidateRule])  VALUES (8, 'dbo.SystemLog', 'OccurrenceDateTime', 2, NULL, 'dateOrNull')
GO
INSERT INTO [Dynamic].[Condition] ([Id], [TableName], [Column], [Op], [DictionaryKey], [ValidateRule])  VALUES (9, 'dbo.SystemLog', 'OccurrenceDateTime', 4, NULL, 'dateOrNull')
GO
SET IDENTITY_INSERT [Dynamic].[Condition] OFF;
GO
SET IDENTITY_INSERT [Dynamic].[CreateOrUpdate] ON;
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (1, 'dbo.News', 'Id', '编号', NULL, 1, NULL, NULL, 1)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (2, 'dbo.News', 'Category', '分类', NULL, 1, '新闻分类', 'notNull', 2)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (3, 'dbo.News', 'Title', '标题', NULL, 1, NULL, NULL, 3)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (4, 'dbo.News', 'Content', '内容', NULL, 1, NULL, NULL, 4)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (5, 'dbo.News', 'Status', '状态(1：待审核，2：已发布，4：已删除)', NULL, 1, NULL, NULL, 5)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (6, 'dbo.News', 'BrowseTimes', '浏览次数', NULL, 1, NULL, NULL, 6)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (7, 'dbo.News', 'PublisherId', '发布者编号', NULL, 1, NULL, NULL, 7)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (8, 'dbo.News', 'PublishDateTime', '发布时间', NULL, 1, NULL, NULL, 8)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (9, 'dbo.Dictionary', 'Id', '编号', NULL, 1, NULL, NULL, 1)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (10, 'dbo.Dictionary', 'Type', '类型', NULL, 1, NULL, 'notNull', 2)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (11, 'dbo.Dictionary', 'Key', '键', NULL, 1, NULL, 'notNull', 3)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (12, 'dbo.Dictionary', 'Value', '值', NULL, 1, NULL, 'notNull', 4)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (13, 'dbo.Dictionary', 'ParentId', '父级编号', NULL, NULL, NULL, NULL, 5)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (14, 'dbo.Dictionary', 'Sort', '排序号', NULL, 1, NULL, NULL, 6)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (15, 'dbo.Dictionary', 'Status', '状态', NULL, 1, NULL, NULL, 7)
GO
INSERT INTO [Dynamic].[CreateOrUpdate] ([Id], [TableName], [Column], [ColumnLabel], [DefaultValue], [Visible], [DictionaryKey], [ValidateRule], [Sort])  VALUES (16, 'dbo.Dictionary', 'Remark', '备注', NULL, 1, NULL, NULL, 8)
GO
SET IDENTITY_INSERT [Dynamic].[CreateOrUpdate] OFF;
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('61EA083F-6332-40B2-A603-2A5D34152F76', '个人信息', '爱好', NULL, NULL, 'Favorite', 4, '爱好', '阅读;羽毛球;乒乓球;篮球;足球;网球', NULL, 'col-sm-2', 'col-sm-8', NULL, NULL, 6, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:23:10.920', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 15:38:42.193')
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5AE10037-B407-4DF9-ABC9-438802C4516D', '个人信息', '级别', NULL, 'grp2', 'Level', 2, '级别', '程序员;助理工程师;工程师;架构师', NULL, 'col-sm-2', 'col-sm-3', NULL, NULL, 4, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:20:25.843', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 16:01:40.407')
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('770F6357-1447-48B1-A924-5F502A32A7B2', '个人信息', '毕业日期', NULL, 'grp2', 'GraduationDate', 1, '毕业日期', NULL, NULL, 'col-sm-2', 'col-sm-3', NULL, 'date', 3, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:00:29.807', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:30.283')
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('13E764C8-EFE4-4BEC-BADC-6755F4BCCDFA', '个人信息', '身份证号', NULL, 'grp1', 'idCard', 1, '身份证号', NULL, NULL, 'col-sm-2', 'col-sm-3', NULL, 'IDCard', 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 10:05:21.937', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:20.147')
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DA841B99-012A-4EB5-B092-9A2385999F56', '个人信息', ' 院校类型', NULL, NULL, 'SchoolType', 3, ' 院校类型', '211学院;非211学院', NULL, 'col-sm-2', 'col-sm-8', NULL, NULL, 5, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:22:17.610', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 15:38:29.953')
GO
INSERT INTO [Dynamic].[ExtensionProperty] ([Id], [Category], [Name], [Unit], [GroupName], [ControlId], [ControlType], [Placeholder], [ControlDataSource], [ControlMaxLength], [ControlLabelCssClass], [ControlContainerCssClass], [ControlStyle], [ControlValidateRule], [Sort], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('24987B48-C87F-43CF-AD1B-F9A01E7EF54B', '个人信息', '毕业院校', NULL, 'grp1', 'School', 1, '毕业院校', NULL, NULL, 'col-sm-2', 'col-sm-3', NULL, 'notNull', 2, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 13:51:56.460', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:25.270')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('CED90D16-46E3-4D61-BAC0-2AAFEC43B58D', 'DA841B99-012A-4EB5-B092-9A2385999F56', '48f3889c-af8d-401f-ada2-c383031af92d', '非211学院')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('8A81B25E-0CD1-4EF9-9C51-2EDF15CF93DB', '13E764C8-EFE4-4BEC-BADC-6755F4BCCDFA', '48f3889c-af8d-401f-ada2-c383031af92d', '420922198303143415')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('86007476-F3D3-4940-A4F4-46D104B22378', '61EA083F-6332-40B2-A603-2A5D34152F76', '48f3889c-af8d-401f-ada2-c383031af92d', '阅读,羽毛球,乒乓球,足球')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('56D2FB24-8F71-4E7E-8657-4CA141AA93AB', '5AE10037-B407-4DF9-ABC9-438802C4516D', '48f3889c-af8d-401f-ada2-c383031af92d', '架构师')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('964400A4-5BF7-42A2-972C-99C237A37C52', '24987B48-C87F-43CF-AD1B-F9A01E7EF54B', '48f3889c-af8d-401f-ada2-c383031af92d', '武汉科技大学城市学院')
GO
INSERT INTO [Dynamic].[ExtensionPropertyInstance] ([Id], [ExtensionPropertyId], [BusinessSerialNumber], [Value])  VALUES ('C5697818-F103-4117-B753-DDBCF0692E5F', '770F6357-1447-48B1-A924-5F502A32A7B2', '48f3889c-af8d-401f-ada2-c383031af92d', '2008-06-02')
GO
SET IDENTITY_INSERT [Dynamic].[Order] ON;
GO
INSERT INTO [Dynamic].[Order] ([Id], [TableName], [Column], [OrderBy])  VALUES (6, 'dbo.SystemLog', 'OccurrenceDateTime', 1)
GO
SET IDENTITY_INSERT [Dynamic].[Order] OFF;
GO
SET IDENTITY_INSERT [Dynamic].[Search] ON;
GO
INSERT INTO [Dynamic].[Search] ([Id], [TableName], [Title], [SortColumns], [VisibleColumns])  VALUES (1, 'dbo.Dictionary', NULL, 'Id,Type,Key,Value,ParentId,Sort,Status,Remark', 'Id,Type,Key,Value,Sort,Status,Remark')
GO
INSERT INTO [Dynamic].[Search] ([Id], [TableName], [Title], [SortColumns], [VisibleColumns])  VALUES (2, 'dbo.SystemLog', NULL, 'Id,LogOnId,LogOnIP,ModelName,Summary,Details,LogLevel,OccurrenceDateTime', 'Id,LogOnId,LogOnIP,ModelName,Summary,LogLevel,OccurrenceDateTime')
GO
SET IDENTITY_INSERT [Dynamic].[Search] OFF;
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('020e2c2a-e203-4694-85ef-c73bd301ad72', '备份', '备份', 'glyphicon glyphicon-download-alt', 'OnBackup', 32, '工具栏', '数据库备份', 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:56:09.410')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('067b2de9-037f-4bb9-8a41-285eb3fc7267', '编辑', '编辑', 'glyphicon glyphicon-edit', 'OnEdit', 2, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-28 00:01:55.903')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0e8c3c59-586a-48a0-a1ef-5a83f4a2d6fd', '恢复', '恢复', 'glyphicon glyphicon-open', 'OnRecover', 33, '工具栏', '还原恢复数据库', 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:56:19.470')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('13f9189c-ccbe-4e4a-8292-d408fa8d119f', '导入', '导入', 'glyphicon glyphicon-import', 'OnImport', 5, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:44:41.430')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('1b88ce60-6438-4bb9-891d-c0bf4832e2d5', '设置', '设置', 'glyphicon glyphicon-cog', 'OnSetting', 7, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:01.670')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2e5d2d97-1367-4036-8040-cfcd261e9e5f', '锁定', '锁定', 'glyphicon glyphicon-lock', 'OnLock', 22, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:12.960')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2f1a1ba6-276e-4e7f-a219-ecfdb50e63fb', '发布', '发布', 'glyphicon glyphicon-globe', 'OnPublish', 18, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:36.663')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3194373e-1b97-4c92-9cd2-4778b00c3b13', '清空', '清空', 'glyphicon glyphicon-trash', 'OnClear', 26, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:07.433')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('42cef74b-2c60-4d62-93b8-d0f6d16ca3b0', '上传', '上传', 'glyphicon glyphicon-cloud-upload', 'OnUpload', 9, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:21.980')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('43334b34-f78e-4187-ad2f-1600bb932896', '复制', '复制', 'fa fa-copy', 'OnCopy', 11, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:40.533')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('43334b34-f78e-4187-ad2f-1610bb912896', '打印', '打印', 'glyphicon glyphicon-print', 'OnPrint', 13, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:00.973')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('43334b34-f78e-4187-ad2f-1610bb932896', '还原', '还原', 'fa fa-mail-reply', 'OnRestore', 12, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:48.883')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('58d19434-705a-4199-acdc-b6d0322501bf', '下载', '下载', 'glyphicon glyphicon-cloud-download', 'OnDownload', 10, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:31.510')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('73f60b12-fc1f-4927-9803-616fef6ed1b7', '授权', '授权', 'glyphicon glyphicon-thumbs-up', 'OnAccredit', 23, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:24.513')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('79a3ec54-3c07-4204-bfc6-5b1f111474b3', '刷新', '刷新', 'glyphicon glyphicon-refresh', 'OnRefresh', 21, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:51:58.763')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('79a3ec54-3c07-4204-bfc6-5b7f111474b3', '浏览', '浏览', 'fa fa-unlink', 'OnBrowse', 20, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:51:02.440')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7e33c9ec-7573-450b-aa4f-c52771ebdd3c', '升级', '升级', 'fa fa-upload', 'OnUpgrade', 17, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:20.667')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7f6e3c60-4ac5-4c59-a15d-40832b353423', '保存', '保存', 'glyphicon glyphicon-floppy-save', 'OnSave', 27, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:18.890')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a08fee4b-98c1-4974-be4a-5dbcc0820cbd', '添加', '添加', 'glyphicon glyphicon-plus-sign', 'OnCreate', 1, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-05 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-28 14:13:19.600')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a7400cab-6e80-47cd-9cca-e3de79cba1c3', '成员管理', '成员管理', 'fa fa-group', 'OnAllotMember', 31, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:55:57.463')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a7e78077-5c3a-4705-8c58-4c4e696ee201', '取消', '取消', 'glyphicon glyphicon-floppy-remove', 'OnCancel', 28, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:49.403')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b0482c2d-b466-4d05-beb2-45b2bd7981c4', '帮助', '帮助', 'glyphicon glyphicon-question-sign', 'OnHelp', 19, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:49.657')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B2130A78-8B54-4F87-8261-CD5BDCD07F9B', '预览', '预览', 'glyphicon glyphicon-eye-open', 'OnPreview', 34, '工具栏', '预览', 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:01:30.150', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:04:35.100')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('bc43a78e-2952-4a61-ab1d-e57c2bfa3953', '详细', '详细', 'fa fa-newspaper-o', 'OnShowDetail', 29, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-09 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:54:06.897')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c44ae1e3-8c46-474f-a2a3-517bdf39d68d', '权限管理', '权限管理', 'glyphicon glyphicon-tower', 'OnAllotAuthority', 25, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:54.340')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c9df5a92-ed50-4a8d-9f5c-765b5c15e3bc', '发送', '发送', 'glyphicon glyphicon-send', 'OnSend', 14, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:09.807')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('cd2e937e-7f3a-4823-958b-2acab4711f08', '举报', '举报', 'glyphicon glyphicon-phone-alt', 'OnReport', 16, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:30.160')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('cfa9fe4b-a30c-43fe-b73d-df02516c2e07', '按钮管理', '按钮管理', 'fa fa-cogs', 'OnAllotButtons', 24, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:41.293')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d10be9f7-2382-4336-90ed-60193eb80382', '返回', '返回', 'glyphicon glyphicon-chevron-left', 'OnBack', 15, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:18.143')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d6cdbfd6-017b-4639-8c2d-6fb63174b0a5', '删除', '删除', 'glyphicon glyphicon-remove-sign', 'OnDelete', 3, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-22 14:34:53.150')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d8680d5e-0c3a-41f0-a1d1-dd5152b3014c', '审核', '审核', 'glyphicon glyphicon-check', 'OnAudit', 8, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:13.640')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e452d1ef-bde7-4f66-a525-4067a4ec7e49', '查询', '查询', 'glyphicon glyphicon-search', 'OnSearch', 4, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:44:31.137')
GO
INSERT INTO [RBAC].[Button] ([Id], [Name], [Title], [Image], [Code], [Sort], [Category], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e7f33901-604c-4a51-b122-e6529066983c', '导出', '导出', 'glyphicon glyphicon-export', 'OnExport', 6, '工具栏', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-27 13:51:41.667')
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark])  VALUES ('2DB04F75-FC78-40E6-A401-C9E6D660F092', '48f3889c-af8d-401f-ada2-c383031af92d', '系统管理', '/Console/Home/Index', 'href', 'glyphicon glyphicon-cog', 3, NULL)
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark])  VALUES ('40abb9d3-219a-4469-9ce5-40c4eb088b0a', '48f3889c-af8d-401f-ada2-c383031af92d', '个人信息', '/Admin/User/ViewDetails', 'Iframe', 'glyphicon glyphicon-user', 2, NULL)
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark])  VALUES ('CA7DA27F-9A23-4A8A-9E13-9AFCA175729C', '48f3889c-af8d-401f-ada2-c383031af92d', 'Web Api文档', '/Swagger/ui/index', 'Open', 'glyphicon glyphicon-book', 5, NULL)
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark])  VALUES ('d3973803-c2bd-4e16-be0d-cd26673ba0dd', '48f3889c-af8d-401f-ada2-c383031af92d', '菜单管理', '/Admin/SystemMenu/Index', 'Iframe', 'fa fa-sitemap', 1, '菜单管理页')
GO
INSERT INTO [RBAC].[HomeShortcut] ([Id], [UserId], [Name], [NavigateUrl], [Target], [Image], [Sort], [Remark])  VALUES ('EB673350-ADA7-4F33-8872-292E127BAEAA', '48f3889c-af8d-401f-ada2-c383031af92d', '控制台', '/Console/Home/Index', 'href', 'fa fa-desktop', 4, '控制台')
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('50578619-6939-4F6D-B421-9176E76ADBC0', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1002', '财务部', NULL, NULL, '75e1f7a2-74ab-4d21-af74-a601f30f02ee', NULL, NULL, NULL, NULL, 2, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:43.513', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:51.693')
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1003', '互联网金融部', NULL, NULL, '23e714a9-33c6-49bb-be10-0fd455b5f0ad', NULL, NULL, NULL, NULL, 3, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:55:41.870', NULL, NULL)
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1001', '人力资源部', NULL, NULL, '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', NULL, NULL, NULL, NULL, 1, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:07.437', NULL, NULL)
GO
INSERT INTO [RBAC].[Organization] ([Id], [ParentId], [Code], [Name], [InnerPhone], [OuterPhone], [Manager], [AssistantManager], [Fax], [ZipCode], [Address], [Sort], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('77B51251-0D00-45F9-A39F-8B853E8F812D', '0', '1000', '武汉星云资本管理有限公司', NULL, NULL, '094f85f8-bc53-4247-979c-09da591d51b0', NULL, NULL, '000000', NULL, 1, NULL, 1, NULL, '2013-04-11 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:10:27.363')
GO
INSERT INTO [RBAC].[Role] ([Id], [ParentId], [Name], [Permissions], [Sort], [Remark], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d0533453-9cf8-459c-b28c-98cf397efaf1', '0', '管理员', '[{ "Url": "/Home/Index", "Name": "后台", "Title": "后台", "Image": null, "Category": "2", "Id": "010B7B7D-9FFD-4C5B-A2EF-502AF100C193", "ParentId": "0", "Button": null }, { "Url": "/Home/Workstation", "Name": "工作台", "Title": "工作台", "Image": null, "Category": "2", "Id": "1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51", "ParentId": "010B7B7D-9FFD-4C5B-A2EF-502AF100C193", "Button": null }, { "Url": "/Admin/SystemMenu/Index", "Name": "菜单导航", "Title": "菜单导航", "Image": "sitemap.png", "Category": "1", "Id": "3885ba7f-c246-493f-9053-7aa70a642662", "ParentId": "3e544d7a-d850-4785-9648-feafc4698a3b", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"按钮管理", "Title":"按钮管理", "Image":"fa fa-cogs", "Code":"OnAllotButtons" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/WebApi/User/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "40B4656C-B442-46CE-9B97-B2DD2C38FC2F", "ParentId": "c2947a69-fc79-4861-92ea-87361d8b5715", "Button": null }, { "Url": "/Admin/Logger/ViewDetails", "Name": "查看日志", "Title": "查看日志", "Image": null, "Category": "2", "Id": "5387435A-D258-4C2C-BB23-4A97D17EF177", "ParentId": "ee5e52c8-aa02-459c-a6eb-311b6a33ddf6", "Button": null }, { "Url": "/Admin/Dictionary/Index", "Name": "字典管理", "Title": "字典管理", "Image": "4999_credit.png", "Category": "1", "Id": "58e86c4c-8022-4d30-95d5-b3d0eedcc878", "ParentId": "55ef2c2f-0642-4448-b7f8-0351f4e00ea1", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/Role/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "6D94B77D-2793-444D-BDE4-36E59558886C", "ParentId": "545d2450-4dac-4377-afbe-d9aa451f795f", "Button": null }, { "Url": "/WebApi/Role/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4", "ParentId": "6a8044e3-d6ae-406c-a281-5e4d3ba44f67", "Button": null }, { "Url": "/Dynamic/ExtensionProperty/CreateOrUpdate", "Name": "添加或修改信息", "Title": "添加或修改信息", "Image": null, "Category": "2", "Id": "7A044068-395B-4569-AD29-BB582DF14959", "ParentId": "9606167a-fd94-4ad6-88b8-1b419dc3410e", "Button": null }, { "Url": "/Dynamic/Configuration/Index", "Name": "数据管理", "Title": "数据管理", "Image": "glyphicon glyphicon-random", "Category": "1", "Id": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "ParentId": "7dfdf495-83fe-4194-a042-35fe28c2e36b", "Button": null }, { "Url": "/Admin/User/ChangePassword", "Name": "修改密码", "Title": "修改密码", "Image": null, "Category": "2", "Id": "946E9D24-BAF1-4A04-BB18-FC8C8257C1F8", "ParentId": "04782509-7aa5-446d-b63f-eac068c4c05a", "Button": null }, { "Url": "/Admin/Dictionary/CreateOrUpdate", "Name": "添加或修改字典", "Title": "添加或修改字典", "Image": null, "Category": "2", "Id": "9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4", "ParentId": "58e86c4c-8022-4d30-95d5-b3d0eedcc878", "Button": null }, { "Url": "/Admin/HomeShortcut/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "AFB74C98-DDEA-496F-AF5D-BCC613AEB88D", "ParentId": "40178207-f2f2-44de-95bc-b5b4beb69e49", "Button": null }, { "Url": "/Dynamic/Configuration/ShowSearchConfig", "Name": "查询配置", "Title": "查询配置", "Image": null, "Category": "2", "Id": "B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/Admin/SystemMenu/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": "153.png", "Category": "2", "Id": "bd959bfa-797c-48ff-b72b-241c84cd03a8", "ParentId": "3885ba7f-c246-493f-9053-7aa70a642662", "Button": null }, { "Url": "/Admin/Globalization/CreateOrUpdateLocalResource", "Name": "添加或编辑视图资源", "Title": "添加或编辑视图资源", "Image": null, "Category": "2", "Id": "D6895A53-773B-44A7-9D8E-F8F98D5E7E1D", "ParentId": "a5c7ffb2-c271-4b77-952b-a1d0f7f385c2", "Button": null }, { "Url": "/Admin/Organization/CreateOrUpdate", "Name": "添加或修改信息", "Title": "添加或修改信息", "Image": null, "Category": "2", "Id": "D6991F8E-677B-454F-9B33-E6696636773A", "ParentId": "e620450b-6d17-4192-bee0-66fbd114e82a", "Button": null }, { "Url": "/Admin/User/Departments", "Name": " 所属部门", "Title": " 所属部门", "Image": null, "Category": "2", "Id": "d6bbc0e4-a5bc-4bc8-af1f-186371c06228", "ParentId": "8fcead5e-991a-4904-99ac-2c9d9269040b", "Button": null }, { "Url": "/WebApi/Route/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "DCACA23C-645A-4D7B-B945-8DA15EBCF214", "ParentId": "bd745be7-c7b5-43d2-84c0-8890d7dd5e92", "Button": null }, { "Url": "/Admin/Button/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "DF7C758E-F021-45A4-A3CE-B870CD343A3D", "ParentId": "5c5ce6bd-44dc-4903-b1f8-a510ce332c76", "Button": null }, { "Url": "/Admin/SystemSetting/ShowCaches", "Name": "查看缓存", "Title": "查看缓存", "Image": null, "Category": "2", "Id": "F4FEFFFB-763C-46EC-AEF6-A9EB581EF148", "ParentId": "758429ec-3ae9-4a9e-a994-efe7c5395b4a", "Button": null }, { "Url": "/Admin/SystemMenu/AllotButtons", "Name": "分配按钮", "Title": "分配按钮", "Image": null, "Category": "2", "Id": "efc5fd8f-9a4b-49da-a8ec-bfcd77887a56", "ParentId": "3885ba7f-c246-493f-9053-7aa70a642662", "Button": null }, { "Url": "/Dynamic/Configuration/ShowCreateOrUpdateConfig", "Name": "添加或编辑数据", "Title": "添加或编辑数据", "Image": null, "Category": "2", "Id": "E304E93B-EBBA-4C06-A573-58F856F5E0B0", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/Home/OperationRecords", "Name": "查看日志", "Title": "查看日志", "Image": null, "Category": "2", "Id": "E3167219-99BE-4F58-9DD4-F7A5AE14F2E7", "ParentId": "010B7B7D-9FFD-4C5B-A2EF-502AF100C193", "Button": null }, { "Url": "/Admin/Globalization/CreateOrUpdateGlobalResource", "Name": "添加或编辑全局资源", "Title": "添加或编辑全局资源", "Image": null, "Category": "2", "Id": "C6804680-1D26-4789-964E-4F0AE673B1F4", "ParentId": "a5c7ffb2-c271-4b77-952b-a1d0f7f385c2", "Button": null }, { "Url": "/Admin/User/Users", "Name": " 用户列表", "Title": " 用户列表", "Image": null, "Category": "2", "Id": "bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9", "ParentId": "8fcead5e-991a-4904-99ac-2c9d9269040b", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"锁定", "Title":"锁定", "Image":"glyphicon glyphicon-lock", "Code":"OnLock" }, { "Name":"授权", "Title":"授权", "Image":"glyphicon glyphicon-thumbs-up", "Code":"OnAccredit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" }, { "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/Globalization/Index", "Name": "资源管理", "Title": "资源管理", "Image": "625.png", "Category": "1", "Id": "a5c7ffb2-c271-4b77-952b-a1d0f7f385c2", "ParentId": "55ef2c2f-0642-4448-b7f8-0351f4e00ea1", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Dynamic/ExtensionProperty/Index", "Name": "动态属性", "Title": "动态属性", "Image": null, "Category": "1", "Id": "9606167a-fd94-4ad6-88b8-1b419dc3410e", "ParentId": "7dfdf495-83fe-4194-a042-35fe28c2e36b", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/Role/Index", "Name": "角色管理", "Title": "角色管理", "Image": "20130508035646751_easyicon_net_32.png", "Category": "1", "Id": "545d2450-4dac-4377-afbe-d9aa451f795f", "ParentId": "3e544d7a-d850-4785-9648-feafc4698a3b", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"成员管理", "Title":"成员管理", "Image":"fa fa-group", "Code":"OnAllotMember" }, { "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" }, { "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/WebApi/Role/AllotMembers", "Name": "分配成员", "Title": "分配成员", "Image": null, "Category": "2", "Id": "45ED8AA9-18AA-4B35-AA3F-90172C99D2E6", "ParentId": "6a8044e3-d6ae-406c-a281-5e4d3ba44f67", "Button": null }, { "Url": "/Admin/Role/AllotMembers", "Name": "分配角色成员", "Title": "分配角色成员", "Image": null, "Category": "2", "Id": "4BEBBCA0-66DB-46E8-A8BA-3389991888D6", "ParentId": "545d2450-4dac-4377-afbe-d9aa451f795f", "Button": null }, { "Url": "/Admin/Dictionary/CreateOrUpdateCategory", "Name": "添加或修改字典分类", "Title": "添加或修改字典分类", "Image": null, "Category": "2", "Id": "31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2", "ParentId": "58e86c4c-8022-4d30-95d5-b3d0eedcc878", "Button": null }, { "Url": "/Admin/User/ViewDetails", "Name": "个人信息", "Title": "个人信息", "Image": "387.png", "Category": "1", "Id": "04782509-7aa5-446d-b63f-eac068c4c05a", "ParentId": "a63a0ca2-f2a7-4d27-bffa-67e548513df1", "Button": null }, { "Url": "/Admin/User/CreateOrUpdate", "Name": "添加或编辑信息", "Title": "添加或编辑信息", "Image": null, "Category": "2", "Id": "41B85D12-882E-409E-B355-5BA0640047AE", "ParentId": "8fcead5e-991a-4904-99ac-2c9d9269040b", "Button": null }, { "Url": "/Admin/Role/AllotPermissions", "Name": "分配角色权限", "Title": "分配角色权限", "Image": null, "Category": "2", "Id": "810a72f0-55d3-468f-8653-10d1b06a4234", "ParentId": "545d2450-4dac-4377-afbe-d9aa451f795f", "Buttons":[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" }, { "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }] }, { "Url": "/Dynamic/Configuration/ShowColumns", "Name": "列注释管理", "Title": "列注释管理", "Image": null, "Category": "2", "Id": "62E80369-FE9E-4AAF-97CD-330CDCC3A393", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/WebApi/Role/AllotPermissions", "Name": "分配权限", "Title": "分配权限", "Image": null, "Category": "2", "Id": "c8f3a73a-7b35-4d3a-916e-0d5992a670bc", "ParentId": "6a8044e3-d6ae-406c-a281-5e4d3ba44f67", "Buttons":[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" }, { "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }] }, { "Url": "/Admin/Button/Index", "Name": "按钮管理", "Title": "按钮管理", "Image": "567.png", "Category": "1", "Id": "5c5ce6bd-44dc-4903-b1f8-a510ce332c76", "ParentId": "3e544d7a-d850-4785-9648-feafc4698a3b", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/WebApi/Role/ViewPermissions", "Name": "查看权限", "Title": "查看权限", "Image": null, "Category": "2", "Id": "8BB151BA-82C7-4E29-9280-23A182026347", "ParentId": "6a8044e3-d6ae-406c-a281-5e4d3ba44f67", "Button": null }, { "Url": "/Admin/HomeShortcut/Index", "Name": "首页快捷方式", "Title": "首页快捷方式", "Image": "637.png", "Category": "1", "Id": "40178207-f2f2-44de-95bc-b5b4beb69e49", "ParentId": "a63a0ca2-f2a7-4d27-bffa-67e548513df1", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/User/AllotPermissions", "Name": "分配权限", "Title": "分配权限", "Image": null, "Category": "2", "Id": "5894638F-82FD-42E1-97B9-E3F7320A8C5C", "ParentId": "8fcead5e-991a-4904-99ac-2c9d9269040b", "Buttons":[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" }, { "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }] }, { "Url": "/Dynamic/Core/Index", "Name": "数据显示页", "Title": "数据显示页", "Image": null, "Category": "2", "Id": "0D651E28-A260-43E6-A7BF-522909D96D81", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/Admin/Role/ViewPermissions", "Name": "查看角色权限", "Title": "查看角色权限", "Image": null, "Category": "2", "Id": "02b48102-4e8a-44fb-84a0-7a8c8535676a", "ParentId": "545d2450-4dac-4377-afbe-d9aa451f795f", "Button": null }, { "Url": "#", "Name": "WebApi权限管理", "Title": "WebApi权限管理", "Image": "glyphicon glyphicon-cloud", "Category": "1", "Id": "ea6da9bc-7ccb-415f-b037-a8e28fb2db35", "ParentId": "3e544d7a-d850-4785-9648-feafc4698a3b", "Button": null }, { "Url": "/Admin/Logger/Index", "Name": "日志管理", "Title": "日志管理", "Image": "4937_administrative-docs.png", "Category": "1", "Id": "ee5e52c8-aa02-459c-a6eb-311b6a33ddf6", "ParentId": "55ef2c2f-0642-4448-b7f8-0351f4e00ea1", "Button": null }, { "Url": "/Admin/User/ViewDetails", "Name": "查看用户详情", "Title": "查看用户详情", "Image": null, "Category": "2", "Id": "DFC4EA95-B7D1-41F9-821A-5C5521E1CF04", "ParentId": "8fcead5e-991a-4904-99ac-2c9d9269040b", "Button": null }, { "Url": "/Dynamic/Core/CreateOrUpdate", "Name": "添加或编辑数据", "Title": "添加或编辑数据", "Image": null, "Category": "2", "Id": "C4E02B4F-725F-4415-8FAF-BC48BD8267BE", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/Dynamic/Core/ViewDetail", "Name": "查看数据详情", "Title": "查看数据详情", "Image": null, "Category": "2", "Id": "AA6F85E5-E048-4841-AD0B-72AAFCB37524", "ParentId": "87b0202d-d6bd-4179-86e7-b1121ddfd0d7", "Button": null }, { "Url": "/Admin/SystemSetting/Index", "Name": "系统设置", "Title": "系统设置", "Image": "4968_config.png", "Category": "1", "Id": "758429ec-3ae9-4a9e-a994-efe7c5395b4a", "ParentId": "55ef2c2f-0642-4448-b7f8-0351f4e00ea1", "Button": null }, { "Url": "/WebApi/User/Index", "Name": "用户管理", "Title": "用户管理", "Image": "glyphicon glyphicon-user", "Category": "1", "Id": "c2947a69-fc79-4861-92ea-87361d8b5715", "ParentId": "ea6da9bc-7ccb-415f-b037-a8e28fb2db35", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"锁定", "Title":"锁定", "Image":"glyphicon glyphicon-lock", "Code":"OnLock" }, { "Name":"授权", "Title":"授权", "Image":"glyphicon glyphicon-thumbs-up", "Code":"OnAccredit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/User/Index", "Name": "用户管理", "Title": "用户管理", "Image": "userregedit.png", "Category": "1", "Id": "8fcead5e-991a-4904-99ac-2c9d9269040b", "ParentId": "CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1", "Button": null }, { "Url": "/WebApi/Role/Index", "Name": "角色管理", "Title": "角色管理", "Image": null, "Category": "1", "Id": "6a8044e3-d6ae-406c-a281-5e4d3ba44f67", "ParentId": "ea6da9bc-7ccb-415f-b037-a8e28fb2db35", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"成员管理", "Title":"成员管理", "Image":"fa fa-group", "Code":"OnAllotMember" }, { "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" }, { "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/Admin/Organization/Index", "Name": "部门管理", "Title": "部门管理", "Image": "20130508035912738_easyicon_net_32.png", "Category": "1", "Id": "e620450b-6d17-4192-bee0-66fbd114e82a", "ParentId": "CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "/WebApi/Route/Index", "Name": "路由规则", "Title": "路由规则", "Image": null, "Category": "1", "Id": "bd745be7-c7b5-43d2-84c0-8890d7dd5e92", "ParentId": "ea6da9bc-7ccb-415f-b037-a8e28fb2db35", "Buttons":[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" }, { "Name":"刷新", "Title":"刷新", "Image":"glyphicon glyphicon-refresh", "Code":"OnRefresh" }, { "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" }, { "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }] }, { "Url": "#", "Name": "动态页", "Title": "动态页", "Image": "fa fa-bolt", "Category": "1", "Id": "7dfdf495-83fe-4194-a042-35fe28c2e36b", "ParentId": "0", "Button": null }]', 1, '管理员所在角色。', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-10 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-08-22 15:52:13.677')
GO
INSERT INTO [RBAC].[Role] ([Id], [ParentId], [Name], [Permissions], [Sort], [Remark], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ecff6bc6-8024-43cf-810c-c58604403a76', '0', '普通员工', NULL, 2, '普通员工', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:44:58.793', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-25 16:51:28.520')
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('008FCE8B-DE1E-483D-8256-94D1A8A1FC62', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('021CC91D-AEE7-489C-BEAE-C07AD32945FA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0342EDAA-7AD3-4279-AE48-81C928CEF7D2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8884d6af-28ed-466d-9cb1-1a2d55dd12da', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('04B48C19-CB5B-4997-ABB3-4B3659F9C525', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '810a72f0-55d3-468f-8653-10d1b06a4234', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('064D75F0-2E65-4651-B2E2-DF460244D327', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('06965535-1DC1-401B-8107-90767E35B253', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'df3bb11c-3907-49cf-a091-f9f77b63ed7d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('07F701FF-F879-45F5-9840-5A5ABD84B788', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '40B4656C-B442-46CE-9B97-B2DD2C38FC2F', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('084E81E3-4377-40AA-9652-A58E6F5C2BCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '737a0a1c-d547-441c-a1db-46b79eb12038', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0CCB16D5-12AC-408F-95CD-7F101A4D0884', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '35bf2cc9-a986-4f5d-816c-87fdb062c0b9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0f64f239-188b-498f-894f-6fc6f0a7449d', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0F9BA867-BE85-4D52-8F77-84FF1C3D330D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'cc91e8f6-b7ff-4c73-b934-302ad3398922', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0FD11812-AD5A-4709-81A1-9E6B62A27C56', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('142BDB0C-E471-4D53-964B-C4F91972537D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('142EE402-04EB-461B-9AF8-8CA7CD2AB967', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('14886A17-12BA-4DA7-980D-17E736F1F372', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('17F865FD-4D46-4B6C-A1D5-B20CE702DF7E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '545d2450-4dac-4377-afbe-d9aa451f795f', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('187DA490-8D6B-4845-A110-1E291393269A', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f367dc71-5918-45fd-a4bf-84c0091f18e7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('19ae1d94-e3a0-4e2f-8ed6-d9865a411bae', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '7961fd3c-6f0e-496c-a656-772742e14d5a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2093eb87-1ffd-439c-940f-7b417588245b', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '3885ba7f-c246-493f-9053-7aa70a642662', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('20CD532D-6090-42BB-9337-72B72B1FBB63', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('20F5FB7A-03ED-411C-BCB4-0E621396FE9D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '49CE8797-0DD0-49AB-8378-ADDD948810C7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('21EE05FF-5EF3-4ABB-90D3-E5F1C2FA47E0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('242740f5-7a68-4051-b338-2b47aaa21f0f', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('24420406-B9FD-487E-B2D2-2D276AAC15A1', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('25904A33-05BB-4DD2-BE10-AF9B7B97BC22', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd84d5f23-9220-4ad5-ac66-fef7e303e819', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('26744dde-eea0-434f-8b61-84fd067627a6', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bd959bfa-797c-48ff-b72b-241c84cd03a8', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('276A63BF-475A-4C2E-AFF2-CCA34C532D39', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2AB445EE-7728-43CF-AF78-86716319C651', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D710C465-73AD-4B45-881B-267B53CCC052', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2d68e4f5-3374-4df9-8de9-a17b2181da3a', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '3e544d7a-d850-4785-9648-feafc4698a3b', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2E9A0610-72B2-4973-A33C-909881568D3C', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2F197470-9171-4D69-A81D-EEDD6CA3E319', 'ecff6bc6-8024-43cf-810c-c58604403a76', '946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('30bc5f86-cea2-4072-b96f-cf1f8cbfe057', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3369D962-4E19-4F6C-9FC7-DBC72C17A595', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('33E026EA-61AF-4CBE-AE92-2F989CA374C3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3485815E-9C48-459D-AD74-9EE9B82BC2EA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('367168C1-4133-4B95-A7E4-A7E3B5A59C22', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('37810E46-21D6-4559-BFAF-FBED500BF89D', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('37F1D91B-53EF-41A8-A91B-7E65B8174FFA', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3879A581-DFFB-4F23-895F-F62C75FB438B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c191de03-6b68-4e9e-8c5e-ff17aeca341d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('391A61FF-7D55-46D6-BAFA-0C859BBEDD23', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3B4861CF-7E4D-4760-BD85-349B590ADE94', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3B65E5B8-5459-431F-B7EC-AAFF612DC139', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '41B85D12-882E-409E-B355-5BA0640047AE', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3B8CDFC6-9FD3-4BCC-BC20-B4E21E44D3D9', 'ecff6bc6-8024-43cf-810c-c58604403a76', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3BC108B7-60BE-442C-8362-521AD479AEC6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3BC632D4-3877-40D2-B60E-56A377AB3B71', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '77508b76-d17c-4c08-bd9b-cf2d6ce832c6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3C5D8137-7710-47C3-BD6E-E76B4ABF356B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0D651E28-A260-43E6-A7BF-522909D96D81', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3DA20886-F98B-4193-9815-CB7080A037CE', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('47B1BE71-20B8-4D96-B3E0-A07834E42BD9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('4D18F5F3-D8D1-48D3-BC8E-5B9F3B30D246', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '123d862c-7965-40c1-bd9b-158582f8bb78', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('4F9FFD75-E5B0-44A0-A0CA-B266B6B51EB2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7A044068-395B-4569-AD29-BB582DF14959', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5040AB7F-8E6D-47D0-8AD2-E7DDF2F8F214', 'ecff6bc6-8024-43cf-810c-c58604403a76', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('54CA9D9F-2949-46BE-9977-CA64FB4B1C0E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b1d87254-b0ef-4a50-b427-ca0484e4516b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('564E5D5C-BCB7-4835-92CC-4D798F93B829', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('592AE76A-1E26-49A3-8FCA-D757A42A67F0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '57FA8412-AC93-4E3B-B75C-D9A52EC71695', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('594513BF-76C6-4473-ACB8-4979B6740647', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bd959bfa-797c-48ff-b72b-241c84cd03a8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5c048c5c-efaa-4a18-8667-e5d3bd1e3b77', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bc011009-243a-4ca4-a52a-1429c92d1867', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5ef25835-91c1-4385-9fb8-27797fc5079d', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5F1E6FCA-8558-4DA9-9259-0F689AE028E6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5F865102-3E54-4652-8866-D0529C87A6A0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c546a78a-7f0d-4cd9-a9ed-96548acb8910', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6016C154-35D0-4D16-9DE7-E22E37591BD6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6D94B77D-2793-444D-BDE4-36E59558886C', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('606E6DC0-0BDC-45E1-84AE-BC2F305835B9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6169B963-57CA-4066-A337-E8A77D34E1B4', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6314EB48-0534-450D-AA72-528054872421', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6433011B-40E1-425C-B71C-0BD637B58EEE', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6618D01B-5B6B-43D9-9D84-E2EFF9F6FFB5', 'ecff6bc6-8024-43cf-810c-c58604403a76', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('66AB3416-1503-4E10-892D-0699CA785DC3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6834feb1-ad02-4182-a110-3a3b5fa19231', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6897a773-a79f-4154-9d9d-b0db6febca95', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'a3959557-b2ab-4fbc-8942-f72c52dfe972', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6cfd93b7-af88-4046-9f84-5300715b3d3c', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '805d0b61-ba00-4b77-b367-a0d309694258', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6F418A63-C9B2-443D-B6F3-85D2F6B4200E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '3e544d7a-d850-4785-9648-feafc4698a3b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6FF2DEA3-BE88-4332-B37A-F4E25C1A6681', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f5e0b9d9-5b99-4649-809e-b326dc012f77', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('72C2D544-C87C-4FE0-86DD-74D2FDB05EDD', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7315A43F-659B-49E3-AEC1-3B1A713F2728', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7961fd3c-6f0e-496c-a656-772742e14d5a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('73917dbf-7b5c-4970-9bb5-6ef1da7ccc86', '18c84947-438c-4987-b556-1c132b1c8be3', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-02-25 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('73BBC236-75BF-4DDF-947F-F0C46EE51E1B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '4BEBBCA0-66DB-46E8-A8BA-3389991888D6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('76410DFC-BE5E-4DDE-BBA4-B5E2F28AB784', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7dcdf6fd-346a-4e4c-ba29-dcddac52f417', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7742D6A6-9DB4-4546-80ED-372D36EDFD72', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DCACA23C-645A-4D7B-B945-8DA15EBCF214', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('785D567A-FCC8-4D46-9765-3C93442623F0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('788BA2C7-02B2-474F-9F7E-3A7DDB6BCBD6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7a066a3b-4eff-49e7-8777-1015114526e5', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7A636E16-5FC5-4BE8-AA7A-F536124325B3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7C3BD56E-323D-455F-BDD5-ADFF63195CCB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c2947a69-fc79-4861-92ea-87361d8b5715', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7cdb5f1c-1d24-44c8-a07a-c9154ee6155f', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7E50D90D-472C-49E1-BE9E-02C33583704C', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ed192e6f-9a49-402b-890b-c46da5468023', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('82C4A2FF-DA0A-4B5E-90E2-49074432C3DB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd396873e-ec5b-4c44-919a-7d206cd0cc90', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8406341E-7D8F-4355-BB55-D9CEFFBC07A1', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DF7C758E-F021-45A4-A3CE-B870CD343A3D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('85092D2C-5876-4070-8FE8-0E763743BFD0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('86D084EB-15DD-4E0D-887E-CDC7EE1A4E9F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('873D7378-42B1-4176-87AA-04F8A8BF9AC2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'AA6F85E5-E048-4841-AD0B-72AAFCB37524', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('879E6947-E46D-4E5D-A2E1-9565BE260C4A', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fc08d048-2ff8-4948-b1b4-876c561bb8d7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('884AE272-D9F9-4BFA-9912-C97DCC570C3E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '269bf251-0579-428d-811a-75be20089161', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('89a646cb-fa74-4d0a-bd36-675314eada03', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8C5E2CC0-A01E-4502-9DA4-1B7E234A13B1', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8D3C3988-4E55-41E4-9CDF-12523F4F5014', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7c200187-5793-430b-9eeb-eced97f9798b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('930f5da0-4056-4043-992d-3a44d412a149', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('98387c05-def0-4dbb-bde9-9548226efe86', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('9CEDE647-5DEB-47CC-98BC-E817D24FB602', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('9DA2ADDF-17BF-4ED3-A10A-C7B3C9C52316', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '805d0b61-ba00-4b77-b367-a0d309694258', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a1bcfe0e-19a5-46b4-a2c7-7abd572eae8e', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '02b48102-4e8a-44fb-84a0-7a8c8535676a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a1d14136-ce79-4bab-9f3c-b2dee377efc0', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('A358CCF8-826D-4E76-A43C-CEC34DFFA369', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('A3D21C73-9B72-41CD-A149-01BEC6102E0F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a413390b-ed04-4d8b-8c53-5aec741c6df5', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('A7DACF42-B7B5-4959-A0E5-248EDB93AA97', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('A7EE58F3-F236-4F22-8BE2-BA1457884DAA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bc011009-243a-4ca4-a52a-1429c92d1867', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AA098D8F-4895-4C88-BC22-AB8B700A9666', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AA593A5B-5F10-4661-BB3C-E38E844EB01F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2df2974e-f90a-4c4d-baf5-fcd16267d36b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AD04D5B7-02CE-4645-AD76-5770D6A285FB', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'D6991F8E-677B-454F-9B33-E6696636773A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AE08286A-6381-4CC2-BA6D-DB92BC540089', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'da9e5953-154c-4435-beb7-de71b99753f4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b0d9eede-f098-41a9-bb67-01ec717ea453', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '545d2450-4dac-4377-afbe-d9aa451f795f', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B10368D7-3BE0-4006-9B9B-912CA668B8A5', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B1A626EF-022B-4D38-926C-314C35FFB015', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b2444b0b-e2f9-4a1a-b2cb-678cd5f3aeb1', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B2C51513-A319-43D9-9C1C-B894406AF6C9', 'ecff6bc6-8024-43cf-810c-c58604403a76', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B4A36D40-1D12-4292-898C-9CC4DFA7017B', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B6FCB90D-9A75-4D50-82C7-F5DB8848CCA0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B87E5F9A-EC43-4AA8-A409-8E235E1FEE86', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D6991F8E-677B-454F-9B33-E6696636773A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B95DCF0B-8F23-430E-823C-CBCAB155FE77', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '89BDE962-1348-4A4E-9F10-46E37DCA0466', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BA666622-C081-4751-93D6-0C1DB248AFCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0e35988d-b4a3-4835-a872-d0a32dbcfb5e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BB0BAC25-EF1D-4F33-A4C2-6623CE8E5CF9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BB3340D9-8CFC-4DC0-A071-16AFA74BA5AC', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '02b48102-4e8a-44fb-84a0-7a8c8535676a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BC65B30B-EA2D-4DA8-AD4C-2E29AF604250', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BDDB831D-A122-4FF7-B954-2659CDD1CF0D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2e638140-f718-4879-afeb-2fac02bbce2e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('BEE978BA-9C9A-47B6-92FB-9C17739944E9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f4ca7d5c-63cf-471f-9226-d7ce5f298272', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C055331A-B4F4-493C-993C-8CD3ECC50492', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b78f59c1-b6fd-465e-837a-857b77547402', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C33C607B-42B7-46C4-AFFE-389AD36414C0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C530AF7A-53F1-4BBE-82BD-ECAE944BC86F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C6257893-9E28-499F-B9D5-7992DF315C20', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a3959557-b2ab-4fbc-8942-f72c52dfe972', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C6F3DD5D-7DAB-41A8-A338-E8C9D8F5ADF8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '62E80369-FE9E-4AAF-97CD-330CDCC3A393', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C85750AE-6483-4D52-88CE-2543294F58AA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C935DBB7-30EC-42C2-8708-CE7A151961EF', 'ecff6bc6-8024-43cf-810c-c58604403a76', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C9E7FFF2-E2A4-4CC2-93C9-3473533ED4E8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a1086dca-5677-4107-9a95-9a70259e927d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('CD40F265-6778-4583-BC49-23B8DA0C66B6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('CEBD7433-32E0-4701-AE02-333ACECB5CCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('D097EFF7-9A1E-4880-B311-84D3F439F21E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '365c5bf3-b266-4271-bde3-4d33b280abc1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('D49A2631-B375-46E6-BA26-510ABC16F7C7', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('da00cfaa-b4a4-4156-b867-e2f45c35ffcd', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'cc91e8f6-b7ff-4c73-b934-302ad3398922', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DC871771-EDF0-4258-A912-829486699C82', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DE04C3A4-D3C0-48A2-8579-6FB976A80292', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'A7C5B542-A71B-47C9-AF0D-8C76DE7EEB70', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e0312bf1-e793-46b0-b09b-ca3b14f50c90', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'c191de03-6b68-4e9e-8c5e-ff17aeca341d', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e1ccc750-45be-4050-88ff-3b241015bc11', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '810a72f0-55d3-468f-8653-10d1b06a4234', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E325EEA4-950A-4DEB-9172-89874C1B3EC0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ffe5276f-d3af-4af9-b12d-3e969948e8a5', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e489b1a2-1ad6-4921-8c42-b1d014cb8c6f', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47.970', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E4A7184A-5CA8-4FEE-9345-F8BD78AD8D9F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '46331541-77bb-4fcc-9cc0-039ed258048d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E787C639-6A82-488D-BD10-8DE34165E6DF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '3885ba7f-c246-493f-9053-7aa70a642662', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E8A22C5C-6603-4A98-BE62-77BEA088A33F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E9639C6B-FEB8-428D-8872-5649C613F0D0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8cf9b35c-415e-4906-aa66-4b9f7e2804ac', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E9EAF541-AD9D-42E1-B76D-40D573DB3D27', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'C4E02B4F-725F-4415-8FAF-BC48BD8267BE', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('EAE9C464-7FE8-4940-B136-BCB688F3B14E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('EB0B535C-583E-4CB1-A253-5381651E5745', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'FF20DE69-EB35-4DE8-AB05-6B731A4F19EF', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('EBBE9600-EE1F-4899-96F4-5CBE8BBFA973', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8BB151BA-82C7-4E29-9280-23A182026347', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('EC40C26B-2171-4C00-B8C0-48295CCD7259', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ECEE4402-A67D-49B4-9CAC-F104790DEA21', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '90bae59c-0eea-49f4-a2be-401da670816e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('EEBCA978-2F5C-4EDF-820B-C26738483559', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9f0af966-630b-47cd-bb05-a4b3d9c5692d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F056396D-6007-41AA-8F58-4CB701CA5109', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '963f06f5-c1c3-4346-8b0f-7abe22ddeed7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f14612d5-fdbf-4fc6-8d84-de065c7dd011', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F204484D-014F-4C0B-B052-B29B13235390', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F32ED2EB-23B0-43A0-98FE-0AD502DCAA24', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '68427266-1bdd-42c0-bd60-094cba29bfaa', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f3bd3b24-1ac9-4606-8247-a2114b205b49', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F525DC02-2643-49E0-8C6D-5117D564D464', 'ecff6bc6-8024-43cf-810c-c58604403a76', '46331541-77bb-4fcc-9cc0-039ed258048d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F60F8E78-067C-452C-A8B8-30900ED863B8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'C6804680-1D26-4789-964E-4F0AE673B1F4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F614696E-515F-41C8-948F-5E9F2EE03B71', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'eb76dd47-c269-4f95-8585-cbd786d489f3', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F65EBCCC-E404-49DF-8E07-6B057DD190E6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5387435A-D258-4C2C-BB23-4A97D17EF177', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F67C797D-2295-4A52-8E54-045A5EB5A035', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F71CD398-D2AB-406C-B930-EB32B38739CB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'edb10427-401c-4925-96cc-f7df89ad986d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f8309680-1ad5-4dd1-b2f3-32727d78c3f7', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('FAADCC0F-3945-4697-BA52-054D2CB166CC', 'ecff6bc6-8024-43cf-810c-c58604403a76', '1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07.213', NULL, NULL)
GO
INSERT INTO [RBAC].[RolePermission] ([Id], [RoleId], [SystemMenuId], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('FC662A53-6706-4CC3-8183-1D0F8F5367E5', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'E304E93B-EBBA-4C06-A573-58F856F5E0B0', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44.577', NULL, NULL)
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('0C50DDDF-AE45-4198-B3C7-D052E5CD997E', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', '6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30.270')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('20C1BC2C-8C8F-4AF6-BA02-63BFB149AD63', '48f3889c-af8d-401f-ada2-c383031af92d', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23.533')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('231BE6C8-EE3B-47CA-82F6-14AD9280C82E', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:56:33.120')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('48676584-3DC0-4391-B9BD-49424D048F92', '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', '6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:44.950')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('4AD9AF58-9865-4FF6-9CB8-152A25AFB783', '568ffebf-a4ea-44c4-80e1-206d39564cd1', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:04.950')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('6ADB2F3C-2A50-463F-8A87-8B6BE83F0D29', '094f85f8-bc53-4247-979c-09da591d51b0', '77B51251-0D00-45F9-A39F-8B853E8F812D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:44:58.630')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('7E82CBC7-BDDB-46FB-AA08-B25920AE5AA4', '452865b1d31c', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53.433')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('B3DB5640-6A75-4065-B0A5-84EFC8298259', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', '50578619-6939-4F6D-B421-9176E76ADBC0', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30.270')
GO
INSERT INTO [RBAC].[StaffOrganize] ([Id], [UserId], [OrganizationId], [CreateUserId], [CreateDateTime])  VALUES ('ddbe38af-3cd3-4115-a318-47d56f7d7c81', '630ecf4b-24b8-4f93-8ca0-2e08f618dae1', 'ebcea0bb-232a-494b-996e-4eb5aa59d1af', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-16 00:00:00.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '0', '后台', '后台', NULL, 2, '/Home/Index', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:16:55.330', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-11-16 10:27:24.563')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('02b48102-4e8a-44fb-84a0-7a8c8535676a', '545d2450-4dac-4377-afbe-d9aa451f795f', '查看角色权限', '查看角色权限', NULL, 2, '/Admin/Role/ViewPermissions', 'href', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:46:35.587')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('04782509-7aa5-446d-b63f-eac068c4c05a', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '个人信息', '个人信息', '387.png', 1, '/Admin/User/ViewDetails', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-17 16:40:29.800')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '编辑', '编辑', 'glyphicon glyphicon-pencil', 3, 'edit()', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0D651E28-A260-43E6-A7BF-522909D96D81', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '数据显示页', '数据显示页', NULL, 2, '/Dynamic/Core/Index', 'Iframe', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:33:16.593', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('0e35988d-b4a3-4835-a872-d0a32dbcfb5e', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'add', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:09.633', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('123d862c-7965-40c1-bd9b-158582f8bb78', '545d2450-4dac-4377-afbe-d9aa451f795f', '权限管理', '权限管理', 'glyphicon glyphicon-tower', 3, 'OnAllotAuthority', 'OnClick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:32.323', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '工作台', '工作台', NULL, 2, '/Home/Workstation', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:18:20.550', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'Delete', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:19.300', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('269bf251-0579-428d-811a-75be20089161', '3885ba7f-c246-493f-9053-7aa70a642662', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44.600')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '添加', '添加', 'add.png', 3, 'add()', 'Onclick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '详细', '详细', 'glyphicon glyphicon-list-alt', 3, 'OnShowDetail', 'OnClick', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:36:37.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2df2974e-f90a-4c4d-baf5-fcd16267d36b', 'c2947a69-fc79-4861-92ea-87361d8b5715', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'OnCreate', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:38.433', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48.897')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2e638140-f718-4879-afeb-2fac02bbce2e', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'OnCreate', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:33.670', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28.640')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '40178207-f2f2-44de-95bc-b5b4beb69e49', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'Delete()', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-30 11:45:01.940', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加或修改字典分类', '添加或修改字典分类', NULL, 2, '/Admin/Dictionary/CreateOrUpdateCategory', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:31:15.463', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('35bf2cc9-a986-4f5d-816c-87fdb062c0b9', '545d2450-4dac-4377-afbe-d9aa451f795f', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 6, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('365c5bf3-b266-4271-bde3-4d33b280abc1', '3885ba7f-c246-493f-9053-7aa70a642662', '按钮管理', '按钮管理', 'fa fa-cogs', 3, 'OnAllotButtons', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44.600')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3885ba7f-c246-493f-9053-7aa70a642662', '3e544d7a-d850-4785-9648-feafc4698a3b', '菜单导航', '菜单导航', 'sitemap.png', 1, '/Admin/SystemMenu/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"按钮管理", "Title":"按钮管理", "Image":"fa fa-cogs", "Code":"OnAllotButtons" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2017-01-26 11:18:54.180')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('3e544d7a-d850-4785-9648-feafc4698a3b', '0', '权限管理', '权限管理', 'fa fa-key', 1, NULL, 'Iframe', NULL, 500, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-31 13:38:33.917')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('40178207-f2f2-44de-95bc-b5b4beb69e49', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '首页快捷方式', '首页快捷方式', '637.png', 1, '/Admin/HomeShortcut/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-29 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 12:30:22.770')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('40B4656C-B442-46CE-9B97-B2DD2C38FC2F', 'c2947a69-fc79-4861-92ea-87361d8b5715', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/WebApi/User/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:45:35.117', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('41B85D12-882E-409E-B355-5BA0640047AE', '8fcead5e-991a-4904-99ac-2c9d9269040b', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/Admin/User/CreateOrUpdate', 'Iframe', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:41:13.570', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:42:32.547')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '分配成员', '分配成员', NULL, 2, '/WebApi/Role/AllotMembers', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:46:40.757', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:21.677')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('46331541-77bb-4fcc-9cc0-039ed258048d', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '详细', '详细', 'glyphicon glyphicon-list-alt', 3, 'OnShowDetail', 'OnClick', NULL, 6, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:28:03.823', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.790')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('49CE8797-0DD0-49AB-8378-ADDD948810C7', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '返回', '返回', 'glyphicon glyphicon-chevron-left', 3, 'OnBack', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:46:08.443', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('4BEBBCA0-66DB-46E8-A8BA-3389991888D6', '545d2450-4dac-4377-afbe-d9aa451f795f', '分配角色成员', '分配角色成员', NULL, 2, '/Admin/Role/AllotMembers', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:48:17.883', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '编辑', '编辑', 'glyphicon glyphicon-pencil', 3, 'edit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:11.247', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5387435A-D258-4C2C-BB23-4A97D17EF177', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '查看日志', '查看日志', NULL, 2, '/Admin/Logger/ViewDetails', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:36:37.177', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('545d2450-4dac-4377-afbe-d9aa451f795f', '3e544d7a-d850-4785-9648-feafc4698a3b', '角色管理', '角色管理', '20130508035646751_easyicon_net_32.png', 1, '/Admin/Role/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"成员管理", "Title":"成员管理", "Image":"fa fa-group", "Code":"OnAllotMember" },{ "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" },{ "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-08 10:04:01.550')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '0', '系统管理', '系统管理', 'glyphicon glyphicon-cog', 1, NULL, 'Iframe', NULL, 700, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-18 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:29:30.627')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5894638F-82FD-42E1-97B9-E3F7320A8C5C', '8fcead5e-991a-4904-99ac-2c9d9269040b', '分配权限', '分配权限', NULL, 2, '/Admin/User/AllotPermissions', 'Iframe', '[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" },{ "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }]', 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:45:17.560', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:41:46.210')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('58e86c4c-8022-4d30-95d5-b3d0eedcc878', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '字典管理', '字典管理', '4999_credit.png', 1, '/Admin/Dictionary/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:55:30.773')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '3e544d7a-d850-4785-9648-feafc4698a3b', '按钮管理', '按钮管理', '567.png', 1, '/Admin/Button/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-08 10:04:39.607')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('62E80369-FE9E-4AAF-97CD-330CDCC3A393', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '列注释管理', '列注释管理', NULL, 2, '/Dynamic/Configuration/ShowColumns', 'Iframe', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:32:45.813', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('68427266-1bdd-42c0-bd60-094cba29bfaa', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'OnCreate', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:33.757', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6a8044e3-d6ae-406c-a281-5e4d3ba44f67', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '角色管理', '角色管理', NULL, 1, '/WebApi/Role/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"成员管理", "Title":"成员管理", "Image":"fa fa-group", "Code":"OnAllotMember" },{ "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" },{ "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 20, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:34:54.430', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6D94B77D-2793-444D-BDE4-36E59558886C', '545d2450-4dac-4377-afbe-d9aa451f795f', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/Admin/Role/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:47:30.870', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:44.607')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/WebApi/Role/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:54:40.350', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('737a0a1c-d547-441c-a1db-46b79eb12038', '545d2450-4dac-4377-afbe-d9aa451f795f', '成员管理', '成员管理', 'fa fa-group', 3, 'OnAllotMember', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:15.597', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('74a5586b-8ed6-4581-92d6-be1599147684', '40178207-f2f2-44de-95bc-b5b4beb69e49', '编辑', '编辑', 'glyphicon glyphicon-pencil', 3, 'edit()', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-30 11:45:00.610', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('758429ec-3ae9-4a9e-a994-efe7c5395b4a', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '系统设置', '系统设置', '4968_config.png', 1, '/Admin/SystemSetting/Index', 'Iframe', NULL, 6, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:56:15.510')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('77508b76-d17c-4c08-bd9b-cf2d6ce832c6', 'e620450b-6d17-4192-bee0-66fbd114e82a', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51.533')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7961fd3c-6f0e-496c-a656-772742e14d5a', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '授权', '授权', 'glyphicon glyphicon-thumbs-up', 3, 'OnAccredit', 'Onclick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.753')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7A044068-395B-4569-AD29-BB582DF14959', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '添加或修改信息', '添加或修改信息', NULL, 2, '/Dynamic/ExtensionProperty/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:36:55.290', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:43:38.197')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7c200187-5793-430b-9eeb-eced97f9798b', 'c2947a69-fc79-4861-92ea-87361d8b5715', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:40.787', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7dcdf6fd-346a-4e4c-ba29-dcddac52f417', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'OnCreate', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:05.210', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.960')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('7dfdf495-83fe-4194-a042-35fe28c2e36b', '0', '动态页', '动态页', 'fa fa-bolt', 1, '#', 'Iframe', NULL, 100, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-26 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-31 13:38:07.233')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('805d0b61-ba00-4b77-b367-a0d309694258', '810a72f0-55d3-468f-8653-10d1b06a4234', '保存', '保存', 'disk.png', 3, 'SaveForm()', 'Onclick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('810a72f0-55d3-468f-8653-10d1b06a4234', '545d2450-4dac-4377-afbe-d9aa451f795f', '分配角色权限', '分配角色权限', NULL, 2, '/Admin/Role/AllotPermissions', 'href', '[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" },{ "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }]', 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-12 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:47:49.667')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', 'e620450b-6d17-4192-bee0-66fbd114e82a', '删除', '删除', 'glyphicon glyphicon-remove-sign', 3, 'OnDelete', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51.533')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '数据管理', '数据管理', 'glyphicon glyphicon-random', 1, '/Dynamic/Configuration/Index', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-31 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:18:41.000')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8884d6af-28ed-466d-9cb1-1a2d55dd12da', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 6, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:08.147', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('89BDE962-1348-4A4E-9F10-46E37DCA0466', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '保存', '保存', 'glyphicon glyphicon-floppy-save', 3, 'OnSave', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:46:06.413', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8BB151BA-82C7-4E29-9280-23A182026347', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '查看权限', '查看权限', NULL, 2, '/WebApi/Role/ViewPermissions', 'Iframe', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:48:18.427', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:54:55.313')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8cf9b35c-415e-4906-aa66-4b9f7e2804ac', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '刷新', '刷新', 'glyphicon glyphicon-refresh', 3, 'OnRefresh', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:38.483', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28.637')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '返回', '返回', 'glyphicon glyphicon-chevron-left', 3, 'OnBack', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:47.457', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8f82b5f3-6185-4296-bef6-52eed4e29a94', '/Admin/SystemMenu/AllotButton', '查询', '查询', 'zoom.png', 3, 'search()', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-14 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('8fcead5e-991a-4904-99ac-2c9d9269040b', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '用户管理', '用户管理', 'userregedit.png', 1, '/Admin/User/Index', 'Iframe', NULL, 15, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:24:24.580')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('90bae59c-0eea-49f4-a2be-401da670816e', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '编辑', '编辑', 'glyphicon glyphicon-pencil', 3, 'edit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:17.710', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '04782509-7aa5-446d-b63f-eac068c4c05a', '修改密码', '修改密码', NULL, 2, '/Admin/User/ChangePassword', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:39:30.303', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('9606167a-fd94-4ad6-88b8-1b419dc3410e', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '动态属性', '动态属性', NULL, 1, '/Dynamic/ExtensionProperty/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:19:32.313', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:12.410')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('963f06f5-c1c3-4346-8b0f-7abe22ddeed7', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:37.453', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加或修改字典', '添加或修改字典', NULL, 2, '/Admin/Dictionary/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:30:24.867', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:30:56.607')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('9f0af966-630b-47cd-bb05-a4b3d9c5692d', '545d2450-4dac-4377-afbe-d9aa451f795f', '添加', '添加', 'add.png', 3, 'add()', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a1086dca-5677-4107-9a95-9a70259e927d', 'c2947a69-fc79-4861-92ea-87361d8b5715', '授权', '授权', 'glyphicon glyphicon-thumbs-up', 3, 'OnAccredit', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 14:21:56.453', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a3959557-b2ab-4fbc-8942-f72c52dfe972', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'Onclick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.753')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '资源管理', '资源管理', '625.png', 1, '/Admin/Globalization/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:55:37.207')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('a63a0ca2-f2a7-4d27-bffa-67e548513df1', '0', '个人信息', '个人信息', 'glyphicon glyphicon-user', 1, NULL, 'Iframe', NULL, 300, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-29 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-11-15 17:43:44.810')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AA6F85E5-E048-4841-AD0B-72AAFCB37524', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '查看数据详情', '查看数据详情', NULL, 2, '/Dynamic/Core/ViewDetail', 'Iframe', NULL, 6, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:34:22.630', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '40178207-f2f2-44de-95bc-b5b4beb69e49', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/Admin/HomeShortcut/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:38:33.647', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:43:15.147')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:36.630', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b1d87254-b0ef-4a50-b427-ca0484e4516b', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'add', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:16.443', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '查询配置', '查询配置', NULL, 2, '/Dynamic/Configuration/ShowSearchConfig', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:30:58.940', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b4d8cc0e-bdf9-439f-83fa-be8210be5b57', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '保存', '保存', 'glyphicon glyphicon-floppy-save', 3, 'OnSave', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:43.617', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('b78f59c1-b6fd-465e-837a-857b77547402', '545d2450-4dac-4377-afbe-d9aa451f795f', '详细', '详细', 'glyphicon glyphicon-list-alt', 3, 'OnShowDetail', 'OnClick', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:35.430', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '8fcead5e-991a-4904-99ac-2c9d9269040b', ' 用户列表', ' 用户列表', NULL, 2, '/Admin/User/Users', 'href', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"锁定", "Title":"锁定", "Image":"glyphicon glyphicon-lock", "Code":"OnLock" },{ "Name":"授权", "Title":"授权", "Image":"glyphicon glyphicon-thumbs-up", "Code":"OnAccredit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"详细", "Title":"详细", "Image":"fa fa-newspaper-o", "Code":"OnShowDetail" },{ "Name":"权限管理", "Title":"权限管理", "Image":"glyphicon glyphicon-tower", "Code":"OnAllotAuthority" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-16 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:40:27.797')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('bc011009-243a-4ca4-a52a-1429c92d1867', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'Onclick', NULL, 7, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.800')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('bd745be7-c7b5-43d2-84c0-8890d7dd5e92', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '路由规则', '路由规则', NULL, 1, '/WebApi/Route/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"刷新", "Title":"刷新", "Image":"glyphicon glyphicon-refresh", "Code":"OnRefresh" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 30, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:06.567', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:30:59.983')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('bd959bfa-797c-48ff-b72b-241c84cd03a8', '3885ba7f-c246-493f-9053-7aa70a642662', '添加或编辑信息', '添加或编辑信息', '153.png', 2, '/Admin/SystemMenu/CreateOrUpdate', 'Open', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:50:16.170')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'add()', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c191de03-6b68-4e9e-8c5e-ff17aeca341d', '810a72f0-55d3-468f-8653-10d1b06a4234', '返回', '返回', 'back.png', 3, 'back()', 'Onclick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c2947a69-fc79-4861-92ea-87361d8b5715', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '用户管理', '用户管理', 'glyphicon glyphicon-user', 1, '/WebApi/User/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"锁定", "Title":"锁定", "Image":"glyphicon glyphicon-lock", "Code":"OnLock" },{ "Name":"授权", "Title":"授权", "Image":"glyphicon glyphicon-thumbs-up", "Code":"OnAccredit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 10, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:45:51.693', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C4E02B4F-725F-4415-8FAF-BC48BD8267BE', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '添加或编辑数据', '添加或编辑数据', NULL, 2, '/Dynamic/Core/CreateOrUpdate', 'Iframe', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:33:50.610', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c546a78a-7f0d-4cd9-a9ed-96548acb8910', '3885ba7f-c246-493f-9053-7aa70a642662', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44.700')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('C6804680-1D26-4789-964E-4F0AE673B1F4', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加或编辑全局资源', '添加或编辑全局资源', NULL, 2, '/Admin/Globalization/CreateOrUpdateGlobalResource', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:34:33.783', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '分配权限', '分配权限', NULL, 2, '/WebApi/Role/AllotPermissions', 'Iframe', '[{ "Name":"保存", "Title":"保存", "Image":"glyphicon glyphicon-floppy-save", "Code":"OnSave" },{ "Name":"返回", "Title":"返回", "Image":"glyphicon glyphicon-chevron-left", "Code":"OnBack" }]', 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:28.603', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:09.747')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('cc91e8f6-b7ff-4c73-b934-302ad3398922', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '锁定', '锁定', 'glyphicon glyphicon-lock', 3, 'OnLock', 'Onclick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.767')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '0', '组织机构', '组织机构', 'glyphicon glyphicon-pawn', 1, NULL, 'Iframe', NULL, 400, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:23:45.403', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-11-15 17:43:36.703')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d396873e-ec5b-4c44-919a-7d206cd0cc90', 'e620450b-6d17-4192-bee0-66fbd114e82a', '添加', '添加', 'glyphicon glyphicon-plus-sign', 3, 'OnCreate', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51.533')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加或编辑视图资源', '添加或编辑视图资源', NULL, 2, '/Admin/Globalization/CreateOrUpdateLocalResource', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:33:53.993', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('D6991F8E-677B-454F-9B33-E6696636773A', 'e620450b-6d17-4192-bee0-66fbd114e82a', '添加或修改信息', '添加或修改信息', NULL, 2, '/Admin/Organization/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:44:56.750', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:42:49.417')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d6bbc0e4-a5bc-4bc8-af1f-186371c06228', '8fcead5e-991a-4904-99ac-2c9d9269040b', ' 所属部门', ' 所属部门', NULL, 2, '/Admin/User/Departments', 'href', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-16 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:40:18.190')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('d84d5f23-9220-4ad5-ac66-fef7e303e819', '545d2450-4dac-4377-afbe-d9aa451f795f', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31.513')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('da9e5953-154c-4435-beb7-de71b99753f4', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'Delete()', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DCACA23C-645A-4D7B-B945-8DA15EBCF214', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/WebApi/Route/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:47:24.443', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('df3bb11c-3907-49cf-a091-f9f77b63ed7d', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:06.770', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.960')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DF7C758E-F021-45A4-A3CE-B870CD343A3D', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '添加或编辑信息', '添加或编辑信息', NULL, 2, '/Admin/Button/CreateOrUpdate', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:15:39.403', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '8fcead5e-991a-4904-99ac-2c9d9269040b', '查看用户详情', '查看用户详情', NULL, 2, '/Admin/User/ViewDetails', 'Iframe', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:42:27.370', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 16:18:34.133')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E304E93B-EBBA-4C06-A573-58F856F5E0B0', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '添加或编辑数据', '添加或编辑数据', NULL, 2, '/Dynamic/Configuration/ShowCreateOrUpdateConfig', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:32:01.810', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '查看日志', '查看日志', NULL, 2, '/Home/OperationRecords', 'Iframe', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:57:21.893', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 17:28:22.153')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('e620450b-6d17-4192-bee0-66fbd114e82a', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '部门管理', '部门管理', '20130508035912738_easyicon_net_32.png', 1, '/Admin/Organization/Index', 'Iframe', '[{ "Name":"编辑", "Title":"编辑", "Image":"glyphicon glyphicon-edit", "Code":"OnEdit" },{ "Name":"添加", "Title":"添加", "Image":"glyphicon glyphicon-plus-sign", "Code":"OnCreate" },{ "Name":"删除", "Title":"删除", "Image":"glyphicon glyphicon-remove-sign", "Code":"OnDelete" }]', 20, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:24:40.383')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '3e544d7a-d850-4785-9648-feafc4698a3b', 'WebApi权限管理', 'WebApi权限管理', 'glyphicon glyphicon-cloud', 1, '#', 'Iframe', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:45:01.633', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:43.220')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('eb76dd47-c269-4f95-8585-cbd786d489f3', 'c2947a69-fc79-4861-92ea-87361d8b5715', '锁定', '锁定', 'glyphicon glyphicon-lock', 3, 'OnLock', 'OnClick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 14:22:06.170', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ed192e6f-9a49-402b-890b-c46da5468023', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'Delete', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:12.433', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('edb10427-401c-4925-96cc-f7df89ad986d', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:34.143', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28.643')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '日志管理', '日志管理', '4937_administrative-docs.png', 1, '/Admin/Logger/Index', 'Iframe', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-18 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-29 18:00:20.877')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '3885ba7f-c246-493f-9053-7aa70a642662', '分配按钮', '分配按钮', NULL, 2, '/Admin/SystemMenu/AllotButtons', 'Open', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:51:15.330')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f367dc71-5918-45fd-a4bf-84c0091f18e7', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '权限管理', '权限管理', 'glyphicon glyphicon-tower', 3, 'OnAllotAuthority', 'OnClick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:36:07.830', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f4ca7d5c-63cf-471f-9226-d7ce5f298272', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '删除', '删除', 'glyphicon glyphicon-remove', 3, 'OnDelete', 'OnClick', NULL, 4, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:35.240', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28.647')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '查看缓存', '查看缓存', NULL, 2, '/Admin/SystemSetting/ShowCaches', 'Iframe', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:11.800', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:22.213')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('f5e0b9d9-5b99-4649-809e-b326dc012f77', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '成员管理', '成员管理', 'fa fa-group', 3, 'OnAllotMember', 'OnClick', NULL, 3, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:55.767', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10.963')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', 'c2947a69-fc79-4861-92ea-87361d8b5715', '编辑', '编辑', 'glyphicon glyphicon-edit', 3, 'OnEdit', 'OnClick', NULL, 2, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:39.597', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48.900')
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('fc08d048-2ff8-4948-b1b4-876c561bb8d7', '3885ba7f-c246-493f-9053-7aa70a642662', '添加', '添加', 'add.png', 3, 'add()', 'OnClick', NULL, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('fc85f7df-b8d8-4e12-a2c1-00606d290a95', '40178207-f2f2-44de-95bc-b5b4beb69e49', '添加', '添加', 'glyphicon glyphicon-plus', 3, 'add()', 'OnClick', NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00.000', NULL, NULL)
GO
INSERT INTO [RBAC].[SystemMenu] ([Id], [ParentId], [Name], [Title], [Image], [Category], [NavigateUrl], [Target], [Buttons], [Sort], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('ffe5276f-d3af-4af9-b12d-3e969948e8a5', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '权限管理', '权限管理', 'glyphicon glyphicon-tower', 3, 'OnAllotAuthority', 'OnClick', NULL, 5, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:27:59.900', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59.777')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('094f85f8-bc53-4247-979c-09da591d51b0', NULL, '10001', 'xingm', NULL, '明星', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:44:58.627')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('23e714a9-33c6-49bb-be10-0fd455b5f0ad', '094f85f8-bc53-4247-979c-09da591d51b0', '10031', 'bop', NULL, '彭博', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:56:33.120')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('452865b1d31c', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10033', 'xiaohuw', NULL, '汪小虎', 1, NULL, 'xiaohuw@flyme.com', NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2000-01-04 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53.423')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('48f3889c-af8d-401f-ada2-c383031af92d', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10032', 'system', 'X7MhxkGX2jYBJPPmrDytLw==', '张枫林', 1, '软件工程师', 'fenglinz@koteiinfo.com', NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23.533')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('4baa8438-930f-4b02-8fc1-d67bd43d2fb0', '094f85f8-bc53-4247-979c-09da591d51b0', '10011', 'sund', NULL, '杜顺', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:44.950')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('568ffebf-a4ea-44c4-80e1-206d39564cd1', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10035', 'yanlingc', NULL, '陈艳玲', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:56:44.730', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:04.947')
GO
INSERT INTO [RBAC].[User] ([Id], [Reporter], [Code], [Account], [Password], [Name], [Sex], [Title], [Email], [Theme], [Question], [Answer], [Remark], [Status], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES ('75e1f7a2-74ab-4d21-af74-a601f30f02ee', '094f85f8-bc53-4247-979c-09da591d51b0', '10021', 'zhileih', NULL, '何志磊', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00.000', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30.257')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('1F96097A-D9F6-4734-AF31-607619584E7C', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10.300')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('4395B551-05A6-42B9-985B-EFF943E0BA73', '568ffebf-a4ea-44c4-80e1-206d39564cd1', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10.303')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('4F2B1E60-83C4-42D3-8BD2-9F33382276D8', '48f3889c-af8d-401f-ada2-c383031af92d', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23.537')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('6591254D-39C8-4B56-A5AC-886B893F6356', '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10.300')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('8DF35257-F591-40BF-92A2-1A03A23B92AA', '094f85f8-bc53-4247-979c-09da591d51b0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10.300')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('A2E9AD23-81EB-4707-ABDC-C950E775954E', '452865b1d31c', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53.437')
GO
INSERT INTO [RBAC].[UserRole] ([Id], [UserId], [RoleId], [CreateUserId], [CreateDateTime])  VALUES ('D9D34580-BF9A-4F09-820E-49FA78E8A71D', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10.303')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('C9B799B5-CCCE-4902-8341-35B428FD5478', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'F01D3D20-E189-4F96-8EDC-6CE20785D851', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:23:48.920')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('9DEDC37A-DBFE-40CC-BF3F-4FA44708238C', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 1, '4F261973-181D-46CD-BD0F-10E98185F739', '工作周报', 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-14 15:53:18.287')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('E89CA23D-459C-4166-8E5B-52129EC0FAEA', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'D1B30ACD-7C77-4986-8423-657C301CBA3A', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:49:36.477')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('E8AB4D97-8784-43F4-B3DB-614025D23B58', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'C73171A5-88A8-424B-9262-0D672FCCDC52', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:34:10.150')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('39D479BA-6482-4954-933A-6969BE42951C', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'C73171A5-88A8-424B-9262-0D672FCCDC52', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:23:01.850')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('65813A31-5197-4160-AFDB-6D2CF54598BA', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'A367317C-73EB-4C2C-988C-77ECE5D40023', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:33:41.433')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('BDF0C059-7633-4BA9-8E51-965391C3E0F5', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, '34BF1E37-E2CE-4631-BEC6-567D40075F6C', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:15:03.800')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('40D2FEEE-7483-43A6-9C30-B8204F12A406', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, '979DBC7C-5893-42C4-A716-73BCDDC229BC', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-19 10:13:12.237')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('59A3BDC3-3AA3-4FA6-B427-BA626B2E3535', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'A367317C-73EB-4C2C-988C-77ECE5D40023', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:28:08.387')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('8539135A-3AE7-4105-B378-BB711B130E08', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'C73171A5-88A8-424B-9262-0D672FCCDC52', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:31:31.677')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('4E802F26-12B9-4235-9541-C78CC9FD7E80', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'C73171A5-88A8-424B-9262-0D672FCCDC52', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:26:00.677')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('0BFE3A3B-0F41-4C2C-A80A-C8D74D034D80', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'F01D3D20-E189-4F96-8EDC-6CE20785D851', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:26:42.673')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('8F49CDED-E1D2-46FA-9E6E-DE399803BA09', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, 'C73171A5-88A8-424B-9262-0D672FCCDC52', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:49:21.080')
GO
INSERT INTO [Storage].[BusinessFile] ([Id], [Category], [SerialNumber], [Source], [FileId], [Description], [Sort], [UploadUserId], [UploadDateTime])  VALUES ('E1F4FC28-DB25-402B-927B-DFBEE2B369F2', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', 2, '34BF1E37-E2CE-4631-BEC6-567D40075F6C', NULL, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:33:58.917')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('C73171A5-88A8-424B-9262-0D672FCCDC52', '15164623286273882.png', 3929, 'd11c9ddafd1a49d7f3985bd73b98f194', 'image/png', '~/uploads/201610/7125c4f1-9ea5-4628-b73d-df52d8c1d4af.png', '2016-10-10 13:26:00.673')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('4F261973-181D-46CD-BD0F-10E98185F739', '张枫林工作汇报16年9月第4周.doc', 83456, '1b514b1cfcf29b8be16f922e6916eaa8', 'application/msword', '~/uploads/201610/6d83256a-ad03-4a0e-b996-f5ee44bb1d4a.doc', '2016-10-10 14:52:50.743')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('34BF1E37-E2CE-4631-BEC6-567D40075F6C', '4971429200706259.png', 6038, '3d1b0850a122588bff2df833a5265317', 'image/png', '~/uploads/201610/b4516e2a-ca81-479a-9291-2b176c7eaba6.png', '2016-10-10 13:15:03.800')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('D1B30ACD-7C77-4986-8423-657C301CBA3A', '04471438842038511.png', 4607, '1b8c98bfda4afcb87e2a8f5e074120ae', 'image/png', '~/uploads/201610/1b4e085e-5cb5-428d-a66e-46011b1f8148.png', '2016-10-10 14:49:36.473')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('F01D3D20-E189-4F96-8EDC-6CE20785D851', '14099151997693427.png', 4404, 'cf2d24cd135e5b83720f0da862d38b8c', 'image/png', '~/uploads/201610/fbcbdaa2-f427-4602-aa8b-83f4380205e6.png', '2016-10-10 14:23:48.913')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('979DBC7C-5893-42C4-A716-73BCDDC229BC', '027288352942867355.png', 640039, '207fcb78682f1f7adb392a4460d49609', 'image/png', '~/uploads/201609/c12fb9e0-1da1-4ebc-b7f0-04e77a401256.png', '2016-09-19 10:13:12.237')
GO
INSERT INTO [Storage].[File] ([Id], [Name], [Size], [MD5], [ContentType], [SavedPath], [SavedDateTime])  VALUES ('A367317C-73EB-4C2C-988C-77ECE5D40023', '15684778821252898.png', 6419, 'c2ce1cb8b650c06702eb375816d93d30', 'image/png', '~/uploads/201610/fa53977d-14b3-4c0d-89a7-96fc54ea2848.png', '2016-10-10 14:28:08.353')
GO
SET IDENTITY_INSERT [WebApi].[Api] ON;
GO
INSERT INTO [WebApi].[Api] ([Id], [Route], [HttpVerb], [Description], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES (1, '/api/Config/{account}', 'GET', '获取计算机密钥。', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12.997', NULL, NULL)
GO
INSERT INTO [WebApi].[Api] ([Id], [Route], [HttpVerb], [Description], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES (2, '/api/File/Upload/{account}', 'POST', '基于base64字符串上传文件。', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12.997', NULL, NULL)
GO
INSERT INTO [WebApi].[Api] ([Id], [Route], [HttpVerb], [Description], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES (3, '/api/File/Remove/{account}/{category}/{serialNumber}', 'POST', '删除文件。', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12.997', NULL, NULL)
GO
SET IDENTITY_INSERT [WebApi].[Api] OFF;
GO
SET IDENTITY_INSERT [WebApi].[Role] ON;
GO
INSERT INTO [WebApi].[Role] ([Id], [Name], [Description], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES (1, '开发者', '开发者账号', NULL, NULL, NULL, '2016-03-10 15:13:15.157')
GO
SET IDENTITY_INSERT [WebApi].[Role] OFF;
GO
SET IDENTITY_INSERT [WebApi].[RolePermission] ON;
GO
INSERT INTO [WebApi].[RolePermission] ([Id], [RoleId], [ApiId], [CreateUserId], [CreateDateTime])  VALUES (1, 1, 1, '48f3889c-af8d-401f-ada2-c383031af92d', '2017-02-17 20:42:58.183')
GO
INSERT INTO [WebApi].[RolePermission] ([Id], [RoleId], [ApiId], [CreateUserId], [CreateDateTime])  VALUES (2, 1, 2, '48f3889c-af8d-401f-ada2-c383031af92d', '2017-02-17 20:42:58.190')
GO
INSERT INTO [WebApi].[RolePermission] ([Id], [RoleId], [ApiId], [CreateUserId], [CreateDateTime])  VALUES (3, 1, 3, '48f3889c-af8d-401f-ada2-c383031af92d', '2017-02-17 20:42:58.190')
GO
SET IDENTITY_INSERT [WebApi].[RolePermission] OFF;
GO
SET IDENTITY_INSERT [WebApi].[User] ON;
GO
INSERT INTO [WebApi].[User] ([Id], [Account], [Password], [Description], [Status], [RefreshToken], [ProtectedTicket], [CreateUserId], [CreateDateTime], [ModifyUserId], [ModifyDateTime])  VALUES (1, 'nebula', 'ef5caa746eb6e51eef59a31a96c3e99b', '星云用户', NULL, 'xnENnVx8k5zn16OppNdhfbgIl2zupIsbIp8qOwztIAU=', 'gQKRa0HZF5yBOw0EqMS_xhqjj-CAWth0R9pEu6NUpG1MJmh4xVt_S489dlLhFMoM1xcSTAE82FbnY0reI4zBHgZ_2jEypGK6z_YG6KYJptaHmNrAnVjshsU6F1CzERFiPWQ7v5DaBw_Ch7ejXoxQE9AMeMFJclv9TARmXwPAtpv952A-nROBranKq4U_60CbG0J1qtcaiPBgnup8smlckifSoNHxXQ9l3PhmLLhNOwMTmzLzYVtVzw-iczeXNjp04AA2cJMyYQQJoSLShrAURV347aqlaDh2hwRVhZmDhGtPPmcq', NULL, '2016-03-10 15:12:53.730', NULL, '2016-03-10 15:12:58.713')
GO
SET IDENTITY_INSERT [WebApi].[User] OFF;
GO
