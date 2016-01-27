﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.CSharp
{
    /// <summary>
    /// 配置SqlMap节点。
    /// </summary>
    public class RepositoryCreatedHandler : AbstractFileCreatedHandler
    {
        #region 重写AbstractFileCreatedHandler

        /// <summary>
        /// 文件生成完毕后的处理。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        /// <param name="item">生成配置项</param>
        /// <param name="table">数据库表信息</param>
        /// <param name="fileName">文件名</param>
        public override void OnFileCreateComplated(Configuration configuration, Item item, DbTable table, string fileName)
        {
            if (item.Parameters.ContainsKey("project"))
            {
                var projects = item.Parameters["project"].Split('&');

                foreach (var project in projects)
                {
                    var dbType = configuration.CurrentDatabase.Type;
                    var writerSqlMapFilePath = configuration.OutputFolder + "\\" + string.Format(project, configuration.BaseNamespace, dbType, "Writer");
                    var readerSqlMapFilePath = configuration.OutputFolder + "\\" + string.Format(project, configuration.BaseNamespace, dbType, "Reader");

                    if (File.Exists(writerSqlMapFilePath))
                    {
                        this.ConfigSqlConfig(configuration, table, writerSqlMapFilePath, item.GetProjectName(configuration.BaseNamespace));
                    }

                    if (File.Exists(readerSqlMapFilePath))
                    {
                        this.ConfigSqlConfig(configuration, table, readerSqlMapFilePath, item.GetProjectName(configuration.BaseNamespace));
                    }
                }
            }
        }

        #endregion

        #region 私有方法

        private void ConfigSqlConfig(Configuration configuration, DbTable table, string configFile, string projectName)
        {
            XNamespace xmlns = "http://ibatis.apache.org/dataMapper";
            var embedded = string.Format("{0}.{1}.xml, {2}",
                configuration.CurrentDatabase.Type, table.ClassName, projectName);

            if (!string.IsNullOrWhiteSpace(table.ModuleName))
            {
                embedded = string.Format("{0}.{1}", table.ModuleName, embedded);
            }

            var xdocument = XDocument.Load(configFile);
            var exists = (from s in xdocument.Descendants(xmlns + "sqlMap")
                          where
                              s.Attribute("embedded") != null && s.Attribute("embedded").Value == embedded
                          select s).Any();

            if (!exists)
            {
                var sqlMapElement = new XElement(xmlns + "sqlMap");
                sqlMapElement.SetAttributeValue("embedded", embedded);

                if (xdocument.Descendants(xmlns + "sqlMaps").Any())
                {
                    xdocument.Descendants(xmlns + "sqlMaps").FirstOrDefault().Add(sqlMapElement);
                }
                else
                {
                    var sqlMapsElement = new XElement(xmlns + "sqlMaps");

                    sqlMapsElement.Add(sqlMapElement);
                    xdocument.Root.Add(sqlMapsElement);
                }

                File.SetAttributes(configFile, FileAttributes.Normal);

                xdocument.Save(configFile);
            }
        }

        #endregion
    }
}
