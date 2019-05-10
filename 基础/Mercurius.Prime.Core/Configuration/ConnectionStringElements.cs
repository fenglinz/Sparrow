using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 数据库连接字符串配置集合
    /// </summary>
    [ConfigurationCollection(typeof(ConnectionStringConfig), AddItemName = "connection")]
    public class ConnectionStringElements : ConfigurationElementCollection
    {
        #region 属性

        /// <summary>
        /// 主数据库连接名称
        /// </summary>
        [ConfigurationProperty("master")]
        public string Master { get => base["master"]?.ToString(); set => base["master"] = value; }

        [ConfigurationProperty("slave")]
        public string Slave { get => base["slave"]?.ToString(); set => base["slave"] = value; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 获取主数据库地址.
        /// </summary>
        public ConnectionStringConfig MasterConnectionString => GetConnectionString(this.Master);

        /// <summary>
        /// 获取从数据库地址(如未配置从数据库则采用主数据库的配置)
        /// </summary>
        public ConnectionStringConfig SlaveConnectionString => GetConnectionString(this.Slave.IsNullOrEmptyValue(this.Master));

        #endregion

        #region 重写父类方法

        /// <summary>
        /// 创建新的元素
        /// </summary>
        /// <returns>数据库连接字符串配置对象</returns>
        protected override ConfigurationElement CreateNewElement() => new ConnectionStringConfig();

        protected override object GetElementKey(ConfigurationElement element)
        {
            return (element as ConnectionStringConfig)?.Name;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取数据库连接字符串。
        /// </summary>
        /// <param name="name">数据库连接字符串配置名称</param>
        /// <returns>数据库连接字符串</returns>
        public ConnectionStringConfig GetConnectionString(string name)
        {
            if (this.IsEmpty())
            {
                return null;
            }

            foreach (ConnectionStringConfig item in this)
            {
                if (item.Name == name)
                {
                    return item;
                }
            }

            return null;
        }

        #endregion

        public override string ToString()
        {
            var builder = new StringBuilder();

            if (!this.IsEmpty())
            {
                builder.Append($"  主库：{this.Master}，从库：{this.Slave}，数据库连接字符串列表：\n");

                foreach (var item in this)
                {
                    var el = item as ConnectionStringConfig;

                    builder.Append($"    名称：{el.Name}，提供者：{el.Provider}，主机：{el.Host}，端口：{el.Port}，账号：{el.Account}, 密码：{el.Password}\n");
                }
            }

            return builder.ToString();
        }
    }

    /// <summary>
    /// 数据库连接字符串配置
    /// </summary>
    public class ConnectionStringConfig : ConfigurationElement
    {
        #region 字段

        private static readonly Dictionary<string, string> ProviderAlias = new Dictionary<string, string>
        {
            { "sqlserver", "System.Data.SqlClient" },
            { "oracle", "Oracle.ManagedDataAccess.Client" },
            { "mysql", "MySql.Data.MySqlClient" },
            { "sqlite", "System.Data.SQLite" }
        };

        private static readonly Dictionary<string, string> ConnectionStringFormats = new Dictionary<string, string>
        {
            { "sqlserver", "Data Source={0},{1};User ID={2};Password={3};Initial Catalog={4};Persist Security Info=True;{5}" },
            { "oracle", "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST={0})(PORT={1})))(CONNECT_DATA=(sid={4})));User Id={2};Password={3};{5}" },
            { "mysql", "Server={0};port={1};user id={2};password={3};Database={4};SslMode=none;Charset=utf8;{5}" },
            { "sqlite", "Data Source={0};Default Database Type=String" }
        };

        private static readonly Dictionary<string, int> DbDefaultPorts = new Dictionary<string, int>
        {
            { "sqlserver", 1433 },
            { "oracle", 1521 },
            { "mysql", 3306},
            { "sqlite", 0 }
        };

        #endregion

        #region 属性

        /// <summary>
        /// 名称
        /// </summary>
        [ConfigurationProperty("name", IsRequired = true, IsKey = true)]
        public string Name { get => base["name"]?.ToString(); set => base["name"] = value; }

        /// <summary>
        /// 数据库提供者(默认为MySQL)
        /// </summary>
        [ConfigurationProperty("provider", DefaultValue = "MySQL")]
        public string Provider { get => base["provider"]?.ToString(); set => base["provider"] = value; }

        /// <summary>
        /// 主机地址
        /// </summary>
        [ConfigurationProperty("host")]
        public string Host { get => base["host"]?.ToString(); set => base["host"] = value; }

        /// <summary>
        /// 端口号
        /// </summary>
        [ConfigurationProperty("port")]
        public int? Port { get => Convert.ToInt32(base["port"]); set => base["port"] = value; }

        /// <summary>
        /// 账号
        /// </summary>
        [ConfigurationProperty("account")]
        public string Account { get => base["account"]?.ToString(); set => base["account"] = value; }

        /// <summary>
        /// 密码
        /// </summary>
        [ConfigurationProperty("password")]
        public string Password { get => base["password"]?.ToString(); set => base["password"] = value; }

        /// <summary>
        /// 数据库
        /// </summary>
        [ConfigurationProperty("database")]
        public string Database { get => base["database"]?.ToString(); set => base["database"] = value; }

        /// <summary>
        /// 其他参数
        /// </summary>
        [ConfigurationProperty("params")]
        public string Params { get => base["params"]?.ToString(); set => base["params"] = value; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 数据库提供者名称
        /// </summary>
        public string ProviderName
        {
            get
            {
                var key = this.Provider?.ToLower();
                var existProvider = ProviderAlias.ContainsKey(key);

                return existProvider ? ProviderAlias[key] : string.Empty;
            }
        }

        /// <summary>
        /// 获取数据库连接地址
        /// </summary>
        /// <returns>数据库连接字符串</returns>
        public string ConnectionString
        {
            get
            {
                var key = this.Provider?.ToLower();
                var existProvider = ProviderAlias.ContainsKey(key);

                if (existProvider)
                {
                    var format = ConnectionStringFormats[key];
                    var port = this.Port ?? DbDefaultPorts[key];

                    return string.Format(format, this.Host, port, this.Account, this.Password, this.Database, this.Params);
                }

                return string.Empty;
            }
        }

        #endregion
    }
}
