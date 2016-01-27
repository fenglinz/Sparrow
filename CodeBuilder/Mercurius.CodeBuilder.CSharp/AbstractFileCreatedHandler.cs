using System;
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
    public abstract class AbstractFileCreatedHandler : IFileCreatedHandler
    {
        #region IFileCreatedHandler接口实现

        /// <summary>
        /// 文件生成完毕后的处理。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        /// <param name="item">生成配置项</param>
        /// <param name="table">数据库表信息</param>
        /// <param name="fileName">文件名</param>
        public abstract void OnFileCreateComplated(Configuration configuration, Item item, DbTable table, string fileName);

        #endregion

        #region 受保护方法

        protected string GetPorjectFile(Configuration configuration, Item item)
        {
            var projectFolder = item.GetProjectFolder(configuration.OutputFolder, configuration.BaseNamespace);
            var projectFile = string.Format(@"{0}\{1}.csproj", projectFolder, item.GetProjectName(configuration.BaseNamespace));

            return projectFile;
        }

        protected ItemGroupItemType GetItemGroupItemType(string extension)
        {
            var result = ItemGroupItemType.Content;

            switch (extension)
            {
                case "cs":
                    result = ItemGroupItemType.Compile;

                    break;

                case "xml":
                    result = ItemGroupItemType.EmbeddedResource;

                    break;

                default:
                    break;
            }

            return result;
        }

        /// <summary>
        /// 获取配置文件。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        /// <param name="item">文件生成配置项信息</param>
        /// <param name="table">数据库表领域信息</param>
        /// <returns>配置文件</returns>
        protected string GetConfigFile(Configuration configuration, Item item, DbTable table)
        {
            var projectName = item.Project.Split('\\').LastOrDefault();
            var projectPath = item.GetProjectFolder(configuration.OutputFolder, configuration.BaseNamespace);
            var configFile = string.IsNullOrWhiteSpace(table.ModuleName) ? string.Format(@"{0}\ApplicationContext-{1}.xml", projectPath, projectName) : string.Format(@"{0}\ApplicationContext-{1}-{2}.xml", projectPath, projectName, table.ModuleName);

            if (!File.Exists(configFile))
            {
                var file = new FileInfo(configFile);

                if (!file.Directory.Exists)
                {
                    file.Directory.Create();
                }

                var xdocument = new XDocument(this.CreateElement("objects"));

                xdocument.Save(configFile, SaveOptions.None);

                var projectFile = this.GetPorjectFile(configuration, item);
                var itemGroupItemType = this.GetItemGroupItemType("xml");

                ProjectFileConfigurationManager.AddItemGroupItem(projectFile, configFile, itemGroupItemType);
            }

            return configFile;
        }

        protected void ConfigImports(Configuration configuration, Item item, DbTable table)
        {
            if (string.IsNullOrWhiteSpace(table.ModuleName))
            {
                return;
            }

            XDocument xdocument = null;
            var projectName = item.Project.Split('\\').LastOrDefault();
            var projectNamespace = item.GetProjectName(configuration.BaseNamespace);
            var projectPath = item.GetProjectFolder(configuration.OutputFolder, configuration.BaseNamespace);

            var configFile = string.Format(@"{0}\ApplicationContext-{1}.xml", projectPath, projectName);
            var assemblyResource = string.Format("assembly://{0}/{0}/ApplicationContext-{1}-{2}.xml", projectNamespace, projectName, table.ModuleName);

            if (!File.Exists(configFile))
            {
                var file = new FileInfo(configFile);

                if (!file.Directory.Exists)
                {
                    file.Directory.Create();
                }

                xdocument = new XDocument(this.CreateElement("objects"));
                xdocument.Save(configFile, SaveOptions.None);
            }
            else
            {
                xdocument = XDocument.Load(configFile);
            }

            var xmlns = this.GetDefaultNamespace();
            var exists = (from o in xdocument.Descendants(xmlns + "import")
                          where
                            o.Attribute("resource").Value == assemblyResource
                          select o).Any();

            if (!exists)
            {
                var element = this.CreateElement("import");
                element.SetAttributeValue("resource", assemblyResource);

                var last = xdocument.Root.Descendants(xmlns + "import").LastOrDefault();

                if (last != null)
                {
                    last.AddAfterSelf(element);
                }
                else
                {
                    var importComment = new XComment(string.Format("导入{0}模块的配置文件", table.ModuleDescription));

                    xdocument.Root.AddFirst(importComment);
                    importComment.AddAfterSelf(element);
                }

                File.SetAttributes(configFile, FileAttributes.Normal);
                xdocument.Save(configFile, SaveOptions.None);
            }
        }

        protected XNamespace GetDefaultNamespace()
        {
            return "http://www.springframework.net";
        }

        protected XElement CreateElement(string name)
        {
            return new XElement(this.GetDefaultNamespace() + name);
        }

        #endregion
    }
}
