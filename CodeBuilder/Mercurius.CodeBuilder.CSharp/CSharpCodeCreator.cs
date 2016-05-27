using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Ionic.Zip;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Config;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.CodeBuilder.CSharp
{
    public class CSharpCodeCreator : AbstractCodeCreator
    {
        #region 字段

        private static readonly Dictionary<string, IFileCreatedHandler> _dictHandler;

        #endregion

        #region 构造方法

        static CSharpCodeCreator()
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
            if (File.Exists(@"Projects\CSharp.zip"))
            {
                this._buildEvent.Publish(new BuildEventArg(Status.Begin, "开始导入架构..."));

                var zipFile = ZipFile.Read(@"Projects\CSharp.zip", new ReadOptions
                {
                    Encoding = Encoding.GetEncoding("GB2312")
                });

                zipFile.ReadProgress += (sender, e) =>
                {
                    this._buildEvent.Publish(new BuildEventArg(Status.Building, $"正在解压{e.ArchiveName}文件..."));
                };

                var entries = zipFile.Entries.ToList();

                this._buildEvent.Publish(new BuildEventArg(Status.Building, "开始解压基础框架压缩包..."));

                foreach (var t in entries)
                {
                    this._buildEvent.Publish(new BuildEventArg(Status.Building, $"解压{t.FileName}..."));

                    t.FileName = t.FileName.Replace("Mercurius.Sparrow", configuration.BaseNamespace);
                    t.Extract(configuration.OutputFolder, ExtractExistingFileAction.OverwriteSilently);
                }

                this._buildEvent.Publish(new BuildEventArg(Status.Building, "基础框架压缩包解压完成！"));

                foreach (var item in entries)
                {
                    if (item.IsDirectory)
                    {
                        continue;
                    }

                    if (!this.NeedReplaceFile(item.FileName))
                    {
                        continue;
                    }

                    this._buildEvent.Publish(new BuildEventArg(Status.Building, $"修改文件{item.FileName}中的命名空间..."));

                    var fileName = $@"{configuration.OutputFolder}\{item.FileName}";
                    var reader = new StreamReader(fileName, Encoding.UTF8);
                    var texts = reader.ReadToEnd();
                    reader.Dispose();

                    if (texts.Contains("Mercurius.Sparrow"))
                    {
                        texts = texts.Replace("Mercurius.Sparrow", configuration.BaseNamespace);

                        var writer = new StreamWriter(fileName, false, Encoding.UTF8);

                        writer.Write(texts);
                        writer.Dispose();
                    }

                    this._buildEvent.Publish(new BuildEventArg(Status.Building, $"修改文件{item.FileName}中的命名空间完成！"));
                }

                this._buildEvent.Publish(new BuildEventArg(Status.Success, "架构导入完成！"));
            }
        }

        protected override void CreateHandler(Configuration configuration)
        {
            if (configuration?.Tables != null)
            {
                var tables = configuration.Tables.Where(t => t.IsEnabled);

                foreach (var sectionItem in ConfigManager.Items)
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
                            if (configuration.CurrentDatabase.Type != DatabaseType.MSSQL)
                            {
                                table.Name = table.Name.Replace("[", "").Replace("]", "");
                            }

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
            table.Namespace = item.GetNamespace(configuration.BaseNamespace, table.ModuleName);
            table.FullClassNameFormat = $"{table.Namespace}.{table.ClassName}{"{0}"}, {item.GetProjectName(configuration.BaseNamespace)}";

            var xml = table.ToXml(
                configuration.CurrentDatabase,
                configuration.BaseNamespace,
                configuration.Author,
                configuration.BuildDate,
                configuration.CopyrightOwner);

            if (item.Dependencys != null)
            {
                var dependencys = new XElement("dependencys");

                foreach (var dependency in item.Dependencys)
                {
                    var dependencyItem = ConfigManager.Items[dependency];

                    if (dependencyItem == null || (dependencyItem.Name == "SearchResponse" && !table.HasSearchData))
                    {
                        continue;
                    }

                    var dependencyNs = dependencyItem.GetNamespace(configuration.BaseNamespace, table.ModuleName);
                    var element = new XElement("dependency", dependencyNs);

                    element.SetAttributeValue("name", dependencyItem.Name);
                    element.SetAttributeValue("className", string.IsNullOrWhiteSpace(dependencyItem.FileFormat) ? table.ClassName : string.Format(dependencyItem.FileFormat, table.ClassName));
                    element.SetAttributeValue("assembly", dependencyItem.GetProjectName(configuration.BaseNamespace));

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

        private bool NeedReplaceFile(string fileName)
        {
            var extensions = new[] { ".cs", ".xml", ".config", ".sln", ".csproj", ".asax", ".cshtml" };

            return (from e in extensions
                    where
                        fileName.EndsWith(e, StringComparison.InvariantCultureIgnoreCase)
                    select e).Any();
        }

        #endregion
    }
}
