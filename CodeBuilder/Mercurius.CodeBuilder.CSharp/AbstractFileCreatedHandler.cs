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
            var projectFile = string.Empty;

            switch (item.Module)
            {
                case "entity":
                    projectFile = configuration.EntityProjectFile;

                    break;

                case "contract":
                    projectFile = configuration.ContractProjectFile;

                    break;

                case "service":
                    projectFile = configuration.ServiceProjectFile;

                    break;
            }

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
