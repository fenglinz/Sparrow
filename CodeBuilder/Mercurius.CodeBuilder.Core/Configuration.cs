using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Security.Principal;
using System.Text;
using Mercurius.CodeBuilder.Core.Database;
using System.IO;
using System.Xml.Linq;
using Prism.Mvvm;
using Newtonsoft.Json;

namespace Mercurius.CodeBuilder.Core
{
    /// <summary>
    /// 代码生成配置信息。
    /// </summary>
    public class Configuration : BindableBase
    {
        #region 字段

        private static readonly string CONFIG_FILE_FORMAT = @"Config\CodeBuildConfiguration-{0}.xml";

        private DateTime _buildDate;
        private string _author = null;
        private string _language = null;
        private string _outputFolder = null;
        private string _baseNamespace = null;
        private string _copyrightOwner = null;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置当前数据库信息。
        /// </summary>
        public ConnectedDatabase CurrentDatabase { get; set; }

        public ObservableCollection<DbTable> Tables { get; private set; }

        #endregion

        #region 界面数据绑定相关属性

        public string Author
        {
            get { return this._author; }
            set
            {
                if (this._author != value)
                {
                    this._author = value;
                    this.OnPropertyChanged(() => this.Author);
                }
            }
        }

        public string Language
        {
            get { return this._language; }
            set
            {
                if (this._language != value)
                {
                    this._language = value;
                    this.OnPropertyChanged(() => this.Language);
                }
            }
        }

        public DateTime BuildDate
        {
            get { return this._buildDate; }
            set
            {
                if (this._buildDate != value)
                {
                    this._buildDate = value;
                    this.OnPropertyChanged(() => this.BuildDate);
                }
            }
        }

        public string OutputFolder
        {
            get { return this._outputFolder; }
            set
            {
                if (this._outputFolder != value)
                {
                    this._outputFolder = value;
                    this.OnPropertyChanged(() => this.OutputFolder);
                }
            }
        }

        public string BaseNamespace
        {
            get { return this._baseNamespace; }
            set
            {
                if (this._baseNamespace != value)
                {
                    this._baseNamespace = value;
                    this.OnPropertyChanged(() => this.BaseNamespace);
                }
            }
        }

        /// <summary>
        /// 版权拥有者。
        /// </summary>
        public string CopyrightOwner
        {
            get { return this._copyrightOwner; }
            set
            {
                if (this._copyrightOwner != value)
                {
                    this._copyrightOwner = value;
                    this.OnPropertyChanged(() => this.CopyrightOwner);
                }
            }
        }

        #endregion

        #region 构造方法

        public Configuration()
        {
            this.BuildDate = DateTime.Now;
            this.Tables = new ObservableCollection<DbTable>();

            var currentUserName = WindowsIdentity.GetCurrent().Name;

            if (!string.IsNullOrWhiteSpace(currentUserName) && currentUserName.Contains('\\'))
            {
                this.Author = currentUserName.Split('\\')[1];
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 将配置信息序列化到文件，以便于下次配置时直接使用上一次的配置信息。
        /// </summary>
        public void SerializeConfiguration()
        {
            var serializedFileName = this.GetSerializedConfigurationFileName();

            if (!File.Exists(serializedFileName))
            {
                using (var stream = File.Create(serializedFileName))
                {
                    var doc = new XDocument(new XElement("root"));

                    doc.Save(stream, SaveOptions.None);
                }
            }

            var xdocument = XDocument.Load(serializedFileName);
            var database = (from x in xdocument.Descendants("database") where x.Attribute("name").Value == this.CurrentDatabase.Name select x).FirstOrDefault();

            if (database == null)
            {
                database = new XElement("database");
                database.SetAttributeValue("name", this.CurrentDatabase.Name);

                xdocument.Root.Add(database);
            }

            database.SetAttributeValue("author", this.Author);
            database.SetAttributeValue("baseNamespace", this.BaseNamespace);
            database.SetAttributeValue("outputFolder", this.OutputFolder);
            database.SetAttributeValue("copyright", this.CopyrightOwner);

            // 移除所有子节点。
            database.RemoveNodes();

            foreach (var item in this.Tables)
            {
                var node = new XElement("table");

                node.SetAttributeValue("name", item.Name);
                node.SetValue(JsonConvert.SerializeObject(item));

                database.Add(node);
            }

            xdocument.Save(serializedFileName, SaveOptions.None);
        }

        /// <summary>
        /// 重新加载上一次的配置信息。
        /// </summary>
        public void ReloadLastConfiguration()
        {
            var recoverTables = this.GetSerializedTables();

            foreach (var table in this.Tables)
            {
                this.Recover(recoverTables, table);
            }
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取序列化文件路径。
        /// </summary>
        /// <returns></returns>
        private string GetSerializedConfigurationFileName()
        {
            return string.Format(CONFIG_FILE_FORMAT, this.CurrentDatabase.Name);
        }

        /// <summary>
        /// 获取已序列化的表配置信息。
        /// </summary>
        /// <returns>已序列化的表配置信息列表</returns>
        private IList<DbTable> GetSerializedTables()
        {
            var serializedFileName = this.GetSerializedConfigurationFileName();

            if (!File.Exists(serializedFileName))
            {
                return null;
            }

            var database = (from x in XDocument.Load(serializedFileName).Descendants("database")
                            where
                                x.Attribute("name").Value == this.CurrentDatabase.Name
                            select x).FirstOrDefault();

            if (database == null)
            {
                return null;
            }

            if (database.Attribute("author") != null)
            {
                this.Author = database.Attribute("author").Value;
            }

            this.OutputFolder = database.Attribute("outputFolder") != null ? database.Attribute("outputFolder").Value : string.Empty;
            this.BaseNamespace = database.Attribute("baseNamespace") != null ? database.Attribute("baseNamespace").Value : string.Empty;
            this.CopyrightOwner = database.Attribute("copyright") != null ? database.Attribute("copyright").Value : string.Empty;

            var tables = new List<DbTable>();

            foreach (var xNode in database.Nodes())
            {
                var item = (XElement) xNode;
                var table = JsonConvert.DeserializeObject<DbTable>(item.Value);

                if (table != null)
                {
                    tables.Add(table);
                }
            }

            return tables;
        }

        /// <summary>
        /// 将已序列化的数据恢复到新的表配置信息中。
        /// </summary>
        /// <param name="serializedTables">已序列化的数据表配置信息集合</param>
        /// <param name="table">新的表配置信息</param>
        private void Recover(IList<DbTable> serializedTables, DbTable table)
        {
            if (serializedTables == null)
            {
                return;
            }

            var serializedTable = (from t in serializedTables where t.Name == table.Name select t).FirstOrDefault();

            if (serializedTable != null)
            {
                table.ClassName = serializedTable.ClassName;
                table.Description = serializedTable.Description;
                table.ModuleName = serializedTable.ModuleName;
                table.ModuleDescription = serializedTable.ModuleDescription;
                table.IsEntityOnly = serializedTable.IsEntityOnly;
                table.HasCreate = serializedTable.HasCreate;
                table.HasUpdate = serializedTable.HasUpdate;
                table.HasCreateOrUpdate = serializedTable.HasCreateOrUpdate;
                table.HasRemove = serializedTable.HasRemove;
                table.HasSingleData = serializedTable.HasSingleData;
                table.HasSearchData = serializedTable.HasSearchData;

                foreach (var item in table.Columns)
                {
                    var configItem = serializedTable.Columns.FirstOrDefault(c => c.Name == item.Name);

                    if (configItem != null)
                    {
                        item.PropertyName = configItem.PropertyName;
                        item.Description = configItem.Description;
                        item.IsSearchCriteria = configItem.IsSearchCriteria;
                    }
                }
            }
        }

        #endregion
    }
}
