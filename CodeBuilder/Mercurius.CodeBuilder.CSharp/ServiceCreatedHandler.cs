using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Infrastructure;

namespace Mercurius.CodeBuilder.CSharp
{
    public class ServiceCreatedHandler : AbstractFileCreatedHandler
    {
        #region 重写AbstractFileCreatedHandler

        /// <summary>
        /// 文件生成完毕后的处理。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        /// <param name="sectionItem">生成配置项</param>
        /// <param name="table">数据库表信息</param>
        /// <param name="fileName">文件名</param>
        public override void OnFileCreateComplated(Configuration configuration, Item sectionItem, DbTable table, string fileName)
        {
            var configFile = this.GetConfigFile(configuration, sectionItem, table);
            var xdocument = XDocument.Load(configFile);

            var id = string.Format("{0}Service", table.ClassName.CamelNaming());

            var xmlns = this.GetDefaultNamespace();
            var exists = (from o in xdocument.Descendants(xmlns + "object")
                          where
                              o.Attribute("id").Value == id
                          select o).Any();

            if (!exists)
            {
                var element = this.CreateElement("object");

                element.SetAttributeValue("id", id);
                element.SetAttributeValue("type", string.Format(table.FullClassNameFormat, "Service"));
                element.SetAttributeValue("parent", "serviceSupport");
                
                xdocument.Root.Add(new XComment(string.Format("配置{0}服务对象", table.Description)));
                xdocument.Root.Add(element);

                File.SetAttributes(configFile, FileAttributes.Normal);
                xdocument.Save(configFile, SaveOptions.None);
            }

            this.ConfigImports(configuration, sectionItem, table);
        }

        #endregion
    }
}
