using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.Core.Config
{
    /// <summary>
    /// 文件生成配置项实体信息。
    /// </summary>
    public class Item
    {
        #region 属性

        /// <summary>
        /// 获取或者设置配置项名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或者设置依赖项名称。
        /// </summary>
        public string[] Dependencys { get; set; }

        /// <summary>
        /// 获取或者设置XSLT文件所在路径。
        /// </summary>
        public string TemplateFile { get; set; }

        /// <summary>
        /// 所属模块(entity,contract,service)
        /// </summary>
        public string Module { get; set; }

        /// <summary>
        /// 获取或者设置生成的文件名格式。
        /// </summary>
        public string FileFormat { get; set; }

        /// <summary>
        /// 获取或者设置生成文件的扩展名。
        /// </summary>
        public string Extension { get; set; }

        /// <summary>
        /// 为视图时忽略。
        /// </summary>
        public bool IgnoreView { get; set; }

        /// <summary>
        /// 获取或者设置项目。
        /// </summary>
        public string Project { get; set; }

        /// <summary>
        /// 获取或者设置生成文件所在的子目录。
        /// </summary>
        public string SubFolder { get; set; }

        /// <summary>
        /// 获取或者设置代码生成完成后的事件处理。
        /// </summary>
        public string Handler { get; set; }

        /// <summary>
        /// 获取或者设置参数。
        /// </summary>
        public Dictionary<string, string> Parameters { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取生成项所在项目的路径。
        /// </summary>
        /// <returns>项目所在路径</returns>
        public string GetProjectFolder(Configuration config)
        {
            var folder = string.Empty;

            switch (this.Module)
            {
                case "entity":
                    folder = Path.GetDirectoryName(config.EntityProjectFile);

                    break;

                case "contract":
                    folder = Path.GetDirectoryName(config.ContractProjectFile);

                    break;

                case "service":
                    folder = Path.GetDirectoryName(config.ServiceProjectFile);

                    break;
            }

            return folder;
        }

        /// <summary>
        /// 获取生成项的命名空间。
        /// </summary>
        /// <param name="baseNamespace">基命名空间</param>
        /// <param name="moduleName">生成项所属模块</param>
        /// <returns>生成项的命名空间</returns>
        public string GetNamespace(string baseNamespace, string moduleName)
        {
            var result = baseNamespace;

            if (!string.IsNullOrWhiteSpace(moduleName))
            {
                result = string.Format("{0}.{1}", result, moduleName);
            }

            if (!string.IsNullOrWhiteSpace(this.SubFolder) && !string.IsNullOrWhiteSpace(this.Extension) && this.Extension.ToLower() == "cs")
            {
                result = string.Format("{0}.{1}", result, this.SubFolder);
            }

            return result;
        }

        /// <summary>
        /// 获取生成项的输出文件。
        /// </summary>
        /// <param name="config">代码生成配置信息</param>
        /// <param name="table">数据库表配置信息</param>
        /// <returns>生成项的输出文件</returns>
        public string GetOutputFile(Configuration config, DbTable table)
        {
            var folder = this.GetProjectFolder(config);

            if (!string.IsNullOrWhiteSpace(table.ModuleName))
            {
                folder = string.Format(@"{0}\{1}", folder, table.ModuleName);
            }

            if (!string.IsNullOrWhiteSpace(this.SubFolder))
            {
                folder = string.Format(@"{0}\{1}", folder, this.SubFolder.Replace("{dbType}", config.CurrentDatabase.Type.ToString()));
            }

            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            return string.Format(@"{0}\{1}.{2}", folder, string.Format(this.FileFormat, table.ClassName), this.Extension);
        }

        #endregion
    }
}
