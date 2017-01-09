/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : sparrow

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-01-10 00:02:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Type` int(11) DEFAULT NULL COMMENT '类型',
  `Key` text COLLATE utf8_bin COMMENT '键',
  `Value` text COLLATE utf8_bin COMMENT '值',
  `ParentId` varchar(72) COLLATE utf8_bin DEFAULT NULL COMMENT '父级编号',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `Status` int(11) DEFAULT NULL COMMENT '状态',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典信息';

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('2771adf2-1dd4-4a0e-ad09-fa186631b8ea', null, 0xE79C81E58685E696B0E997BB, 0xE79C81E58685E696B0E997BB, 'b94628af-32a2-47cb-9f01-33e0843d0a91', '1', '1', null);
INSERT INTO `dictionary` VALUES ('2fbadbb1-dbb1-4534-af6f-b68983ee47aa', null, 0xE99499E8AFAF, 0x4572726F72, 'f871b534-81ec-4f73-a2cc-e2dac035584c', '4', '1', null);
INSERT INTO `dictionary` VALUES ('3882599d-2d3d-45f0-af84-f911d390df9b', null, 0xE4BFA1E681AF, 0x496E666F, 'f871b534-81ec-4f73-a2cc-e2dac035584c', '2', '1', '');
INSERT INTO `dictionary` VALUES ('540c76b1-d4b2-47d6-b8ef-1fff76d60067', null, 0xE8B083E8AF95, 0x4465627567, 'f871b534-81ec-4f73-a2cc-e2dac035584c', '1', '1', null);
INSERT INTO `dictionary` VALUES ('63ed1ebc-f24d-460a-9d76-a73d4cf09330', null, 0xE8AEB0E5BD95, 0x5265636F7264, 'f871b534-81ec-4f73-a2cc-e2dac035584c', '5', '1', null);
INSERT INTO `dictionary` VALUES ('876fd86f-7df7-47c0-bcdf-984e961ffbf1', '1', 0xE59BBDE58685E696B0E997BB, 0xE59BBDE58685E696B0E997BB, 'b94628af-32a2-47cb-9f01-33e0843d0a91', '3', '1', null);
INSERT INTO `dictionary` VALUES ('92bac52f-324c-4d70-a083-5f6919bdafdc', null, 0xE59BBDE99985E696B0E997BB, 0xE59BBDE99985E696B0E997BB, 'b94628af-32a2-47cb-9f01-33e0843d0a91', '3', '1', null);
INSERT INTO `dictionary` VALUES ('b94628af-32a2-47cb-9f01-33e0843d0a91', '1', 0xE696B0E997BBE58886E7B1BB, 0xE696B0E997BBE58886E7B1BB, null, '6', null, 0xE696B0E997BBE58886E7B1BBE4BFA1E681AF);
INSERT INTO `dictionary` VALUES ('d4dea6da-2c0f-4a7c-bbcc-cdccb85baaea', null, 0xE8ADA6E5918A, 0x5761726E, 'f871b534-81ec-4f73-a2cc-e2dac035584c', '3', '1', null);
INSERT INTO `dictionary` VALUES ('f871b534-81ec-4f73-a2cc-e2dac035584c', null, 0xE697A5E5BF97E7BAA7E588AB, null, null, '5', null, null);

-- ----------------------------
-- Table structure for dynamic_condition
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_condition`;
CREATE TABLE `dynamic_condition` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TableName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '表名称',
  `Column` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '查询列名称',
  `Op` int(11) NOT NULL COMMENT '查询方式',
  `DictionaryKey` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '字典值',
  `ValidateRule` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '验证规则',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询条件';

-- ----------------------------
-- Records of dynamic_condition
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic_createorupdate
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_createorupdate`;
CREATE TABLE `dynamic_createorupdate` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `TableName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '表名称',
  `Column` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '显示的列名称',
  `ColumnLabel` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '列标签',
  `DefaultValue` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '默认值',
  `Visible` tinyint(4) DEFAULT NULL COMMENT '是否显示',
  `DictionaryKey` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '字典键',
  `ValidateRule` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '验证规则',
  `Sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='添加编辑配置';

-- ----------------------------
-- Records of dynamic_createorupdate
-- ----------------------------
INSERT INTO `dynamic_createorupdate` VALUES ('1', 'dbo.News', 'Id', '编号', null, '1', null, null, '1');
INSERT INTO `dynamic_createorupdate` VALUES ('2', 'dbo.News', 'Category', '分类', null, '1', '新闻分类', 'notNull', '2');
INSERT INTO `dynamic_createorupdate` VALUES ('3', 'dbo.News', 'Title', '标题', null, '1', null, null, '3');
INSERT INTO `dynamic_createorupdate` VALUES ('4', 'dbo.News', 'Content', '内容', null, '1', null, null, '4');
INSERT INTO `dynamic_createorupdate` VALUES ('5', 'dbo.News', 'Status', '状态(1：待审核，2：已发布，4：已删除)', null, '1', null, null, '5');
INSERT INTO `dynamic_createorupdate` VALUES ('6', 'dbo.News', 'BrowseTimes', '浏览次数', null, '1', null, null, '6');
INSERT INTO `dynamic_createorupdate` VALUES ('7', 'dbo.News', 'PublisherId', '发布者编号', null, '1', null, null, '7');
INSERT INTO `dynamic_createorupdate` VALUES ('8', 'dbo.News', 'PublishDateTime', '发布时间', null, '1', null, null, '8');

-- ----------------------------
-- Table structure for dynamic_extensionproperty
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_extensionproperty`;
CREATE TABLE `dynamic_extensionproperty` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Category` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '分类',
  `Name` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '属性名',
  `Unit` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '单位',
  `GroupName` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '分组',
  `ControlId` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '控件编号',
  `ControlType` int(11) NOT NULL COMMENT '控件类型',
  `Placeholder` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '占位符',
  `ControlDataSource` longtext COLLATE utf8_bin COMMENT '控件数据源',
  `ControlMaxLength` int(11) DEFAULT NULL COMMENT '控件长度',
  `ControlLabelCssClass` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '控件标签css类名',
  `ControlContainerCssClass` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '控件容器css类名',
  `ControlStyle` text COLLATE utf8_bin COMMENT '控件样式',
  `ControlValidateRule` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '控件验证规则',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='扩展属性';

-- ----------------------------
-- Records of dynamic_extensionproperty
-- ----------------------------
INSERT INTO `dynamic_extensionproperty` VALUES ('13E764C8-EFE4-4BEC-BADC-6755F4BCCDFA', '个人信息', '身份证号', null, 'grp1', 'idCard', '1', '身份证号', null, null, 'col-sm-2', 'col-sm-3', null, 'IDCard', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 10:05:21', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:20');
INSERT INTO `dynamic_extensionproperty` VALUES ('24987B48-C87F-43CF-AD1B-F9A01E7EF54B', '个人信息', '毕业院校', null, 'grp1', 'School', '1', '毕业院校', null, null, 'col-sm-2', 'col-sm-3', null, 'notNull', '2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 13:51:56', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:25');
INSERT INTO `dynamic_extensionproperty` VALUES ('5AE10037-B407-4DF9-ABC9-438802C4516D', '个人信息', '级别', null, 'grp2', 'Level', '2', '级别', 0xE7A88BE5BA8FE591983BE58AA9E79086E5B7A5E7A88BE5B8883BE5B7A5E7A88BE5B8883BE69EB6E69E84E5B888, null, 'col-sm-2', 'col-sm-3', null, null, '4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:20:25', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 16:01:40');
INSERT INTO `dynamic_extensionproperty` VALUES ('61EA083F-6332-40B2-A603-2A5D34152F76', '个人信息', '爱好', null, null, 'Favorite', '4', '爱好', 0xE99885E8AFBB3BE7BEBDE6AF9BE790833BE4B992E4B993E790833BE7AFAEE790833BE8B6B3E790833BE7BD91E79083, null, 'col-sm-2', 'col-sm-8', null, null, '6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:23:10', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 15:38:42');
INSERT INTO `dynamic_extensionproperty` VALUES ('770F6357-1447-48B1-A924-5F502A32A7B2', '个人信息', '毕业日期', null, 'grp2', 'GraduationDate', '1', '毕业日期', null, null, 'col-sm-2', 'col-sm-3', null, 'date', '3', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:00:29', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 16:50:30');
INSERT INTO `dynamic_extensionproperty` VALUES ('DA841B99-012A-4EB5-B092-9A2385999F56', '个人信息', ' 院校类型', null, null, 'SchoolType', '3', ' 院校类型', 0x323131E5ADA6E999A23BE99D9E323131E5ADA6E999A2, null, 'col-sm-2', 'col-sm-8', null, null, '5', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 14:22:17', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-05 15:38:29');

-- ----------------------------
-- Table structure for dynamic_extensionpropertyinstance
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_extensionpropertyinstance`;
CREATE TABLE `dynamic_extensionpropertyinstance` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `ExtensionPropertyId` char(36) COLLATE utf8_bin NOT NULL COMMENT '扩展属性编号',
  `BusinessSerialNumber` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水编号',
  `Value` longtext COLLATE utf8_bin COMMENT '值',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='扩展属性实例';

-- ----------------------------
-- Records of dynamic_extensionpropertyinstance
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic_order
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_order`;
CREATE TABLE `dynamic_order` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `TableName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '表名称',
  `Column` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '列名称',
  `OrderBy` int(11) NOT NULL COMMENT '排序方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='排序配置';

-- ----------------------------
-- Records of dynamic_order
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic_search
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_search`;
CREATE TABLE `dynamic_search` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `TableName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '表名称',
  `Title` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `SortColumns` longtext COLLATE utf8_bin COMMENT '列排序顺序',
  `VisibleColumns` longtext COLLATE utf8_bin NOT NULL COMMENT '显示列',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='查询配置';

-- ----------------------------
-- Records of dynamic_search
-- ----------------------------

-- ----------------------------
-- Table structure for globalization
-- ----------------------------
DROP TABLE IF EXISTS `globalization`;
CREATE TABLE `globalization` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Culture` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区域语言',
  `Area` text COLLATE utf8_bin COMMENT '区域',
  `Controller` text COLLATE utf8_bin COMMENT '控制器',
  `ViewName` text COLLATE utf8_bin COMMENT '视图名',
  `Key` text COLLATE utf8_bin COMMENT '键',
  `Value` text COLLATE utf8_bin COMMENT '值',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='国际化信息';

-- ----------------------------
-- Records of globalization
-- ----------------------------
INSERT INTO `globalization` VALUES ('0a564fd0-80d4-49f0-b8c0-8ef958f50915', null, null, null, null, 0x616464, 0xE696B0E5A29E, null);
INSERT INTO `globalization` VALUES ('1226AF72-F686-4A19-8A77-C08E6A6E0608', null, null, 0x5265736F75726365, 0x496E646578, 0x61726561, 0xE58CBAE59F9F, 0xE58CBAE59F9FE6A087E7ADBE);
INSERT INTO `globalization` VALUES ('1D4C983E-A674-419B-812D-6BF4D76466C2', null, null, null, null, 0x656D7074792D64617461, 0xE6B2A1E69C89E689BEE588B0E7ACA6E59088E69FA5E8AFA2E69DA1E4BBB6E79A84E4BFA1E681AFEFBC81, null);
INSERT INTO `globalization` VALUES ('2a075689-42d9-4fae-85e9-6485a1f95567', null, null, null, null, 0x7175657279, 0xE69FA5E8AFA2, 0xE69FA5E8AFA2);
INSERT INTO `globalization` VALUES ('5cb0b7a6-02b5-464c-ba13-3539ff490e07', null, null, null, null, 0x636C6F7365, 0xE585B3E997AD, 0x3333);
INSERT INTO `globalization` VALUES ('663689c3-d9ad-4f30-9df1-985ba257161e', null, null, null, null, 0x6261636B, 0xE8BF94E59B9E, 0xE8BF94E59B9E);
INSERT INTO `globalization` VALUES ('74e7f402-fdb1-4d5c-9f97-8cf93417a171', null, null, null, null, 0x64656C657465, 0xE588A0E999A4, 0xE588A0E999A4);
INSERT INTO `globalization` VALUES ('a3a03e02-db48-4139-aeb1-fa2503278714', null, null, null, null, 0x73617665, 0xE4BF9DE5AD98, 0xE4BF9DE5AD98);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Category` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `Title` text COLLATE utf8_bin COMMENT '标题',
  `Content` longtext COLLATE utf8_bin COMMENT '内容',
  `Status` int(11) DEFAULT NULL COMMENT '状态(1：待审核，2：已发布，4：已删除)',
  `BrowseTimes` int(11) DEFAULT NULL COMMENT '浏览次数',
  `PublisherId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '发布者编号',
  `PublishDateTime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新闻';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1CC526A1-427D-4FE4-8305-BEEB1948C4AA', '国际新闻', 0xE5B7A5E4BD9CE591A8E68AA5, 0x3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A35393030302F46696C652F496E6465782F66693931634778765957527A4C7A49774D5459784D43396D5954557A4F5463335A4330784E47497A4C54526A4D4751744F446C684E7930354E6D5A6A4E54526C595449344E4467756347356E3F6D6F64653D4D656469756D2220616C743D2248616E4B6F7542616E6B22207374796C653D226D61782D77696474683A313030253B2220636C6173733D22223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A35393030302F46696C652F496E6465782F66693931634778765957527A4C7A49774D5459784D4339694E4455784E6D55795953316A595467784C5451334F5745744F5449354D533079596A45334E6D4D335A574669595459756347356E3F6D6F64653D4D656469756D2220616C743D2250696E67416E22207374796C653D226D61782D77696474683A313030253B2220636C6173733D22223E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A35393030302F46696C652F496E6465782F66693931634778765957527A4C7A49774D5459784D4338334D544931597A526D4D5330355A5745314C5451324D6A6774596A637A5A43316B5A6A55795A44686A4D575130595759756347356E3F6D6F64653D4F726967696E616C2220616C743D2258696E6759756E22207374796C653D226D61782D77696474683A20313030253B2220636C6173733D22223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A35393030302F46696C652F496E6465782F66693931634778765957527A4C7A49774D5459784D4338334D544931597A526D4D5330355A5745314C5451324D6A6774596A637A5A43316B5A6A55795A44686A4D575130595759756347356E3F6D6F64653D4D656469756D2220616C743D2258696E6759756E22207374796C653D226D61782D77696474683A313030253B223E3C62723E3C2F703E3C703E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A35393030302F46696C652F496E6465782F66693931634778765957527A4C7A49774D5459784D433878596A526C4D4467315A533031593249314C5451794F475174595459325A5330304E6A41784D5749785A6A67784E4467756347356E3F6D6F64653D4D656469756D2220616C743D22636E6862677422207374796C653D226D61782D77696474683A313030253B2220636C6173733D22223E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-14 15:53:18');

-- ----------------------------
-- Table structure for newscomment
-- ----------------------------
DROP TABLE IF EXISTS `newscomment`;
CREATE TABLE `newscomment` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `NewsId` char(36) COLLATE utf8_bin NOT NULL COMMENT '新闻编号',
  `ReplyCommentId` char(36) COLLATE utf8_bin DEFAULT NULL COMMENT '评论编号(回复评论)',
  `Content` text COLLATE utf8_bin COMMENT '内容',
  `Status` int(11) DEFAULT NULL COMMENT '状态(1：代审核，2：审核通过、4：审核失败)',
  `LikePoints` int(11) DEFAULT NULL COMMENT '点赞次数',
  `CommentUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '评论者编号',
  `CommentDateTime` datetime DEFAULT NULL COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新闻评论';

-- ----------------------------
-- Records of newscomment
-- ----------------------------

-- ----------------------------
-- Table structure for operationrecord
-- ----------------------------
DROP TABLE IF EXISTS `operationrecord`;
CREATE TABLE `operationrecord` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `BusinessCategory` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '业务分类',
  `BusinessSerialNumber` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '业务流水号',
  `Content` longtext COLLATE utf8_bin COMMENT '内容',
  `LogOnIPAddress` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录IP地址',
  `AddedUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '记录者编号',
  `AddedDateTime` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作记录';

-- ----------------------------
-- Records of operationrecord
-- ----------------------------
INSERT INTO `operationrecord` VALUES ('1', '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', 0xE799BBE5BD95, '127.0.0.1', null, '2016-10-19 23:12:06');
INSERT INTO `operationrecord` VALUES ('2', '用户管理', '48f3889c-af8d-401f-ada2-c383031af92d', 0xE799BBE5BD95, '127.0.0.1', null, '2016-10-25 23:42:57');

-- ----------------------------
-- Table structure for rbac_button
-- ----------------------------
DROP TABLE IF EXISTS `rbac_button`;
CREATE TABLE `rbac_button` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮名称',
  `Title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮标题',
  `Image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮图标',
  `Code` text COLLATE utf8_bin COMMENT '按钮代码',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `Category` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮分类',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0：删除、1：有效)',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='按钮';

-- ----------------------------
-- Records of rbac_button
-- ----------------------------
INSERT INTO `rbac_button` VALUES ('020e2c2a-e203-4694-85ef-c73bd301ad72', '备份', '备份', 'glyphicon glyphicon-download-alt', 0x4F6E4261636B7570, '32', '工具栏', 0xE695B0E68DAEE5BA93E5A487E4BBBD, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:56:09');
INSERT INTO `rbac_button` VALUES ('067b2de9-037f-4bb9-8a41-285eb3fc7267', '编辑', '编辑', 'glyphicon glyphicon-edit', 0x4F6E45646974, '2', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-28 00:01:55');
INSERT INTO `rbac_button` VALUES ('0e8c3c59-586a-48a0-a1ef-5a83f4a2d6fd', '恢复', '恢复', 'glyphicon glyphicon-open', 0x4F6E5265636F766572, '33', '工具栏', 0xE8BF98E58E9FE681A2E5A48DE695B0E68DAEE5BA93, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:56:19');
INSERT INTO `rbac_button` VALUES ('13f9189c-ccbe-4e4a-8292-d408fa8d119f', '导入', '导入', 'glyphicon glyphicon-import', 0x4F6E496D706F7274, '5', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:44:41');
INSERT INTO `rbac_button` VALUES ('1b88ce60-6438-4bb9-891d-c0bf4832e2d5', '设置', '设置', 'glyphicon glyphicon-cog', 0x4F6E53657474696E67, '7', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:01');
INSERT INTO `rbac_button` VALUES ('2e5d2d97-1367-4036-8040-cfcd261e9e5f', '锁定', '锁定', 'glyphicon glyphicon-lock', 0x4F6E4C6F636B, '22', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:12');
INSERT INTO `rbac_button` VALUES ('2f1a1ba6-276e-4e7f-a219-ecfdb50e63fb', '发布', '发布', 'glyphicon glyphicon-globe', 0x4F6E5075626C697368, '18', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:36');
INSERT INTO `rbac_button` VALUES ('3194373e-1b97-4c92-9cd2-4778b00c3b13', '清空', '清空', 'glyphicon glyphicon-trash', 0x4F6E436C656172, '26', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:07');
INSERT INTO `rbac_button` VALUES ('42cef74b-2c60-4d62-93b8-d0f6d16ca3b0', '上传', '上传', 'glyphicon glyphicon-cloud-upload', 0x4F6E55706C6F6164, '9', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:21');
INSERT INTO `rbac_button` VALUES ('43334b34-f78e-4187-ad2f-1600bb932896', '复制', '复制', 'fa fa-copy', 0x4F6E436F7079, '11', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:40');
INSERT INTO `rbac_button` VALUES ('43334b34-f78e-4187-ad2f-1610bb912896', '打印', '打印', 'glyphicon glyphicon-print', 0x4F6E5072696E74, '13', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:00');
INSERT INTO `rbac_button` VALUES ('43334b34-f78e-4187-ad2f-1610bb932896', '还原', '还原', 'fa fa-mail-reply', 0x4F6E526573746F7265, '12', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:48');
INSERT INTO `rbac_button` VALUES ('58d19434-705a-4199-acdc-b6d0322501bf', '下载', '下载', 'glyphicon glyphicon-cloud-download', 0x4F6E446F776E6C6F6164, '10', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:31');
INSERT INTO `rbac_button` VALUES ('73f60b12-fc1f-4927-9803-616fef6ed1b7', '授权', '授权', 'glyphicon glyphicon-thumbs-up', 0x4F6E4163637265646974, '23', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:24');
INSERT INTO `rbac_button` VALUES ('79a3ec54-3c07-4204-bfc6-5b1f111474b3', '刷新', '刷新', 'glyphicon glyphicon-refresh', 0x4F6E52656672657368, '21', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:51:58');
INSERT INTO `rbac_button` VALUES ('79a3ec54-3c07-4204-bfc6-5b7f111474b3', '浏览', '浏览', 'fa fa-unlink', 0x4F6E42726F777365, '20', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:51:02');
INSERT INTO `rbac_button` VALUES ('7e33c9ec-7573-450b-aa4f-c52771ebdd3c', '升级', '升级', 'fa fa-upload', 0x4F6E55706772616465, '17', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:20');
INSERT INTO `rbac_button` VALUES ('7f6e3c60-4ac5-4c59-a15d-40832b353423', '保存', '保存', 'glyphicon glyphicon-floppy-save', 0x4F6E53617665, '27', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:18');
INSERT INTO `rbac_button` VALUES ('B2130A78-8B54-4F87-8261-CD5BDCD07F9B', '预览', '预览', 'glyphicon glyphicon-eye-open', 0x4F6E50726576696577, '34', '工具栏', 0xE9A284E8A788, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:01:30', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:04:35');
INSERT INTO `rbac_button` VALUES ('a08fee4b-98c1-4974-be4a-5dbcc0820cbd', '添加', '添加', 'glyphicon glyphicon-plus-sign', 0x4F6E437265617465, '1', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-05 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-28 14:13:19');
INSERT INTO `rbac_button` VALUES ('a7400cab-6e80-47cd-9cca-e3de79cba1c3', '成员管理', '成员管理', 'fa fa-group', 0x4F6E416C6C6F744D656D626572, '31', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:55:57');
INSERT INTO `rbac_button` VALUES ('a7e78077-5c3a-4705-8c58-4c4e696ee201', '取消', '取消', 'glyphicon glyphicon-floppy-remove', 0x4F6E43616E63656C, '28', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:53:49');
INSERT INTO `rbac_button` VALUES ('b0482c2d-b466-4d05-beb2-45b2bd7981c4', '帮助', '帮助', 'glyphicon glyphicon-question-sign', 0x4F6E48656C70, '19', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:50:49');
INSERT INTO `rbac_button` VALUES ('bc43a78e-2952-4a61-ab1d-e57c2bfa3953', '详细', '详细', 'fa fa-newspaper-o', 0x4F6E53686F7744657461696C, '29', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-09 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:54:06');
INSERT INTO `rbac_button` VALUES ('c44ae1e3-8c46-474f-a2a3-517bdf39d68d', '权限管理', '权限管理', 'glyphicon glyphicon-tower', 0x4F6E416C6C6F74417574686F72697479, '25', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:54');
INSERT INTO `rbac_button` VALUES ('c9df5a92-ed50-4a8d-9f5c-765b5c15e3bc', '发送', '发送', 'glyphicon glyphicon-send', 0x4F6E53656E64, '14', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:09');
INSERT INTO `rbac_button` VALUES ('cd2e937e-7f3a-4823-958b-2acab4711f08', '举报', '举报', 'glyphicon glyphicon-phone-alt', 0x4F6E5265706F7274, '16', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:30');
INSERT INTO `rbac_button` VALUES ('cfa9fe4b-a30c-43fe-b73d-df02516c2e07', '按钮管理', '按钮管理', 'fa fa-cogs', 0x4F6E416C6C6F74427574746F6E73, '24', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:52:41');
INSERT INTO `rbac_button` VALUES ('d10be9f7-2382-4336-90ed-60193eb80382', '返回', '返回', 'glyphicon glyphicon-chevron-left', 0x4F6E4261636B, '15', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:46:18');
INSERT INTO `rbac_button` VALUES ('d6cdbfd6-017b-4639-8c2d-6fb63174b0a5', '删除', '删除', 'glyphicon glyphicon-remove-sign', 0x4F6E44656C657465, '3', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-22 14:34:53');
INSERT INTO `rbac_button` VALUES ('d8680d5e-0c3a-41f0-a1d1-dd5152b3014c', '审核', '审核', 'glyphicon glyphicon-check', 0x4F6E4175646974, '8', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:45:13');
INSERT INTO `rbac_button` VALUES ('e452d1ef-bde7-4f66-a525-4067a4ec7e49', '查询', '查询', 'glyphicon glyphicon-search', 0x4F6E536561726368, '4', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 15:44:31');
INSERT INTO `rbac_button` VALUES ('e7f33901-604c-4a51-b122-e6529066983c', '导出', '导出', 'glyphicon glyphicon-export', 0x4F6E4578706F7274, '6', '工具栏', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-06 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-27 13:51:41');

-- ----------------------------
-- Table structure for rbac_homeshortcut
-- ----------------------------
DROP TABLE IF EXISTS `rbac_homeshortcut`;
CREATE TABLE `rbac_homeshortcut` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `UserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '快捷方式名称',
  `NavigateUrl` text COLLATE utf8_bin COMMENT '导航地址',
  `Target` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `Image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '快捷方式图标',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='首页快捷方式';

-- ----------------------------
-- Records of rbac_homeshortcut
-- ----------------------------
INSERT INTO `rbac_homeshortcut` VALUES ('2DB04F75-FC78-40E6-A401-C9E6D660F092', '48f3889c-af8d-401f-ada2-c383031af92d', '系统管理', 0x2F436F6E736F6C652F486F6D652F496E646578, 'Open', 'glyphicon glyphicon-cog', '3', null);
INSERT INTO `rbac_homeshortcut` VALUES ('40abb9d3-219a-4469-9ce5-40c4eb088b0a', '48f3889c-af8d-401f-ada2-c383031af92d', '个人信息', 0x2F41646D696E2F557365722F5669657744657461696C73, 'Iframe', 'glyphicon glyphicon-user', '2', null);
INSERT INTO `rbac_homeshortcut` VALUES ('d3973803-c2bd-4e16-be0d-cd26673ba0dd', '48f3889c-af8d-401f-ada2-c383031af92d', '菜单管理', 0x2F41646D696E2F53797374656D4D656E752F496E646578, 'Iframe', 'fa fa-sitemap', '1', 0xE88F9CE58D95E7AEA1E79086E9A1B5);

-- ----------------------------
-- Table structure for rbac_organization
-- ----------------------------
DROP TABLE IF EXISTS `rbac_organization`;
CREATE TABLE `rbac_organization` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `ParentId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '上级部门编号',
  `Code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '部门编码',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '部门名称',
  `InnerPhone` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '内部电话号码',
  `OuterPhone` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '外部电话号码',
  `Manager` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '部门经理编号',
  `AssistantManager` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '部门助理编号',
  `Fax` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `ZipCode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `Address` text COLLATE utf8_bin COMMENT '地址',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0：删除、1：有效)',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织机构';

-- ----------------------------
-- Records of rbac_organization
-- ----------------------------
INSERT INTO `rbac_organization` VALUES ('50578619-6939-4F6D-B421-9176E76ADBC0', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1002', '财务部', null, null, '75e1f7a2-74ab-4d21-af74-a601f30f02ee', null, null, null, null, '2', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:43', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:51');
INSERT INTO `rbac_organization` VALUES ('5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1003', '互联网金融部', null, null, '23e714a9-33c6-49bb-be10-0fd455b5f0ad', null, null, null, null, '3', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:55:41', null, null);
INSERT INTO `rbac_organization` VALUES ('6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '77B51251-0D00-45F9-A39F-8B853E8F812D', '1001', '人力资源部', null, null, '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', null, null, null, null, '1', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:53:07', null, null);
INSERT INTO `rbac_organization` VALUES ('77B51251-0D00-45F9-A39F-8B853E8F812D', '0', '1000', '武汉星云资本管理有限公司', null, null, '094f85f8-bc53-4247-979c-09da591d51b0', null, null, '000000', null, '1', null, '1', null, '2013-04-11 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:10:27');

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `ParentId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '父角色编号',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `Sort` int(11) DEFAULT NULL COMMENT '排序号',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色';

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES ('d0533453-9cf8-459c-b28c-98cf397efaf1', '0', '管理员', '1', 0xE7AEA1E79086E59198E68980E59CA8E8A792E889B2E38082, '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-10 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-08-22 15:52:13');
INSERT INTO `rbac_role` VALUES ('ecff6bc6-8024-43cf-810c-c58604403a76', '0', '普通员工', '2', 0xE699AEE9809AE59198E5B7A5, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:44:58', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-26 00:02:39');

-- ----------------------------
-- Table structure for rbac_rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rbac_rolepermission`;
CREATE TABLE `rbac_rolepermission` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `RoleId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `SystemMenuId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限';

-- ----------------------------
-- Records of rbac_rolepermission
-- ----------------------------
INSERT INTO `rbac_rolepermission` VALUES ('008FCE8B-DE1E-483D-8256-94D1A8A1FC62', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('021CC91D-AEE7-489C-BEAE-C07AD32945FA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('0342EDAA-7AD3-4279-AE48-81C928CEF7D2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8884d6af-28ed-466d-9cb1-1a2d55dd12da', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('04B48C19-CB5B-4997-ABB3-4B3659F9C525', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '810a72f0-55d3-468f-8653-10d1b06a4234', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('064D75F0-2E65-4651-B2E2-DF460244D327', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('06965535-1DC1-401B-8107-90767E35B253', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'df3bb11c-3907-49cf-a091-f9f77b63ed7d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('07F701FF-F879-45F5-9840-5A5ABD84B788', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '40B4656C-B442-46CE-9B97-B2DD2C38FC2F', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('084E81E3-4377-40AA-9652-A58E6F5C2BCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '737a0a1c-d547-441c-a1db-46b79eb12038', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('0CCB16D5-12AC-408F-95CD-7F101A4D0884', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '35bf2cc9-a986-4f5d-816c-87fdb062c0b9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('0F9BA867-BE85-4D52-8F77-84FF1C3D330D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'cc91e8f6-b7ff-4c73-b934-302ad3398922', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('0FD11812-AD5A-4709-81A1-9E6B62A27C56', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('0f64f239-188b-498f-894f-6fc6f0a7449d', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('142BDB0C-E471-4D53-964B-C4F91972537D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('142EE402-04EB-461B-9AF8-8CA7CD2AB967', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('14886A17-12BA-4DA7-980D-17E736F1F372', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('17F865FD-4D46-4B6C-A1D5-B20CE702DF7E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '545d2450-4dac-4377-afbe-d9aa451f795f', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('187DA490-8D6B-4845-A110-1E291393269A', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f367dc71-5918-45fd-a4bf-84c0091f18e7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('19ae1d94-e3a0-4e2f-8ed6-d9865a411bae', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '7961fd3c-6f0e-496c-a656-772742e14d5a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('2093eb87-1ffd-439c-940f-7b417588245b', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '3885ba7f-c246-493f-9053-7aa70a642662', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('20CD532D-6090-42BB-9337-72B72B1FBB63', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('20F5FB7A-03ED-411C-BCB4-0E621396FE9D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '49CE8797-0DD0-49AB-8378-ADDD948810C7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('21EE05FF-5EF3-4ABB-90D3-E5F1C2FA47E0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b4d8cc0e-bdf9-439f-83fa-be8210be5b57', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('242740f5-7a68-4051-b338-2b47aaa21f0f', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('24420406-B9FD-487E-B2D2-2D276AAC15A1', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('25904A33-05BB-4DD2-BE10-AF9B7B97BC22', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd84d5f23-9220-4ad5-ac66-fef7e303e819', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('26744dde-eea0-434f-8b61-84fd067627a6', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bd959bfa-797c-48ff-b72b-241c84cd03a8', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('276A63BF-475A-4C2E-AFF2-CCA34C532D39', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('2AB445EE-7728-43CF-AF78-86716319C651', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D710C465-73AD-4B45-881B-267B53CCC052', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('2E9A0610-72B2-4973-A33C-909881568D3C', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('2F197470-9171-4D69-A81D-EEDD6CA3E319', 'ecff6bc6-8024-43cf-810c-c58604403a76', '946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('2d68e4f5-3374-4df9-8de9-a17b2181da3a', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '3e544d7a-d850-4785-9648-feafc4698a3b', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('30bc5f86-cea2-4072-b96f-cf1f8cbfe057', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('3369D962-4E19-4F6C-9FC7-DBC72C17A595', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('33E026EA-61AF-4CBE-AE92-2F989CA374C3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3485815E-9C48-459D-AD74-9EE9B82BC2EA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('367168C1-4133-4B95-A7E4-A7E3B5A59C22', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('37810E46-21D6-4559-BFAF-FBED500BF89D', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('37F1D91B-53EF-41A8-A91B-7E65B8174FFA', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('3879A581-DFFB-4F23-895F-F62C75FB438B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c191de03-6b68-4e9e-8c5e-ff17aeca341d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('391A61FF-7D55-46D6-BAFA-0C859BBEDD23', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3B4861CF-7E4D-4760-BD85-349B590ADE94', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3B65E5B8-5459-431F-B7EC-AAFF612DC139', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '41B85D12-882E-409E-B355-5BA0640047AE', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3B8CDFC6-9FD3-4BCC-BC20-B4E21E44D3D9', 'ecff6bc6-8024-43cf-810c-c58604403a76', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('3BC108B7-60BE-442C-8362-521AD479AEC6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3BC632D4-3877-40D2-B60E-56A377AB3B71', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '77508b76-d17c-4c08-bd9b-cf2d6ce832c6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3C5D8137-7710-47C3-BD6E-E76B4ABF356B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0D651E28-A260-43E6-A7BF-522909D96D81', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('3DA20886-F98B-4193-9815-CB7080A037CE', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('47B1BE71-20B8-4D96-B3E0-A07834E42BD9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('4D18F5F3-D8D1-48D3-BC8E-5B9F3B30D246', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '123d862c-7965-40c1-bd9b-158582f8bb78', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('4F9FFD75-E5B0-44A0-A0CA-B266B6B51EB2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7A044068-395B-4569-AD29-BB582DF14959', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('5040AB7F-8E6D-47D0-8AD2-E7DDF2F8F214', 'ecff6bc6-8024-43cf-810c-c58604403a76', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('50E06632-5A37-4EDE-9B6B-9D067B970DB6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'B263E084-6FA7-4286-BB35-A9274B04BF2A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('54CA9D9F-2949-46BE-9977-CA64FB4B1C0E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b1d87254-b0ef-4a50-b427-ca0484e4516b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('564E5D5C-BCB7-4835-92CC-4D798F93B829', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('592AE76A-1E26-49A3-8FCA-D757A42A67F0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '57FA8412-AC93-4E3B-B75C-D9A52EC71695', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('594513BF-76C6-4473-ACB8-4979B6740647', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bd959bfa-797c-48ff-b72b-241c84cd03a8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('5F1E6FCA-8558-4DA9-9259-0F689AE028E6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('5F865102-3E54-4652-8866-D0529C87A6A0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c546a78a-7f0d-4cd9-a9ed-96548acb8910', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('5c048c5c-efaa-4a18-8667-e5d3bd1e3b77', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'bc011009-243a-4ca4-a52a-1429c92d1867', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('5ef25835-91c1-4385-9fb8-27797fc5079d', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('6016C154-35D0-4D16-9DE7-E22E37591BD6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '6D94B77D-2793-444D-BDE4-36E59558886C', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('606E6DC0-0BDC-45E1-84AE-BC2F305835B9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6169B963-57CA-4066-A337-E8A77D34E1B4', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6314EB48-0534-450D-AA72-528054872421', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6433011B-40E1-425C-B71C-0BD637B58EEE', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6618D01B-5B6B-43D9-9D84-E2EFF9F6FFB5', 'ecff6bc6-8024-43cf-810c-c58604403a76', '40178207-f2f2-44de-95bc-b5b4beb69e49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('66AB3416-1503-4E10-892D-0699CA785DC3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('66B9750A-4219-49D5-A251-083B328A9E9D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '84F93314-C30D-4C2C-8665-06F0E232C186', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6834feb1-ad02-4182-a110-3a3b5fa19231', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('6897a773-a79f-4154-9d9d-b0db6febca95', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'a3959557-b2ab-4fbc-8942-f72c52dfe972', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('6F418A63-C9B2-443D-B6F3-85D2F6B4200E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '3e544d7a-d850-4785-9648-feafc4698a3b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6FF2DEA3-BE88-4332-B37A-F4E25C1A6681', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f5e0b9d9-5b99-4649-809e-b326dc012f77', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('6cfd93b7-af88-4046-9f84-5300715b3d3c', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '805d0b61-ba00-4b77-b367-a0d309694258', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('72C2D544-C87C-4FE0-86DD-74D2FDB05EDD', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7315A43F-659B-49E3-AEC1-3B1A713F2728', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7961fd3c-6f0e-496c-a656-772742e14d5a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('73917dbf-7b5c-4970-9bb5-6ef1da7ccc86', '18c84947-438c-4987-b556-1c132b1c8be3', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-02-25 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('73BBC236-75BF-4DDF-947F-F0C46EE51E1B', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '4BEBBCA0-66DB-46E8-A8BA-3389991888D6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('76410DFC-BE5E-4DDE-BBA4-B5E2F28AB784', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7dcdf6fd-346a-4e4c-ba29-dcddac52f417', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7742D6A6-9DB4-4546-80ED-372D36EDFD72', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DCACA23C-645A-4D7B-B945-8DA15EBCF214', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('785D567A-FCC8-4D46-9765-3C93442623F0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('788BA2C7-02B2-474F-9F7E-3A7DDB6BCBD6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7A636E16-5FC5-4BE8-AA7A-F536124325B3', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7C3BD56E-323D-455F-BDD5-ADFF63195CCB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'c2947a69-fc79-4861-92ea-87361d8b5715', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7E50D90D-472C-49E1-BE9E-02C33583704C', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ed192e6f-9a49-402b-890b-c46da5468023', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('7a066a3b-4eff-49e7-8777-1015114526e5', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('7cdb5f1c-1d24-44c8-a07a-c9154ee6155f', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('82C4A2FF-DA0A-4B5E-90E2-49074432C3DB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'd396873e-ec5b-4c44-919a-7d206cd0cc90', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('8406341E-7D8F-4355-BB55-D9CEFFBC07A1', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'DF7C758E-F021-45A4-A3CE-B870CD343A3D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('85092D2C-5876-4070-8FE8-0E763743BFD0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('86D084EB-15DD-4E0D-887E-CDC7EE1A4E9F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('873D7378-42B1-4176-87AA-04F8A8BF9AC2', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'AA6F85E5-E048-4841-AD0B-72AAFCB37524', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('879E6947-E46D-4E5D-A2E1-9565BE260C4A', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fc08d048-2ff8-4948-b1b4-876c561bb8d7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('884AE272-D9F9-4BFA-9912-C97DCC570C3E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '269bf251-0579-428d-811a-75be20089161', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('89a646cb-fa74-4d0a-bd36-675314eada03', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '04782509-7aa5-446d-b63f-eac068c4c05a', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('8C5E2CC0-A01E-4502-9DA4-1B7E234A13B1', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('8D3C3988-4E55-41E4-9CDF-12523F4F5014', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7c200187-5793-430b-9eeb-eced97f9798b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('8F9F5109-8F08-4465-9641-75C3762EA5F1', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('930f5da0-4056-4043-992d-3a44d412a149', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('98387c05-def0-4dbb-bde9-9548226efe86', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('9CEDE647-5DEB-47CC-98BC-E817D24FB602', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8fcead5e-991a-4904-99ac-2c9d9269040b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('9DA2ADDF-17BF-4ED3-A10A-C7B3C9C52316', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '805d0b61-ba00-4b77-b367-a0d309694258', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('A358CCF8-826D-4E76-A43C-CEC34DFFA369', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('A3D21C73-9B72-41CD-A149-01BEC6102E0F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('A7DACF42-B7B5-4959-A0E5-248EDB93AA97', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('A7EE58F3-F236-4F22-8BE2-BA1457884DAA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'bc011009-243a-4ca4-a52a-1429c92d1867', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('AA098D8F-4895-4C88-BC22-AB8B700A9666', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('AA593A5B-5F10-4661-BB3C-E38E844EB01F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2df2974e-f90a-4c4d-baf5-fcd16267d36b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('AD04D5B7-02CE-4645-AD76-5770D6A285FB', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'D6991F8E-677B-454F-9B33-E6696636773A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('AE08286A-6381-4CC2-BA6D-DB92BC540089', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'da9e5953-154c-4435-beb7-de71b99753f4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('B10368D7-3BE0-4006-9B9B-912CA668B8A5', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('B1A626EF-022B-4D38-926C-314C35FFB015', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'd6bbc0e4-a5bc-4bc8-af1f-186371c06228', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('B2C51513-A319-43D9-9C1C-B894406AF6C9', 'ecff6bc6-8024-43cf-810c-c58604403a76', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('B4A36D40-1D12-4292-898C-9CC4DFA7017B', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'e620450b-6d17-4192-bee0-66fbd114e82a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('B6FCB90D-9A75-4D50-82C7-F5DB8848CCA0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'fc85f7df-b8d8-4e12-a2c1-00606d290a95', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('B87E5F9A-EC43-4AA8-A409-8E235E1FEE86', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'D6991F8E-677B-454F-9B33-E6696636773A', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('B95DCF0B-8F23-430E-823C-CBCAB155FE77', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '89BDE962-1348-4A4E-9F10-46E37DCA0466', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BA666622-C081-4751-93D6-0C1DB248AFCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '0e35988d-b4a3-4835-a872-d0a32dbcfb5e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BB0BAC25-EF1D-4F33-A4C2-6623CE8E5CF9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BB3340D9-8CFC-4DC0-A071-16AFA74BA5AC', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '02b48102-4e8a-44fb-84a0-7a8c8535676a', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BC65B30B-EA2D-4DA8-AD4C-2E29AF604250', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BDDB831D-A122-4FF7-B954-2659CDD1CF0D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '2e638140-f718-4879-afeb-2fac02bbce2e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('BEE978BA-9C9A-47B6-92FB-9C17739944E9', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'f4ca7d5c-63cf-471f-9226-d7ce5f298272', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C055331A-B4F4-493C-993C-8CD3ECC50492', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'b78f59c1-b6fd-465e-837a-857b77547402', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C33C607B-42B7-46C4-AFFE-389AD36414C0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C530AF7A-53F1-4BBE-82BD-ECAE944BC86F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C6257893-9E28-499F-B9D5-7992DF315C20', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a3959557-b2ab-4fbc-8942-f72c52dfe972', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C6F3DD5D-7DAB-41A8-A338-E8C9D8F5ADF8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '62E80369-FE9E-4AAF-97CD-330CDCC3A393', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C85750AE-6483-4D52-88CE-2543294F58AA', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('C935DBB7-30EC-42C2-8708-CE7A151961EF', 'ecff6bc6-8024-43cf-810c-c58604403a76', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('C9E7FFF2-E2A4-4CC2-93C9-3473533ED4E8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a1086dca-5677-4107-9a95-9a70259e927d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('CD40F265-6778-4583-BC49-23B8DA0C66B6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('CEBD7433-32E0-4701-AE02-333ACECB5CCF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('D097EFF7-9A1E-4880-B311-84D3F439F21E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '365c5bf3-b266-4271-bde3-4d33b280abc1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('D49A2631-B375-46E6-BA26-510ABC16F7C7', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('DC871771-EDF0-4258-A912-829486699C82', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('DE04C3A4-D3C0-48A2-8579-6FB976A80292', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'A7C5B542-A71B-47C9-AF0D-8C76DE7EEB70', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E325EEA4-950A-4DEB-9172-89874C1B3EC0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'ffe5276f-d3af-4af9-b12d-3e969948e8a5', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E4A7184A-5CA8-4FEE-9345-F8BD78AD8D9F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '46331541-77bb-4fcc-9cc0-039ed258048d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E787C639-6A82-488D-BD10-8DE34165E6DF', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '3885ba7f-c246-493f-9053-7aa70a642662', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E8A22C5C-6603-4A98-BE62-77BEA088A33F', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E9639C6B-FEB8-428D-8872-5649C613F0D0', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8cf9b35c-415e-4906-aa66-4b9f7e2804ac', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('E9EAF541-AD9D-42E1-B76D-40D573DB3D27', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'C4E02B4F-725F-4415-8FAF-BC48BD8267BE', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('EAE9C464-7FE8-4940-B136-BCB688F3B14E', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('EB0B535C-583E-4CB1-A253-5381651E5745', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'FF20DE69-EB35-4DE8-AB05-6B731A4F19EF', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('EBBE9600-EE1F-4899-96F4-5CBE8BBFA973', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '8BB151BA-82C7-4E29-9280-23A182026347', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('EC40C26B-2171-4C00-B8C0-48295CCD7259', 'ecff6bc6-8024-43cf-810c-c58604403a76', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('ECEE4402-A67D-49B4-9CAC-F104790DEA21', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '90bae59c-0eea-49f4-a2be-401da670816e', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('EEBCA978-2F5C-4EDF-820B-C26738483559', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '9f0af966-630b-47cd-bb05-a4b3d9c5692d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F056396D-6007-41AA-8F58-4CB701CA5109', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '963f06f5-c1c3-4346-8b0f-7abe22ddeed7', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F204484D-014F-4C0B-B052-B29B13235390', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F32ED2EB-23B0-43A0-98FE-0AD502DCAA24', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '68427266-1bdd-42c0-bd60-094cba29bfaa', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F525DC02-2643-49E0-8C6D-5117D564D464', 'ecff6bc6-8024-43cf-810c-c58604403a76', '46331541-77bb-4fcc-9cc0-039ed258048d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('F60F8E78-067C-452C-A8B8-30900ED863B8', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'C6804680-1D26-4789-964E-4F0AE673B1F4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F614696E-515F-41C8-948F-5E9F2EE03B71', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'eb76dd47-c269-4f95-8585-cbd786d489f3', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F65EBCCC-E404-49DF-8E07-6B057DD190E6', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '5387435A-D258-4C2C-BB23-4A97D17EF177', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F67C797D-2295-4A52-8E54-045A5EB5A035', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('F71CD398-D2AB-406C-B930-EB32B38739CB', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'edb10427-401c-4925-96cc-f7df89ad986d', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('FAADCC0F-3945-4697-BA52-054D2CB166CC', 'ecff6bc6-8024-43cf-810c-c58604403a76', '1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 15:14:07');
INSERT INTO `rbac_rolepermission` VALUES ('FBB2552D-67CA-445F-975D-92937A4F4F6D', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'C7A90251-8133-49D3-8ABF-7B79E5AB7D23', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('FC662A53-6706-4CC3-8183-1D0F8F5367E5', 'd0533453-9cf8-459c-b28c-98cf397efaf1', 'E304E93B-EBBA-4C06-A573-58F856F5E0B0', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:44');
INSERT INTO `rbac_rolepermission` VALUES ('a1bcfe0e-19a5-46b4-a2c7-7abd572eae8e', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '02b48102-4e8a-44fb-84a0-7a8c8535676a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('a1d14136-ce79-4bab-9f3c-b2dee377efc0', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('a413390b-ed04-4d8b-8c53-5aec741c6df5', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('b0d9eede-f098-41a9-bb67-01ec717ea453', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '545d2450-4dac-4377-afbe-d9aa451f795f', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('b2444b0b-e2f9-4a1a-b2cb-678cd5f3aeb1', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '74a5586b-8ed6-4581-92d6-be1599147684', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('da00cfaa-b4a4-4156-b867-e2f45c35ffcd', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'cc91e8f6-b7ff-4c73-b934-302ad3398922', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('e0312bf1-e793-46b0-b09b-ca3b14f50c90', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'c191de03-6b68-4e9e-8c5e-ff17aeca341d', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('e1ccc750-45be-4050-88ff-3b241015bc11', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '810a72f0-55d3-468f-8653-10d1b06a4234', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('e489b1a2-1ad6-4921-8c42-b1d014cb8c6f', '6cc9a788-639a-4c16-940f-da7ee9c9faa6', '2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-30 14:15:47');
INSERT INTO `rbac_rolepermission` VALUES ('f14612d5-fdbf-4fc6-8d84-de065c7dd011', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', 'efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('f3bd3b24-1ac9-4606-8247-a2114b205b49', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');
INSERT INTO `rbac_rolepermission` VALUES ('f8309680-1ad5-4dd1-b2f3-32727d78c3f7', '91cb3a48-87b0-41e5-b9b9-ed1af87a52c0', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00');

-- ----------------------------
-- Table structure for rbac_stafforganize
-- ----------------------------
DROP TABLE IF EXISTS `rbac_stafforganize`;
CREATE TABLE `rbac_stafforganize` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `UserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号',
  `OrganizationId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '部门编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人员组织机构';

-- ----------------------------
-- Records of rbac_stafforganize
-- ----------------------------
INSERT INTO `rbac_stafforganize` VALUES ('0C50DDDF-AE45-4198-B3C7-D052E5CD997E', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', '6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30');
INSERT INTO `rbac_stafforganize` VALUES ('20C1BC2C-8C8F-4AF6-BA02-63BFB149AD63', '48f3889c-af8d-401f-ada2-c383031af92d', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23');
INSERT INTO `rbac_stafforganize` VALUES ('231BE6C8-EE3B-47CA-82F6-14AD9280C82E', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:56:33');
INSERT INTO `rbac_stafforganize` VALUES ('48676584-3DC0-4391-B9BD-49424D048F92', '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', '6636AC3D-DCF1-49C5-849E-35FE17D0FDAB', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:44');
INSERT INTO `rbac_stafforganize` VALUES ('4AD9AF58-9865-4FF6-9CB8-152A25AFB783', '568ffebf-a4ea-44c4-80e1-206d39564cd1', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:04');
INSERT INTO `rbac_stafforganize` VALUES ('6ADB2F3C-2A50-463F-8A87-8B6BE83F0D29', '094f85f8-bc53-4247-979c-09da591d51b0', '77B51251-0D00-45F9-A39F-8B853E8F812D', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:44:58');
INSERT INTO `rbac_stafforganize` VALUES ('7E82CBC7-BDDB-46FB-AA08-B25920AE5AA4', '452865b1d31c', '5CFFFF9B-1C31-4431-B762-51CC10B8D9A4', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53');
INSERT INTO `rbac_stafforganize` VALUES ('B3DB5640-6A75-4065-B0A5-84EFC8298259', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', '50578619-6939-4F6D-B421-9176E76ADBC0', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30');
INSERT INTO `rbac_stafforganize` VALUES ('ddbe38af-3cd3-4115-a318-47d56f7d7c81', '630ecf4b-24b8-4f93-8ca0-2e08f618dae1', 'ebcea0bb-232a-494b-996e-4eb5aa59d1af', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-16 00:00:00');

-- ----------------------------
-- Table structure for rbac_systemmenu
-- ----------------------------
DROP TABLE IF EXISTS `rbac_systemmenu`;
CREATE TABLE `rbac_systemmenu` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `ParentId` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '父节点主键',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `Title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `Image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图标',
  `Category` int(11) DEFAULT NULL COMMENT '菜单分类',
  `NavigateUrl` text COLLATE utf8_bin COMMENT '导航地址',
  `Target` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `Sort` int(11) DEFAULT NULL COMMENT '排序码',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0：删除、1：有效)',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单导航';

-- ----------------------------
-- Records of rbac_systemmenu
-- ----------------------------
INSERT INTO `rbac_systemmenu` VALUES ('010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '0', '后台', '后台', null, '2', 0x2F486F6D652F496E646578, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:16:55', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:19:43');
INSERT INTO `rbac_systemmenu` VALUES ('02b48102-4e8a-44fb-84a0-7a8c8535676a', '545d2450-4dac-4377-afbe-d9aa451f795f', '查看角色权限', '查看角色权限', null, '2', 0x2F41646D696E2F526F6C652F566965775065726D697373696F6E73, 'href', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:46:35');
INSERT INTO `rbac_systemmenu` VALUES ('04782509-7aa5-446d-b63f-eac068c4c05a', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '个人信息', '个人信息', '387.png', '1', 0x2F41646D696E2F557365722F5669657744657461696C73, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-17 16:40:29');
INSERT INTO `rbac_systemmenu` VALUES ('0D651E28-A260-43E6-A7BF-522909D96D81', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '数据显示页', '数据显示页', null, '2', 0x2F44796E616D6963506167652F44796E616D69632F496E646578, 'Iframe', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:33:16', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('0d1764f3-43bb-41cc-8f05-af4d5c90bc2c', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '编辑', '编辑', 'glyphicon glyphicon-pencil', '3', 0x656469742829, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('0e35988d-b4a3-4835-a872-d0a32dbcfb5e', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x616464, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:09', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('123d862c-7965-40c1-bd9b-158582f8bb78', '545d2450-4dac-4377-afbe-d9aa451f795f', '权限管理', '权限管理', 'glyphicon glyphicon-tower', '3', 0x4F6E416C6C6F74417574686F72697479, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:32', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31');
INSERT INTO `rbac_systemmenu` VALUES ('1E2F7D4D-EBB4-40EB-9F8A-C1A0CEC5CA51', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '工作台', '工作台', null, '2', 0x2F486F6D652F576F726B73746174696F6E, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:18:20', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('217e6c74-d95b-4122-9b21-e4ae0fbd4ff6', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x44656C657465, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:19', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('269bf251-0579-428d-811a-75be20089161', '3885ba7f-c246-493f-9053-7aa70a642662', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44');
INSERT INTO `rbac_systemmenu` VALUES ('29a2d9f5-7761-4e18-ba6c-7c5112b3f2fd', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '添加', '添加', 'add.png', '3', 0x6164642829, 'Onclick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('2ccb2e72-6e9c-4cd2-841c-7c8b21c83acf', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '详细', '详细', 'glyphicon glyphicon-list-alt', '3', 0x4F6E53686F7744657461696C, 'OnClick', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:36:37', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('2df2974e-f90a-4c4d-baf5-fcd16267d36b', 'c2947a69-fc79-4861-92ea-87361d8b5715', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x4F6E437265617465, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:38', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48');
INSERT INTO `rbac_systemmenu` VALUES ('2e638140-f718-4879-afeb-2fac02bbce2e', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x4F6E437265617465, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:33', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28');
INSERT INTO `rbac_systemmenu` VALUES ('2fad3cba-f410-41c1-9b6c-5b50739f7bc9', '40178207-f2f2-44de-95bc-b5b4beb69e49', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x44656C6574652829, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-30 11:45:01', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('31BFCF49-C6D5-4AAB-8266-49D8FF01A2E2', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加或修改字典分类', '添加或修改字典分类', null, '2', 0x2F41646D696E2F44696374696F6E6172792F4372656174654F7255706461746543617465676F7279, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:31:15', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('35bf2cc9-a986-4f5d-816c-87fdb062c0b9', '545d2450-4dac-4377-afbe-d9aa451f795f', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31');
INSERT INTO `rbac_systemmenu` VALUES ('365c5bf3-b266-4271-bde3-4d33b280abc1', '3885ba7f-c246-493f-9053-7aa70a642662', '按钮管理', '按钮管理', 'fa fa-cogs', '3', 0x4F6E416C6C6F74427574746F6E73, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44');
INSERT INTO `rbac_systemmenu` VALUES ('3885ba7f-c246-493f-9053-7aa70a642662', '3e544d7a-d850-4785-9648-feafc4698a3b', '网站地图', '网站地图', 'sitemap.png', '1', 0x2F41646D696E2F53797374656D4D656E752F496E646578, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-08 10:05:50');
INSERT INTO `rbac_systemmenu` VALUES ('3e544d7a-d850-4785-9648-feafc4698a3b', '0', '权限管理', '权限管理', 'fa fa-key', '1', null, 'Iframe', '500', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-31 13:38:33');
INSERT INTO `rbac_systemmenu` VALUES ('40178207-f2f2-44de-95bc-b5b4beb69e49', 'a63a0ca2-f2a7-4d27-bffa-67e548513df1', '首页快捷方式', '首页快捷方式', '637.png', '1', 0x2F41646D696E2F486F6D6553686F72746375742F496E646578, 'Iframe', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-29 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 12:30:22');
INSERT INTO `rbac_systemmenu` VALUES ('40B4656C-B442-46CE-9B97-B2DD2C38FC2F', 'c2947a69-fc79-4861-92ea-87361d8b5715', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F5765624170692F557365722F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:45:35', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('41B85D12-882E-409E-B355-5BA0640047AE', '8fcead5e-991a-4904-99ac-2c9d9269040b', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F41646D696E2F557365722F4372656174654F72557064617465, 'Iframe', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:41:13', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:42:32');
INSERT INTO `rbac_systemmenu` VALUES ('45ED8AA9-18AA-4B35-AA3F-90172C99D2E6', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '分配成员', '分配成员', null, '2', 0x2F5765624170692F526F6C652F416C6C6F744D656D62657273, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:46:40', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:21');
INSERT INTO `rbac_systemmenu` VALUES ('46331541-77bb-4fcc-9cc0-039ed258048d', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '详细', '详细', 'glyphicon glyphicon-list-alt', '3', 0x4F6E53686F7744657461696C, 'OnClick', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:28:03', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');
INSERT INTO `rbac_systemmenu` VALUES ('49CE8797-0DD0-49AB-8378-ADDD948810C7', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '返回', '返回', 'glyphicon glyphicon-chevron-left', '3', 0x4F6E4261636B, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:46:08', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('4BEBBCA0-66DB-46E8-A8BA-3389991888D6', '545d2450-4dac-4377-afbe-d9aa451f795f', '分配角色成员', '分配角色成员', null, '2', 0x2F41646D696E2F526F6C652F416C6C6F744D656D62657273, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:48:17', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('4dca14cc-caf8-4b43-9900-c4cfa7ae4b19', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '编辑', '编辑', 'glyphicon glyphicon-pencil', '3', 0x65646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:11', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('5387435A-D258-4C2C-BB23-4A97D17EF177', 'ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '查看日志', '查看日志', null, '2', 0x2F41646D696E2F4C6F676765722F5669657744657461696C73, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:36:37', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('545d2450-4dac-4377-afbe-d9aa451f795f', '3e544d7a-d850-4785-9648-feafc4698a3b', '角色管理', '角色管理', '20130508035646751_easyicon_net_32.png', '1', 0x2F41646D696E2F526F6C652F496E646578, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-08 10:04:01');
INSERT INTO `rbac_systemmenu` VALUES ('55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '0', '系统管理', '系统管理', 'glyphicon glyphicon-cog', '1', null, 'Iframe', '700', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-18 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:29:30');
INSERT INTO `rbac_systemmenu` VALUES ('57FA8412-AC93-4E3B-B75C-D9A52EC71695', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '预览', '预览', 'glyphicon glyphicon-eye-open', '3', 0x4F6E50726576696577, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:01:49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:05:26');
INSERT INTO `rbac_systemmenu` VALUES ('5894638F-82FD-42E1-97B9-E3F7320A8C5C', '8fcead5e-991a-4904-99ac-2c9d9269040b', '分配权限', '分配权限', null, '2', 0x2F41646D696E2F557365722F416C6C6F745065726D697373696F6E73, 'Iframe', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:45:17', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:41:46');
INSERT INTO `rbac_systemmenu` VALUES ('58e86c4c-8022-4d30-95d5-b3d0eedcc878', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '字典管理', '字典管理', '4999_credit.png', '1', 0x2F41646D696E2F44696374696F6E6172792F496E646578, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:55:30');
INSERT INTO `rbac_systemmenu` VALUES ('5c5077f0-7703-4fee-927a-b765e1edf900', '5477b88b-3393-4d39-ba2d-f219f486bd38', '系统个性化', '系统个性化', '581.png', '1', 0x2F524D426173652F537973506572736F6E616C2F496E6469766964756174696F6E5F5365742E61737078, 'Iframe', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-06 00:00:00');
INSERT INTO `rbac_systemmenu` VALUES ('5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '3e544d7a-d850-4785-9648-feafc4698a3b', '按钮管理', '按钮管理', '567.png', '1', 0x2F41646D696E2F427574746F6E2F496E646578, 'Iframe', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-03-31 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-08 10:04:39');
INSERT INTO `rbac_systemmenu` VALUES ('62E80369-FE9E-4AAF-97CD-330CDCC3A393', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '列注释管理', '列注释管理', null, '2', 0x2F44796E616D6963506167652F436F6E66696775726174696F6E2F53686F77436F6C756D6E73, 'Iframe', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:32:45', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('68427266-1bdd-42c0-bd60-094cba29bfaa', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x4F6E437265617465, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:33', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('6D94B77D-2793-444D-BDE4-36E59558886C', '545d2450-4dac-4377-afbe-d9aa451f795f', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F41646D696E2F526F6C652F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:47:30', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:44');
INSERT INTO `rbac_systemmenu` VALUES ('6ECCEFAF-F7C9-4F3A-9F00-19E5D48FA5E4', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F5765624170692F526F6C652F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:54:40', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('6a8044e3-d6ae-406c-a281-5e4d3ba44f67', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '角色管理', '角色管理', null, '1', 0x2F5765624170692F526F6C652F496E646578, 'Iframe', '20', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:34:54', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('737a0a1c-d547-441c-a1db-46b79eb12038', '545d2450-4dac-4377-afbe-d9aa451f795f', '成员管理', '成员管理', 'fa fa-group', '3', 0x4F6E416C6C6F744D656D626572, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:15', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31');
INSERT INTO `rbac_systemmenu` VALUES ('74a5586b-8ed6-4581-92d6-be1599147684', '40178207-f2f2-44de-95bc-b5b4beb69e49', '编辑', '编辑', 'glyphicon glyphicon-pencil', '3', 0x656469742829, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-30 11:45:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('758429ec-3ae9-4a9e-a994-efe7c5395b4a', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '系统设置', '系统设置', '4968_config.png', '1', 0x2F41646D696E2F53797374656D53657474696E672F496E646578, 'Iframe', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:56:15');
INSERT INTO `rbac_systemmenu` VALUES ('77508b76-d17c-4c08-bd9b-cf2d6ce832c6', 'e620450b-6d17-4192-bee0-66fbd114e82a', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51');
INSERT INTO `rbac_systemmenu` VALUES ('7961fd3c-6f0e-496c-a656-772742e14d5a', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '授权', '授权', 'glyphicon glyphicon-thumbs-up', '3', 0x4F6E4163637265646974, 'Onclick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');
INSERT INTO `rbac_systemmenu` VALUES ('7A044068-395B-4569-AD29-BB582DF14959', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '添加或修改信息', '添加或修改信息', null, '2', 0x2F44796E616D6963506167652F457874656E73696F6E50726F70657274792F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:36:55', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:43:38');
INSERT INTO `rbac_systemmenu` VALUES ('7c200187-5793-430b-9eeb-eced97f9798b', 'c2947a69-fc79-4861-92ea-87361d8b5715', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:40', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48');
INSERT INTO `rbac_systemmenu` VALUES ('7dcdf6fd-346a-4e4c-ba29-dcddac52f417', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x4F6E437265617465, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:05', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('7dfdf495-83fe-4194-a042-35fe28c2e36b', '0', '动态页', '动态页', 'fa fa-bolt', '1', 0x23, 'Iframe', '100', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-26 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-07-31 13:38:07');
INSERT INTO `rbac_systemmenu` VALUES ('805d0b61-ba00-4b77-b367-a0d309694258', '810a72f0-55d3-468f-8653-10d1b06a4234', '保存', '保存', 'disk.png', '3', 0x53617665466F726D2829, 'Onclick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('810a72f0-55d3-468f-8653-10d1b06a4234', '545d2450-4dac-4377-afbe-d9aa451f795f', '分配角色权限', '分配角色权限', null, '2', 0x2F41646D696E2F526F6C652F416C6C6F745065726D697373696F6E73, 'href', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-12 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:47:49');
INSERT INTO `rbac_systemmenu` VALUES ('84F93314-C30D-4C2C-8665-06F0E232C186', '0', '新闻中心', '新闻中心', 'fa fa-yelp', '1', null, 'Iframe', '10', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 13:53:04', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 13:55:40');
INSERT INTO `rbac_systemmenu` VALUES ('8520707c-d9bf-4595-a9eb-5ce24c9bc0ff', 'e620450b-6d17-4192-bee0-66fbd114e82a', '删除', '删除', 'glyphicon glyphicon-remove-sign', '3', 0x4F6E44656C657465, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51');
INSERT INTO `rbac_systemmenu` VALUES ('87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '数据管理', '数据管理', 'glyphicon glyphicon-random', '1', 0x2F44796E616D6963506167652F436F6E66696775726174696F6E2F496E646578, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-31 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:18:41');
INSERT INTO `rbac_systemmenu` VALUES ('8884d6af-28ed-466d-9cb1-1a2d55dd12da', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:08', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('89BDE962-1348-4A4E-9F10-46E37DCA0466', '5894638F-82FD-42E1-97B9-E3F7320A8C5C', '保存', '保存', 'glyphicon glyphicon-floppy-save', '3', 0x4F6E53617665, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-25 12:46:06', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('8BB151BA-82C7-4E29-9280-23A182026347', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '查看权限', '查看权限', null, '2', 0x2F5765624170692F526F6C652F566965775065726D697373696F6E73, 'Iframe', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:48:18', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:54:55');
INSERT INTO `rbac_systemmenu` VALUES ('8cf9b35c-415e-4906-aa66-4b9f7e2804ac', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '刷新', '刷新', 'glyphicon glyphicon-refresh', '3', 0x4F6E52656672657368, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:38', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28');
INSERT INTO `rbac_systemmenu` VALUES ('8f131a59-ca06-4ed6-997c-5a4f53c5c9e5', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '返回', '返回', 'glyphicon glyphicon-chevron-left', '3', 0x4F6E4261636B, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:47', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('8f82b5f3-6185-4296-bef6-52eed4e29a94', '/Admin/SystemMenu/AllotButton', '查询', '查询', 'zoom.png', '3', 0x7365617263682829, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-14 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('8fcead5e-991a-4904-99ac-2c9d9269040b', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '用户管理', '用户管理', 'userregedit.png', '1', 0x2F41646D696E2F557365722F496E646578, 'Iframe', '15', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:24:24');
INSERT INTO `rbac_systemmenu` VALUES ('90bae59c-0eea-49f4-a2be-401da670816e', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '编辑', '编辑', 'glyphicon glyphicon-pencil', '3', 0x65646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:17', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('946E9D24-BAF1-4A04-BB18-FC8C8257C1F8', '04782509-7aa5-446d-b63f-eac068c4c05a', '修改密码', '修改密码', null, '2', 0x2F41646D696E2F557365722F4368616E676550617373776F7264, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:39:30', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('9606167a-fd94-4ad6-88b8-1b419dc3410e', '7dfdf495-83fe-4194-a042-35fe28c2e36b', '动态属性', '动态属性', null, '1', 0x2F44796E616D6963506167652F457874656E73696F6E50726F70657274792F496E646578, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:19:32', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:12');
INSERT INTO `rbac_systemmenu` VALUES ('963f06f5-c1c3-4346-8b0f-7abe22ddeed7', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:37', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('9EDAFBE6-3A4F-4A1A-B342-2EE127B073E4', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加或修改字典', '添加或修改字典', null, '2', 0x2F41646D696E2F44696374696F6E6172792F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:30:24', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:30:56');
INSERT INTO `rbac_systemmenu` VALUES ('9f0af966-630b-47cd-bb05-a4b3d9c5692d', '545d2450-4dac-4377-afbe-d9aa451f795f', '添加', '添加', 'add.png', '3', 0x6164642829, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('A7C5B542-A71B-47C9-AF0D-8C76DE7EEB70', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '发布', '发布', 'glyphicon glyphicon-globe', '3', 0x4F6E5075626C697368, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:01:49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:05:26');
INSERT INTO `rbac_systemmenu` VALUES ('AA6F85E5-E048-4841-AD0B-72AAFCB37524', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '查看数据详情', '查看数据详情', null, '2', 0x2F44796E616D6963506167652F44796E616D69632F5669657744657461696C, 'Iframe', '6', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:34:22', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('AFB74C98-DDEA-496F-AF5D-BCC613AEB88D', '40178207-f2f2-44de-95bc-b5b4beb69e49', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F41646D696E2F486F6D6553686F72746375742F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:38:33', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:43:15');
INSERT INTO `rbac_systemmenu` VALUES ('B263E084-6FA7-4286-BB35-A9274B04BF2A', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '编辑修改', '编辑修改', null, '2', 0x2F4E65777343656E7465722F4E6577732F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:07:12', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('B4A6E0B5-ACA5-4ECE-96F8-54164B02AE1D', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '查询配置', '查询配置', null, '2', 0x2F44796E616D6963506167652F436F6E66696775726174696F6E2F53686F77536561726368436F6E666967, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:30:58', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('C4E02B4F-725F-4415-8FAF-BC48BD8267BE', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '添加或编辑数据', '添加或编辑数据', null, '2', 0x2F44796E616D6963506167652F44796E616D69632F4372656174654F72557064617465, 'Iframe', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:33:50', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('C6804680-1D26-4789-964E-4F0AE673B1F4', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加或编辑全局资源', '添加或编辑全局资源', null, '2', 0x2F41646D696E2F476C6F62616C697A6174696F6E2F4372656174654F72557064617465476C6F62616C5265736F75726365, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:34:33', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('C7A90251-8133-49D3-8ABF-7B79E5AB7D23', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '删除', '删除', null, '2', 0x2F4E65777343656E7465722F4E6577732F52656D6F7665, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-07-13 16:17:27', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '0', '组织机构', '组织机构', 'glyphicon glyphicon-pawn', '1', null, 'Iframe', '400', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:23:45', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('D6895A53-773B-44A7-9D8E-F8F98D5E7E1D', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '添加或编辑视图资源', '添加或编辑视图资源', null, '2', 0x2F41646D696E2F476C6F62616C697A6174696F6E2F4372656174654F725570646174654C6F63616C5265736F75726365, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:33:53', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('D6991F8E-677B-454F-9B33-E6696636773A', 'e620450b-6d17-4192-bee0-66fbd114e82a', '添加或修改信息', '添加或修改信息', null, '2', 0x2F41646D696E2F4F7267616E697A6174696F6E2F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:44:56', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:42:49');
INSERT INTO `rbac_systemmenu` VALUES ('D710C465-73AD-4B45-881B-267B53CCC052', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '删除', '删除', 'glyphicon glyphicon-remove-sign', '3', 0x4F6E44656C657465, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:01:49', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:05:26');
INSERT INTO `rbac_systemmenu` VALUES ('DCACA23C-645A-4D7B-B945-8DA15EBCF214', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F5765624170692F526F7574652F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:47:24', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('DF7C758E-F021-45A4-A3CE-B870CD343A3D', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '添加或编辑信息', '添加或编辑信息', null, '2', 0x2F41646D696E2F427574746F6E2F4372656174654F72557064617465, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:15:39', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('DFC4EA95-B7D1-41F9-821A-5C5521E1CF04', '8fcead5e-991a-4904-99ac-2c9d9269040b', '查看用户详情', '查看用户详情', null, '2', 0x2F41646D696E2F557365722F5669657744657461696C73, 'Iframe', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:42:27', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 16:18:34');
INSERT INTO `rbac_systemmenu` VALUES ('E304E93B-EBBA-4C06-A573-58F856F5E0B0', '87b0202d-d6bd-4179-86e7-b1121ddfd0d7', '添加或编辑数据', '添加或编辑数据', null, '2', 0x2F44796E616D6963506167652F436F6E66696775726174696F6E2F53686F774372656174654F72557064617465436F6E666967, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:32:01', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('E3167219-99BE-4F58-9DD4-F7A5AE14F2E7', '010B7B7D-9FFD-4C5B-A2EF-502AF100C193', '查看日志', '查看日志', null, '2', 0x2F486F6D652F4F7065726174696F6E5265636F726473, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:57:21', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 17:28:22');
INSERT INTO `rbac_systemmenu` VALUES ('F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '84F93314-C30D-4C2C-8665-06F0E232C186', '新闻管理', '新闻管理', null, '1', 0x2F4E65777343656E7465722F4E6577732F496E646578, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 13:53:31', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('F4FEFFFB-763C-46EC-AEF6-A9EB581EF148', '758429ec-3ae9-4a9e-a994-efe7c5395b4a', '查看缓存', '查看缓存', null, '2', 0x2F41646D696E2F53797374656D53657474696E672F53686F77436163686573, 'Iframe', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:11', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:41:22');
INSERT INTO `rbac_systemmenu` VALUES ('FF20DE69-EB35-4DE8-AB05-6B731A4F19EF', 'F3FD2BFF-9A9E-4794-A596-4ADE65C71C0A', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 13:56:23', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-06-24 14:05:26');
INSERT INTO `rbac_systemmenu` VALUES ('a1086dca-5677-4107-9a95-9a70259e927d', 'c2947a69-fc79-4861-92ea-87361d8b5715', '授权', '授权', 'glyphicon glyphicon-thumbs-up', '3', 0x4F6E4163637265646974, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 14:21:56', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48');
INSERT INTO `rbac_systemmenu` VALUES ('a3959557-b2ab-4fbc-8942-f72c52dfe972', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'Onclick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');
INSERT INTO `rbac_systemmenu` VALUES ('a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '资源管理', '资源管理', '625.png', '1', 0x2F41646D696E2F476C6F62616C697A6174696F6E2F496E646578, 'Iframe', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-28 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:55:37');
INSERT INTO `rbac_systemmenu` VALUES ('a63a0ca2-f2a7-4d27-bffa-67e548513df1', '0', '个人信息', '个人信息', 'glyphicon glyphicon-user', '1', null, 'Iframe', '300', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-29 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 12:56:49');
INSERT INTO `rbac_systemmenu` VALUES ('aacb438d-bafd-4288-874a-1sae6e8ed4e7', 'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', '三级页面', '三级菜单页面', '576.png', '1', 0x2F524D426173652F5379734461746143656E7465722F4461746143656E7465725F496E6465782E61737078, 'Iframe', '12', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-02 00:00:00');
INSERT INTO `rbac_systemmenu` VALUES ('b15995bc-5d91-4db1-b3ee-2be8fbf99f7e', '9606167a-fd94-4ad6-88b8-1b419dc3410e', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-15 10:22:36', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('b1d87254-b0ef-4a50-b427-ca0484e4516b', '58e86c4c-8022-4d30-95d5-b3d0eedcc878', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x616464, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 14:03:16', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('b4d8cc0e-bdf9-439f-83fa-be8210be5b57', 'c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '保存', '保存', 'glyphicon glyphicon-floppy-save', '3', 0x4F6E53617665, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:43', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('b78f59c1-b6fd-465e-837a-857b77547402', '545d2450-4dac-4377-afbe-d9aa451f795f', '详细', '详细', 'glyphicon glyphicon-list-alt', '3', 0x4F6E53686F7744657461696C, 'OnClick', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-23 14:31:35', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31');
INSERT INTO `rbac_systemmenu` VALUES ('bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '8fcead5e-991a-4904-99ac-2c9d9269040b', ' 用户列表', ' 用户列表', null, '2', 0x2F41646D696E2F557365722F5573657273, 'href', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-16 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:40:27');
INSERT INTO `rbac_systemmenu` VALUES ('bc011009-243a-4ca4-a52a-1429c92d1867', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'Onclick', '7', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');
INSERT INTO `rbac_systemmenu` VALUES ('bd745be7-c7b5-43d2-84c0-8890d7dd5e92', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '路由规则', '路由规则', null, '1', 0x2F5765624170692F526F7574652F496E646578, 'Iframe', '30', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:06', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:30:59');
INSERT INTO `rbac_systemmenu` VALUES ('bd959bfa-797c-48ff-b72b-241c84cd03a8', '3885ba7f-c246-493f-9053-7aa70a642662', '添加或编辑信息', '添加或编辑信息', '153.png', '2', 0x2F41646D696E2F53797374656D4D656E752F4372656174654F72557064617465, 'Open', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:50:16');
INSERT INTO `rbac_systemmenu` VALUES ('c0c5edd9-39b3-4fb8-883d-c6aa5c58e4e6', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x6164642829, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('c191de03-6b68-4e9e-8c5e-ff17aeca341d', '810a72f0-55d3-468f-8653-10d1b06a4234', '返回', '返回', 'back.png', '3', 0x6261636B2829, 'Onclick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-13 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('c2947a69-fc79-4861-92ea-87361d8b5715', 'ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '用户管理', '用户管理', 'glyphicon glyphicon-user', '1', 0x2F5765624170692F557365722F496E646578, 'Iframe', '10', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:45:51', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('c546a78a-7f0d-4cd9-a9ed-96548acb8910', '3885ba7f-c246-493f-9053-7aa70a642662', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 16:53:44');
INSERT INTO `rbac_systemmenu` VALUES ('c8f3a73a-7b35-4d3a-916e-0d5992a670bc', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '分配权限', '分配权限', null, '2', 0x2F5765624170692F526F6C652F416C6C6F745065726D697373696F6E73, 'Iframe', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:29:28', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:09');
INSERT INTO `rbac_systemmenu` VALUES ('cc91e8f6-b7ff-4c73-b934-302ad3398922', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '锁定', '锁定', 'glyphicon glyphicon-lock', '3', 0x4F6E4C6F636B, 'Onclick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-17 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');
INSERT INTO `rbac_systemmenu` VALUES ('d396873e-ec5b-4c44-919a-7d206cd0cc90', 'e620450b-6d17-4192-bee0-66fbd114e82a', '添加', '添加', 'glyphicon glyphicon-plus-sign', '3', 0x4F6E437265617465, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-04 15:00:51');
INSERT INTO `rbac_systemmenu` VALUES ('d6bbc0e4-a5bc-4bc8-af1f-186371c06228', '8fcead5e-991a-4904-99ac-2c9d9269040b', ' 所属部门', ' 所属部门', null, '2', 0x2F41646D696E2F557365722F4465706172746D656E7473, 'href', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-16 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:40:18');
INSERT INTO `rbac_systemmenu` VALUES ('d84d5f23-9220-4ad5-ac66-fef7e303e819', '545d2450-4dac-4377-afbe-d9aa451f795f', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 17:17:31');
INSERT INTO `rbac_systemmenu` VALUES ('da9e5953-154c-4435-beb7-de71b99753f4', '5c5ce6bd-44dc-4903-b1f8-a510ce332c76', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x44656C6574652829, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('df3bb11c-3907-49cf-a091-f9f77b63ed7d', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:06', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('e620450b-6d17-4192-bee0-66fbd114e82a', 'CEFA45C7-5D3E-42D0-A0B2-3CF68980AFD1', '部门管理', '部门管理', '20130508035912738_easyicon_net_32.png', '1', 0x2F41646D696E2F4F7267616E697A6174696F6E2F496E646578, 'Iframe', '20', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-29 10:24:40');
INSERT INTO `rbac_systemmenu` VALUES ('ea6da9bc-7ccb-415f-b037-a8e28fb2db35', '3e544d7a-d850-4785-9648-feafc4698a3b', 'WebApi权限管理', 'WebApi权限管理', 'glyphicon glyphicon-cloud', '1', 0x23, 'Iframe', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:45:01', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 14:55:43');
INSERT INTO `rbac_systemmenu` VALUES ('eb76dd47-c269-4f95-8585-cbd786d489f3', 'c2947a69-fc79-4861-92ea-87361d8b5715', '锁定', '锁定', 'glyphicon glyphicon-lock', '3', 0x4F6E4C6F636B, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 14:22:06', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48');
INSERT INTO `rbac_systemmenu` VALUES ('ed192e6f-9a49-402b-890b-c46da5468023', 'a5c7ffb2-c271-4b77-952b-a1d0f7f385c2', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x44656C657465, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-03-12 11:43:12', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('edb10427-401c-4925-96cc-f7df89ad986d', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:34', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28');
INSERT INTO `rbac_systemmenu` VALUES ('ee5e52c8-aa02-459c-a6eb-311b6a33ddf6', '55ef2c2f-0642-4448-b7f8-0351f4e00ea1', '日志管理', '日志管理', '4937_administrative-docs.png', '1', 0x2F41646D696E2F4C6F676765722F496E646578, 'Iframe', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-04-18 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-01-29 18:00:20');
INSERT INTO `rbac_systemmenu` VALUES ('eecb438d-bafd-4288-874a-1sae6e8ed4e7', 'eecb438d-bafd-4288-874a-1sbe6e8ed4e7', '四级页面', '五级菜单设置', '576.png', '1', 0x2F524D426173652F5379734461746143656E7465722F4461746143656E7465725F496E6465782E61737078, 'Iframe', '12', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-02 00:00:00');
INSERT INTO `rbac_systemmenu` VALUES ('eecb438d-bafd-4288-874a-1sbe6e8ed4e7', 'eecb438d-bafd-4288-874a-3sbe6e8ed4e7', '四级菜单设置', '四级菜单设置', '576.png', '1', 0x2F524D426173652F5379734461746143656E7465722F4461746143656E7465725F496E6465782E61737078, 'Iframe', '12', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-02 00:00:00');
INSERT INTO `rbac_systemmenu` VALUES ('eecb438d-bafd-4288-874a-3sbe6e8ed4e7', 'eecb438d-bafd-4288-874a-3aabe6e8ed4e7', '三级菜单设置', '三级菜单设置', '576.png', '1', 0x2F524D426173652F5379734461746143656E7465722F4461746143656E7465725F496E6465782E61737078, 'Iframe', '12', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-21 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-05-02 00:00:00');
INSERT INTO `rbac_systemmenu` VALUES ('efc5fd8f-9a4b-49da-a8ec-bfcd77887a56', '3885ba7f-c246-493f-9053-7aa70a642662', '分配按钮', '分配按钮', null, '2', 0x2F41646D696E2F53797374656D4D656E752F416C6C6F74427574746F6E73, 'Open', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-08 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-13 13:51:15');
INSERT INTO `rbac_systemmenu` VALUES ('f367dc71-5918-45fd-a4bf-84c0091f18e7', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '权限管理', '权限管理', 'glyphicon glyphicon-tower', '3', 0x4F6E416C6C6F74417574686F72697479, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:36:07', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('f4ca7d5c-63cf-471f-9226-d7ce5f298272', 'bd745be7-c7b5-43d2-84c0-8890d7dd5e92', '删除', '删除', 'glyphicon glyphicon-remove', '3', 0x4F6E44656C657465, 'OnClick', '4', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-01-13 09:28:35', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:28');
INSERT INTO `rbac_systemmenu` VALUES ('f5e0b9d9-5b99-4649-809e-b326dc012f77', '6a8044e3-d6ae-406c-a281-5e4d3ba44f67', '成员管理', '成员管理', 'fa fa-group', '3', 0x4F6E416C6C6F744D656D626572, 'OnClick', '3', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-04 15:35:55', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:13:10');
INSERT INTO `rbac_systemmenu` VALUES ('fa88d47b-64b9-4b0a-ac53-fd24b080dbc2', 'c2947a69-fc79-4861-92ea-87361d8b5715', '编辑', '编辑', 'glyphicon glyphicon-edit', '3', 0x4F6E45646974, 'OnClick', '2', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2015-08-03 13:46:39', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:12:48');
INSERT INTO `rbac_systemmenu` VALUES ('fc08d048-2ff8-4948-b1b4-876c561bb8d7', '3885ba7f-c246-493f-9053-7aa70a642662', '添加', '添加', 'add.png', '3', 0x6164642829, 'OnClick', '1', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-05-04 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('fc85f7df-b8d8-4e12-a2c1-00606d290a95', '40178207-f2f2-44de-95bc-b5b4beb69e49', '添加', '添加', 'glyphicon glyphicon-plus', '3', 0x6164642829, 'OnClick', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2014-12-24 00:00:00', null, null);
INSERT INTO `rbac_systemmenu` VALUES ('ffe5276f-d3af-4af9-b12d-3e969948e8a5', 'bbc045ff-7f04-4da9-b0db-e1dbd24cb3d9', '权限管理', '权限管理', 'glyphicon glyphicon-tower', '3', 0x4F6E416C6C6F74417574686F72697479, 'OnClick', '5', '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-24 16:27:59', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 09:11:59');

-- ----------------------------
-- Table structure for rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Reporter` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '汇报者编号',
  `Code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编码',
  `Account` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '登录账号',
  `Password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `Name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `Sex` int(11) DEFAULT NULL COMMENT '性别(0：女、1：男)',
  `Title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '职称',
  `Email` text COLLATE utf8_bin COMMENT '电子邮件',
  `Theme` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '主题',
  `Question` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '找回密码的问题',
  `Answer` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '找回密码的答案',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0：删除、1：启用、2：停用)',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户';

-- ----------------------------
-- Records of rbac_user
-- ----------------------------
INSERT INTO `rbac_user` VALUES ('094f85f8-bc53-4247-979c-09da591d51b0', null, '10001', 'xingm', null, '明星', '1', null, null, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:44:58');
INSERT INTO `rbac_user` VALUES ('23e714a9-33c6-49bb-be10-0fd455b5f0ad', '094f85f8-bc53-4247-979c-09da591d51b0', '10031', 'bop', null, '彭博', '1', null, null, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-03-30 11:56:33');
INSERT INTO `rbac_user` VALUES ('452865b1d31c', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10033', 'xiaohuw', null, '汪小虎', '1', null, 0x7869616F68757740666C796D652E636F6D, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2000-01-04 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53');
INSERT INTO `rbac_user` VALUES ('48f3889c-af8d-401f-ada2-c383031af92d', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10032', 'system', 'X7MhxkGX2jYBJPPmrDytLw==', '张枫林', '1', '软件工程师', 0x66656E676C696E7A406B6F746569696E666F2E636F6D, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23');
INSERT INTO `rbac_user` VALUES ('4baa8438-930f-4b02-8fc1-d67bd43d2fb0', '094f85f8-bc53-4247-979c-09da591d51b0', '10011', 'sund', null, '杜顺', '1', null, null, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:44');
INSERT INTO `rbac_user` VALUES ('568ffebf-a4ea-44c4-80e1-206d39564cd1', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', '10035', 'yanlingc', null, '陈艳玲', '0', null, null, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:56:44', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:04');
INSERT INTO `rbac_user` VALUES ('75e1f7a2-74ab-4d21-af74-a601f30f02ee', '094f85f8-bc53-4247-979c-09da591d51b0', '10021', 'zhileih', null, '何志磊', '1', null, null, null, null, null, null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2013-04-02 00:00:00', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-05 16:57:30');

-- ----------------------------
-- Table structure for rbac_userpermission
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userpermission`;
CREATE TABLE `rbac_userpermission` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `UserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号',
  `SystemMenuId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户权限';

-- ----------------------------
-- Records of rbac_userpermission
-- ----------------------------

-- ----------------------------
-- Table structure for rbac_userrole
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userrole`;
CREATE TABLE `rbac_userrole` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `UserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '用户编号',
  `RoleId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关系';

-- ----------------------------
-- Records of rbac_userrole
-- ----------------------------
INSERT INTO `rbac_userrole` VALUES ('1F96097A-D9F6-4734-AF31-607619584E7C', '23e714a9-33c6-49bb-be10-0fd455b5f0ad', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10');
INSERT INTO `rbac_userrole` VALUES ('4395B551-05A6-42B9-985B-EFF943E0BA73', '568ffebf-a4ea-44c4-80e1-206d39564cd1', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10');
INSERT INTO `rbac_userrole` VALUES ('4F2B1E60-83C4-42D3-8BD2-9F33382276D8', '48f3889c-af8d-401f-ada2-c383031af92d', 'd0533453-9cf8-459c-b28c-98cf397efaf1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-04-14 10:57:23');
INSERT INTO `rbac_userrole` VALUES ('6591254D-39C8-4B56-A5AC-886B893F6356', '4baa8438-930f-4b02-8fc1-d67bd43d2fb0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10');
INSERT INTO `rbac_userrole` VALUES ('8DF35257-F591-40BF-92A2-1A03A23B92AA', '094f85f8-bc53-4247-979c-09da591d51b0', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10');
INSERT INTO `rbac_userrole` VALUES ('A2E9AD23-81EB-4707-ABDC-C950E775954E', '452865b1d31c', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:48:53');
INSERT INTO `rbac_userrole` VALUES ('D9D34580-BF9A-4F09-820E-49FA78E8A71D', '75e1f7a2-74ab-4d21-af74-a601f30f02ee', 'ecff6bc6-8024-43cf-810c-c58604403a76', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-05-18 14:45:10');

-- ----------------------------
-- Table structure for storage_businessfile
-- ----------------------------
DROP TABLE IF EXISTS `storage_businessfile`;
CREATE TABLE `storage_businessfile` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `Category` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '业务分类',
  `SerialNumber` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '业务流水号',
  `Source` int(11) NOT NULL COMMENT '来源分类(1：附件、2：富文本编辑器)',
  `FileId` char(36) COLLATE utf8_bin NOT NULL COMMENT 'FileId',
  `Description` text COLLATE utf8_bin COMMENT 'Description',
  `Sort` int(11) NOT NULL COMMENT '排序号',
  `UploadUserId` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '上传用户编号',
  `UploadDateTime` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务文件存储';

-- ----------------------------
-- Records of storage_businessfile
-- ----------------------------
INSERT INTO `storage_businessfile` VALUES ('0BFE3A3B-0F41-4C2C-A80A-C8D74D034D80', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'F01D3D20-E189-4F96-8EDC-6CE20785D851', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:26:42');
INSERT INTO `storage_businessfile` VALUES ('39D479BA-6482-4954-933A-6969BE42951C', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'C73171A5-88A8-424B-9262-0D672FCCDC52', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:23:01');
INSERT INTO `storage_businessfile` VALUES ('40D2FEEE-7483-43A6-9C30-B8204F12A406', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', '979DBC7C-5893-42C4-A716-73BCDDC229BC', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-19 10:13:12');
INSERT INTO `storage_businessfile` VALUES ('4E802F26-12B9-4235-9541-C78CC9FD7E80', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'C73171A5-88A8-424B-9262-0D672FCCDC52', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:26:00');
INSERT INTO `storage_businessfile` VALUES ('59A3BDC3-3AA3-4FA6-B427-BA626B2E3535', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'A367317C-73EB-4C2C-988C-77ECE5D40023', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:28:08');
INSERT INTO `storage_businessfile` VALUES ('65813A31-5197-4160-AFDB-6D2CF54598BA', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'A367317C-73EB-4C2C-988C-77ECE5D40023', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:33:41');
INSERT INTO `storage_businessfile` VALUES ('8539135A-3AE7-4105-B378-BB711B130E08', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'C73171A5-88A8-424B-9262-0D672FCCDC52', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:31:31');
INSERT INTO `storage_businessfile` VALUES ('8F49CDED-E1D2-46FA-9E6E-DE399803BA09', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'C73171A5-88A8-424B-9262-0D672FCCDC52', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:49:21');
INSERT INTO `storage_businessfile` VALUES ('9DEDC37A-DBFE-40CC-BF3F-4FA44708238C', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '1', '4F261973-181D-46CD-BD0F-10E98185F739', 0xE5B7A5E4BD9CE591A8E68AA5, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-14 15:53:18');
INSERT INTO `storage_businessfile` VALUES ('BDF0C059-7633-4BA9-8E51-965391C3E0F5', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', '34BF1E37-E2CE-4631-BEC6-567D40075F6C', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 13:15:03');
INSERT INTO `storage_businessfile` VALUES ('C9B799B5-CCCE-4902-8341-35B428FD5478', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'F01D3D20-E189-4F96-8EDC-6CE20785D851', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:23:48');
INSERT INTO `storage_businessfile` VALUES ('E1F4FC28-DB25-402B-927B-DFBEE2B369F2', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', '34BF1E37-E2CE-4631-BEC6-567D40075F6C', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:33:58');
INSERT INTO `storage_businessfile` VALUES ('E89CA23D-459C-4166-8E5B-52129EC0FAEA', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'D1B30ACD-7C77-4986-8423-657C301CBA3A', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:49:36');
INSERT INTO `storage_businessfile` VALUES ('E8AB4D97-8784-43F4-B3DB-614025D23B58', '新闻管理', '1cc526a1-427d-4fe4-8305-beeb1948c4aa', '2', 'C73171A5-88A8-424B-9262-0D672FCCDC52', null, '1', '48f3889c-af8d-401f-ada2-c383031af92d', '2016-10-10 14:34:10');

-- ----------------------------
-- Table structure for storage_file
-- ----------------------------
DROP TABLE IF EXISTS `storage_file`;
CREATE TABLE `storage_file` (
  `Id` char(36) COLLATE utf8_bin NOT NULL COMMENT 'Id',
  `Name` text COLLATE utf8_bin NOT NULL COMMENT '文件名',
  `Size` int(11) NOT NULL COMMENT '文件大小',
  `MD5` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '文件MD5值',
  `ContentType` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '文件MIME类型',
  `SavedPath` text COLLATE utf8_bin NOT NULL COMMENT '文件保存路径',
  `SavedDateTime` datetime NOT NULL COMMENT '文件保存时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上传文件';

-- ----------------------------
-- Records of storage_file
-- ----------------------------
INSERT INTO `storage_file` VALUES ('34BF1E37-E2CE-4631-BEC6-567D40075F6C', 0x343937313432393230303730363235392E706E67, '6038', '3d1b0850a122588bff2df833a5265317', 'image/png', 0x7E2F75706C6F6164732F3230313631302F62343531366532612D636138312D343739612D393239312D3262313736633765616261362E706E67, '2016-10-10 13:15:03');
INSERT INTO `storage_file` VALUES ('4F261973-181D-46CD-BD0F-10E98185F739', 0xE5BCA0E69EABE69E97E5B7A5E4BD9CE6B187E68AA53136E5B9B439E69C88E7ACAC34E591A82E646F63, '83456', '1b514b1cfcf29b8be16f922e6916eaa8', 'application/msword', 0x7E2F75706C6F6164732F3230313631302F36643833323536612D616430332D346130652D623939362D6635656534346262316434612E646F63, '2016-10-10 14:52:50');
INSERT INTO `storage_file` VALUES ('979DBC7C-5893-42C4-A716-73BCDDC229BC', 0x3032373238383335323934323836373335352E706E67, '640039', '207fcb78682f1f7adb392a4460d49609', 'image/png', 0x7E2F75706C6F6164732F3230313630392F63313266623965302D316461312D346562632D623766302D3034653737613430313235362E706E67, '2016-09-19 10:13:12');
INSERT INTO `storage_file` VALUES ('A367317C-73EB-4C2C-988C-77ECE5D40023', 0x31353638343737383832313235323839382E706E67, '6419', 'c2ce1cb8b650c06702eb375816d93d30', 'image/png', 0x7E2F75706C6F6164732F3230313631302F66613533393737642D313462332D346330642D383961372D3936666335346561323834382E706E67, '2016-10-10 14:28:08');
INSERT INTO `storage_file` VALUES ('C73171A5-88A8-424B-9262-0D672FCCDC52', 0x31353136343632333238363237333838322E706E67, '3929', 'd11c9ddafd1a49d7f3985bd73b98f194', 'image/png', 0x7E2F75706C6F6164732F3230313631302F37313235633466312D396561352D343632382D623733642D6466353264386331643461662E706E67, '2016-10-10 13:26:00');
INSERT INTO `storage_file` VALUES ('D1B30ACD-7C77-4986-8423-657C301CBA3A', 0x30343437313433383834323033383531312E706E67, '4607', '1b8c98bfda4afcb87e2a8f5e074120ae', 'image/png', 0x7E2F75706C6F6164732F3230313631302F31623465303835652D356362352D343238642D613636652D3436303131623166383134382E706E67, '2016-10-10 14:49:36');
INSERT INTO `storage_file` VALUES ('E1E53ED3-5568-43EB-9FCE-0A13B1A84728', 0xE59B9BE69DBFE98791E7BC98E695B0E68DAEE5BA93E79A84E8A1A8E7BB93E69E84E69687E6A1A32E786C73, '155648', '9eea0a4794066f140c07dd02d342b8cf', 'application/octet-stream', 0x7E2F75706C6F6164732F3230313631302F63643739666638352D346133652D346637342D393331372D6330366432636439323033352E786C73, '2016-10-10 14:36:28');
INSERT INTO `storage_file` VALUES ('F01D3D20-E189-4F96-8EDC-6CE20785D851', 0x31343039393135313939373639333432372E706E67, '4404', 'cf2d24cd135e5b83720f0da862d38b8c', 'image/png', 0x7E2F75706C6F6164732F3230313631302F66626362646161322D663432372D343630322D616138622D3833663433383032303565362E706E67, '2016-10-10 14:23:48');

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `LogOnId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '登录者编号',
  `LogOnIP` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '登录者IP地址',
  `ModelName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '模块名称',
  `Summary` text COLLATE utf8_bin COMMENT '日志简介',
  `Details` longtext COLLATE utf8_bin COMMENT '日志详情',
  `LogLevel` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '日志级别',
  `OccurrenceDateTime` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志';

-- ----------------------------
-- Records of systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for systemsetting
-- ----------------------------
DROP TABLE IF EXISTS `systemsetting`;
CREATE TABLE `systemsetting` (
  `Id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `ParentId` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '父级编号',
  `Name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `Value` text COLLATE utf8_bin COMMENT '值',
  `Remark` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统设置';

-- ----------------------------
-- Records of systemsetting
-- ----------------------------
INSERT INTO `systemsetting` VALUES ('015B6ED3-B4FF-4A61-B200-59203A7DBC77', null, 'LogLevel', 0x32, '');
INSERT INTO `systemsetting` VALUES ('03d5f601-e11e-4a44-982b-baed7eab37a3', '6b9d4e26-8066-4fc2-bb45-fb02824be265', 'ProductVersion', 0x312E30, null);
INSERT INTO `systemsetting` VALUES ('6b9d4e26-8066-4fc2-bb45-fb02824be265', null, 'ProductName', 0xE5908EE58FB0E7AEA1E79086E7B3BBE7BB9F, null);
INSERT INTO `systemsetting` VALUES ('E402EAAF-B0C6-4D38-8809-B7F6FACDB051', null, 'WebApiDocumentUrl', 0x687474703A2F2F3132372E302E302E313A383030302F46696C6553746F726167652F537761676765722F646F63732F7631, null);

-- ----------------------------
-- Table structure for webapi_api
-- ----------------------------
DROP TABLE IF EXISTS `webapi_api`;
CREATE TABLE `webapi_api` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `Route` text COLLATE utf8_bin COMMENT 'Http路由',
  `HttpVerb` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Http谓词',
  `Description` text COLLATE utf8_bin COMMENT '描述',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Web API';

-- ----------------------------
-- Records of webapi_api
-- ----------------------------
INSERT INTO `webapi_api` VALUES ('1', 0x2F6170692F436F6E6669672F7B6163636F756E747D, 'GET', 0xE88EB7E58F96E8AEA1E7AE97E69CBAE5AF86E992A5E38082, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12', null, null);
INSERT INTO `webapi_api` VALUES ('2', 0x2F6170692F46696C652F55706C6F61642F7B6163636F756E747D, 'POST', 0xE59FBAE4BA8E626173653634E5AD97E7ACA6E4B8B2E4B88AE4BCA0E69687E4BBB6E38082, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12', null, null);
INSERT INTO `webapi_api` VALUES ('3', 0x2F6170692F46696C652F52656D6F76652F7B6163636F756E747D2F7B63617465676F72797D2F7B73657269616C4E756D6265727D, 'POST', 0xE588A0E999A4E69687E4BBB6E38082, '48f3889c-af8d-401f-ada2-c383031af92d', '2016-09-29 11:50:12', null, null);

-- ----------------------------
-- Table structure for webapi_role
-- ----------------------------
DROP TABLE IF EXISTS `webapi_role`;
CREATE TABLE `webapi_role` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `Name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `Description` text COLLATE utf8_bin COMMENT '描述',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Web Api角色';

-- ----------------------------
-- Records of webapi_role
-- ----------------------------
INSERT INTO `webapi_role` VALUES ('1', '开发者', 0xE5BC80E58F91E88085E8B4A6E58FB7, null, null, null, '2016-03-10 15:13:15');

-- ----------------------------
-- Table structure for webapi_rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `webapi_rolepermission`;
CREATE TABLE `webapi_rolepermission` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `RoleId` int(11) NOT NULL COMMENT '角色编号',
  `ApiId` int(11) NOT NULL COMMENT 'Web API编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WebApi权限列表';

-- ----------------------------
-- Records of webapi_rolepermission
-- ----------------------------

-- ----------------------------
-- Table structure for webapi_user
-- ----------------------------
DROP TABLE IF EXISTS `webapi_user`;
CREATE TABLE `webapi_user` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `Account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '账号',
  `Password` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `Description` text COLLATE utf8_bin COMMENT '使用者描述',
  `Status` int(11) DEFAULT NULL COMMENT '状态(1：正常，其它：锁定)',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改者编号',
  `ModifyDateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WebApi用户';

-- ----------------------------
-- Records of webapi_user
-- ----------------------------
INSERT INTO `webapi_user` VALUES ('1', 'nebula', 'ef5caa746eb6e51eef59a31a96c3e99b', 0xE6989FE4BA91E794A8E688B7, null, null, '2016-03-10 15:12:53', null, '2016-03-10 15:12:58');

-- ----------------------------
-- Table structure for webapi_userrole
-- ----------------------------
DROP TABLE IF EXISTS `webapi_userrole`;
CREATE TABLE `webapi_userrole` (
  `Id` int(11) NOT NULL COMMENT '编号',
  `UserId` int(11) NOT NULL COMMENT '用户编号',
  `RoleId` int(11) NOT NULL COMMENT '角色编号',
  `CreateUserId` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者编号',
  `CreateDateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关系';

-- ----------------------------
-- Records of webapi_userrole
-- ----------------------------
