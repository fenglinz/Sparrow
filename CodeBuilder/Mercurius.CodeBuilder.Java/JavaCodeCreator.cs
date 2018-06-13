using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Core.Ado;

namespace Mercurius.CodeBuilder.Java
{
    public class JavaCodeCreator : AbstractCodeCreator
    {
        #region 字段

        private static readonly Dictionary<string, IFileCreatedHandler> _dictHandler;

        #endregion

        #region 构造方法

        static JavaCodeCreator()
        {
            _dictHandler = new Dictionary<string, IFileCreatedHandler>();
        }

        #endregion

        /// <summary>
        /// 项目初始化。
        /// </summary>
        /// <param name="configuration">初始化配置</param>
        public override void Initialize(Configuration configuration)
        {
        }

        protected override void CreateHandler(Configuration configuration)
        {
            if (configuration?.Tables != null)
            {
                var tables = configuration.Tables.Where(t => t.IsEnabled);
                var ormMiddleware = OrmMiddleware.MyBatis;

                foreach (var sectionItem in ConfigManager.GetItems(ormMiddleware, configuration.Language))
                {
                    if (configuration.CurrentDatabase.Type != DatabaseType.MSSQL && sectionItem.Name == "SqlMap")
                    {
                        sectionItem.TemplateFile = sectionItem.TemplateFile.Replace("SqlMap.xslt", $"SqlMap_{configuration.CurrentDatabase.Type}.xslt");
                    }

                    // 表的处理。
                    foreach (var table in tables)
                    {
                        if (sectionItem.TemplateFile.EndsWith("xslt", StringComparison.InvariantCultureIgnoreCase))
                        {
                            if (table.IsView && sectionItem.IgnoreView)
                            {
                                continue;
                            }

                            if (table.IsEntityOnly && sectionItem.Name != "Entity")
                            {
                                continue;
                            }

                            if (!table.HasSearchData && sectionItem.Name == "SearchResponse")
                            {
                                continue;
                            }

                            this.CreateByXslt(configuration, sectionItem, table);
                        }
                    }
                }
            }
        }

        #region 私有方法

        /// <summary>
        /// 采用XSLT方式创建代码。
        /// </summary>
        /// <param name="configuration"></param>
        /// <param name="item"></param>
        /// <param name="table"></param>
        private void CreateByXslt(Configuration configuration, Item item, DbTable table)
        {
            item.FileName = string.IsNullOrWhiteSpace(item.FileFormat) ? table.ClassName : string.Format(item.FileFormat, table.ClassName);
            table.Namespace = item.GetNamespace(configuration.BaseNamespace, item.SubFolder.Replace("\\", "."));

            var xml = table.ToXml(configuration);
            var ormMiddleware = OrmMiddleware.MyBatis;

            if (item.Dependencys != null)
            {
                var dependencys = new XElement("dependencys");

                foreach (var dependency in item.Dependencys)
                {
                    var dependencyItem = ConfigManager.GetItems(ormMiddleware, configuration.Language)[dependency];

                    if (dependencyItem == null || (dependencyItem.Name == "SearchResponse" && !table.HasSearchData))
                    {
                        continue;
                    }

                    var package = configuration.BaseNamespace + "." + dependencyItem.SubFolder; ;
                    var dependencyNs = dependencyItem.GetNamespace(configuration.BaseNamespace, dependencyItem.SubFolder.Replace("\\", "."));

                    dependencyItem.FileName = string.IsNullOrWhiteSpace(dependencyItem.FileFormat) ? table.ClassName : string.Format(dependencyItem.FileFormat, table.ClassName);

                    var element = new XElement("dependency", dependencyNs + "." + dependencyItem.FileName);

                    element.SetAttributeValue("name", dependencyItem.Name);
                    element.SetAttributeValue("className", dependencyItem.FileName);
                    element.SetAttributeValue("package", package);

                    var exists = (from d in dependencys.Descendants("dependency") where d.Value == dependencyNs select d).Any();

                    if (!exists)
                    {
                        dependencys.Add(element);
                    }
                }

                xml.Root.Add(dependencys);
            }

            var templateFile = item.TemplateFile;
            var outputFile = item.GetOutputFile(configuration, table);

            XslHelper.Transform(xml, templateFile, outputFile);

            // 代码创建完成后的处理。
            OnFileCreateComplated(configuration, item, table, outputFile);
        }

        private static void OnFileCreateComplated(Configuration configuration, Item sectionItem, DbTable table, string outputFile)
        {
            if (!string.IsNullOrWhiteSpace(sectionItem.Handler))
            {
                var handlers = sectionItem.Handler.Split(';');

                foreach (var handler in handlers)
                {
                    IFileCreatedHandler fileCreateComplateHandler = null;

                    if (_dictHandler.ContainsKey(handler))
                    {
                        fileCreateComplateHandler = _dictHandler[handler];
                    }
                    else
                    {
                        fileCreateComplateHandler = Activator.CreateInstance(Type.GetType(handler)) as IFileCreatedHandler;

                        if (fileCreateComplateHandler != null)
                        {
                            _dictHandler.Add(handler, fileCreateComplateHandler);
                        }
                    }

                    fileCreateComplateHandler?.OnFileCreateComplated(configuration, sectionItem, table, outputFile);
                }
            }
        }

        #endregion
    }
}
