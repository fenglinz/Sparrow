using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core.Database;
using Newtonsoft.Json;
using Prism.Mvvm;

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
        private string _copyrightOwner = null;

        private string _ormMiddleware = null;

        private string _outputFolder = null;
        private string _entityProjectFile = null;
        private string _contactProjectFile = null;
        private string _serviceProjectFile = null;

        private string _baseNamespace = null;
        private string _webApiPrefix = null;
        private string _entityBaseNamespace = null;
        private string _contractBaseNamespace = null;
        private string _serviceBaseNamespace = null;

        #endregion

        #region 属性

        /// <summary>
        /// 当前数据库信息。
        /// </summary>
        public ConnectedDatabase CurrentDatabase { get; set; }

        /// <summary>
        /// 当前数据库的多有表集合。
        /// </summary>
        public ObservableCollection<DbTable> Tables { get; private set; }

        #endregion

        #region 界面数据绑定相关属性

        public string Author
        {
            get => this._author;
            set
            {
                if (this._author != value)
                {
                    this._author = value;
                    this.RaisePropertyChanged(nameof(this.Author));
                }
            }
        }

        public string Language
        {
            get => this._language;
            set
            {
                if (this._language != value)
                {
                    this._language = value;
                    this.RaisePropertyChanged(nameof(this.Language));
                }
            }
        }

        public DateTime BuildDate
        {
            get => this._buildDate;
            set
            {
                if (this._buildDate != value)
                {
                    this._buildDate = value;
                    this.RaisePropertyChanged(nameof(this.BuildDate));
                }
            }
        }

        /// <summary>
        /// 版权拥有者。
        /// </summary>
        public string CopyrightOwner
        {
            get => this._copyrightOwner;
            set
            {
                if (this._copyrightOwner != value)
                {
                    this._copyrightOwner = value;
                    this.RaisePropertyChanged(nameof(this.CopyrightOwner));
                }
            }
        }

        public string OrmMiddleware
        {
            get => this._ormMiddleware;
            set
            {
                if (this._ormMiddleware != value)
                {
                    this._ormMiddleware = value;
                    this.RaisePropertyChanged(nameof(this.OrmMiddleware));

                    this.EntityProjectFile = string.Empty;
                    this.EntityBaseNamespace = string.Empty;

                    this.ContractProjectFile = string.Empty;
                    this.ContractBaseNamespace = string.Empty;

                    this.ServiceProjectFile = string.Empty;
                    this.ServiceBaseNamespace = string.Empty;
                }
            }
        }

        public string OutputFolder
        {
            get => this._outputFolder;
            set
            {
                if (this._outputFolder != value)
                {
                    this._outputFolder = value;
                    this.RaisePropertyChanged(nameof(this.OutputFolder));
                }
            }
        }

        public string EntityProjectFile
        {
            get => this._entityProjectFile;
            set
            {
                if (this._entityProjectFile != value)
                {
                    this._entityProjectFile = value;
                    this.RaisePropertyChanged(nameof(this.EntityProjectFile));
                }
            }
        }

        public string ContractProjectFile
        {
            get => this._contactProjectFile;
            set
            {
                if (this._contactProjectFile != value)
                {
                    this._contactProjectFile = value;
                    this.RaisePropertyChanged(nameof(this.ContractProjectFile));
                }
            }
        }

        public string ServiceProjectFile
        {
            get => this._serviceProjectFile;
            set
            {
                if (this._serviceProjectFile != value)
                {
                    this._serviceProjectFile = value;
                    this.RaisePropertyChanged(nameof(this.ServiceProjectFile));
                }
            }
        }

        public string BaseNamespace
        {
            get => this._baseNamespace;
            set
            {
                if (this._baseNamespace != value)
                {
                    this._baseNamespace = value;
                    this.RaisePropertyChanged(nameof(this.BaseNamespace));
                }
            }
        }

        public string WebApiPrefix
        {
            get => this._webApiPrefix;
            set
            {
                if (this._webApiPrefix != value)
                {
                    this._webApiPrefix = value;
                    this.RaisePropertyChanged(nameof(this.WebApiPrefix));
                }
            }
        }

        public string EntityBaseNamespace
        {
            get => this._entityBaseNamespace;
            set
            {
                if (this._entityBaseNamespace != value)
                {
                    this._entityBaseNamespace = value;
                    this.RaisePropertyChanged(nameof(this.EntityBaseNamespace));
                }
            }
        }

        public string ContractBaseNamespace
        {
            get => this._contractBaseNamespace;
            set
            {
                if (this._contractBaseNamespace != value)
                {
                    this._contractBaseNamespace = value;
                    this.RaisePropertyChanged(nameof(this.ContractBaseNamespace));
                }
            }
        }

        public string ServiceBaseNamespace
        {
            get => this._serviceBaseNamespace;
            set
            {
                if (this._serviceBaseNamespace != value)
                {
                    this._serviceBaseNamespace = value;
                    this.RaisePropertyChanged(nameof(this.ServiceBaseNamespace));
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

            database.SetAttributeValue("ormMiddleware", this.OrmMiddleware);
            database.SetAttributeValue("author", this.Author);
            database.SetAttributeValue("baseNamespace", this.BaseNamespace);
            database.SetAttributeValue("outputFolder", this.OutputFolder);
            database.SetAttributeValue("copyright", this.CopyrightOwner);

            database.SetAttributeValue("entityProjectFile", this.EntityProjectFile);
            database.SetAttributeValue("contractProjectFile", this.ContractProjectFile);
            database.SetAttributeValue("serviceProjectFile", this.ServiceProjectFile);

            database.SetAttributeValue("entityBaseNamespace", this.EntityBaseNamespace);
            database.SetAttributeValue("contractBaseNamespace", this.ContractBaseNamespace);
            database.SetAttributeValue("serviceBaseNamespace", this.ServiceBaseNamespace);
            database.SetAttributeValue("webApiPrefix", this.WebApiPrefix);

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
        public void ReloadLastConfiguration(Action<DbTable> callback = null)
        {
            var recoverTables = this.GetSerializedTables();

            foreach (var table in this.Tables)
            {
                this.Recover(recoverTables, table);
                callback?.Invoke(table);
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

            this.Author = database.Attribute("author")?.Value;
            this.OutputFolder = database.Attribute("outputFolder")?.Value;
            this.BaseNamespace = database.Attribute("baseNamespace")?.Value;
            this.OrmMiddleware = database.Attribute("ormMiddleware")?.Value;

            if (string.IsNullOrWhiteSpace(this.OrmMiddleware))
            {
                this.OrmMiddleware = Config.OrmMiddleware.Dapper.ToString();
            }

            this.CopyrightOwner = database.Attribute("copyright")?.Value;

            this.EntityProjectFile = database.Attribute("entityProjectFile")?.Value;
            this.ContractProjectFile = database.Attribute("contractProjectFile")?.Value;
            this.ServiceProjectFile = database.Attribute("serviceProjectFile")?.Value;

            this.EntityBaseNamespace = database.Attribute("entityBaseNamespace")?.Value;
            this.ContractBaseNamespace = database.Attribute("contractBaseNamespace")?.Value;
            this.ServiceBaseNamespace = database.Attribute("serviceBaseNamespace")?.Value;
            this.WebApiPrefix = database.Attribute("webApiPrefix")?.Value;

            var tables = new List<DbTable>();

            foreach (var xNode in database.Nodes())
            {
                var item = (XElement)xNode;
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
                table.HasGetAll = serializedTable.HasGetAll;
                table.HasSearchData = serializedTable.HasSearchData;
                table.HasCreateWebApi = serializedTable.HasCreateWebApi;

                foreach (var item in table.Columns)
                {
                    var configItem = serializedTable.Columns.FirstOrDefault(c => c.Name == item.Name);

                    if (configItem != null)
                    {
                        item.PropertyName = configItem.PropertyName;
                        item.Description = configItem.Description;
                        item.IsNewGuid = configItem.IsNewGuid;
                        item.IsSearchCriteria = configItem.IsSearchCriteria;
                        item.IsAddColumn = configItem.IsAddColumn;
                        item.IsUpdateColumn = configItem.IsUpdateColumn;
                    }
                }
            }
        }

        #endregion
    }
}
