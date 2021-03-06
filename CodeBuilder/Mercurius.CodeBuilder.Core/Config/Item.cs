﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Core;

namespace Mercurius.CodeBuilder.Core.Config
{
    /// <summary>
    /// 文件生成配置项实体信息。
    /// </summary>
    public class Item
    {
        #region 属性

        /// <summary>
        /// 配置项名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 依赖项名称。
        /// </summary>
        public string[] Dependencys { get; set; }

        /// <summary>
        /// XSLT文件所在路径。
        /// </summary>
        public string TemplateFile { get; set; }

        /// <summary>
        /// 所属模块(entity,contract,service)
        /// </summary>
        public string Module { get; set; }

        /// <summary>
        /// 文件名称。
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 生成的文件名格式。
        /// </summary>
        public string FileFormat { get; set; }

        /// <summary>
        /// 生成文件的扩展名。
        /// </summary>
        public string Extension { get; set; }

        /// <summary>
        /// 为视图时忽略。
        /// </summary>
        public bool IgnoreView { get; set; }

        /// <summary>
        /// 忽略的属性列表
        /// </summary>
        public IEnumerable<string> IgnoreProperties { get; set; }

        /// <summary>
        /// 关联属性列表
        /// </summary>
        public IEnumerable<string> AssociationProperties { get; set; }

        /// <summary>
        /// 项目。
        /// </summary>
        public string Project { get; set; }

        /// <summary>
        /// 生成文件所在的子目录。
        /// </summary>
        public string SubFolder { get; set; }

        /// <summary>
        /// 代码生成完成后的事件处理。
        /// </summary>
        public string Handler { get; set; }

        /// <summary>
        /// 参数。
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
            if (config.Language == "Java")
            {
                if (this.Name == "SqlMap")
                {
                    return $"{Path.Combine(Directory.GetParent(config.OutputFolder).FullName, "resources")}";
                }

                return $"{config.OutputFolder}\\{config.BaseNamespace.Replace(".", "\\")}";
            }

            var folder = string.Empty;

            switch (this.Module)
            {
                case "entity":
                case "interface":
                    folder = Path.GetDirectoryName(config.EntityProjectFile);

                    break;

                case "contract":
                case "implement":
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
        public string GetNamespace(string baseNamespace, string moduleName, string language = "java")
        {
            var result = baseNamespace;

            if (this.Name == "SqlMap")
            {
                return $"{result}.{(language == "java" ? "mapper" : "Services")}";
            }

            if (!string.IsNullOrWhiteSpace(moduleName))
            {
                result = string.Format("{0}.{1}", result, moduleName);
            }

            if (!string.IsNullOrWhiteSpace(this.SubFolder) && !string.IsNullOrWhiteSpace(this.Extension) && this.Extension.ToLower() == "cs")
            {
                result = string.Format("{0}.{1}", result, this.SubFolder.Replace("\\", "."));
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
                folder = string.Format(@"{0}\{1}", folder, table.ModuleName.Replace(".", "\\"));
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

        /// <summary>
        /// 判断属性是否可以忽略
        /// </summary>
        /// <param name="propName">属性名</param>
        /// <returns>是否可以忽略</returns>
        public bool IsIgnoreProperty(string propName)
        {
            if (this.IgnoreProperties.IsEmpty())
            {
                return false;
            }

            var result = false;

            foreach (var item in this.IgnoreProperties)
            {
                if (item.IsNullOrEmpty())
                {
                    continue;
                }

                var regex = new Regex(item, RegexOptions.IgnoreCase);

                result = regex.IsMatch(propName);

                if (result)
                {
                    break;
                }
            }

            return result;
        }

        /// <summary>
        /// 判断属性是否为有关联字段的属性
        /// </summary>
        /// <param name="propName">属性名</param>
        /// <returns>是否为有关联字段的属性</returns>
        public Tuple<bool, string, string> GetAssociationProperty(string propName)
        {
            if (this.AssociationProperties.IsEmpty())
            {
                return new Tuple<bool, string, string>(false, string.Empty, string.Empty);
            }

            foreach (var item in this.AssociationProperties)
            {
                if (propName.Length > item.Length)
                {
                    if (propName.EndsWith(item, StringComparison.OrdinalIgnoreCase))
                    {
                        return new Tuple<bool, string, string>(true, item, propName.Substring(0, propName.Length - item.Length) + "Name");
                    }
                }
            }

            return new Tuple<bool, string, string>(false, string.Empty, string.Empty);
        }

        #endregion
    }
}
