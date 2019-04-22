using System.Collections.Generic;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 数据库连接字符串配置集合
    /// </summary>
    public class ConnectionStrings
    {
        #region Properties

        /// <summary>
        /// 主数据库连接信息
        /// </summary>
        public ConnectionStringConfig Master { get; set; }

        /// <summary>
        /// 从数据库连接配置信息
        /// </summary>
        public ConnectionStringConfig Slave { get; set; }

        #endregion
    }

    /// <summary>
    /// 数据库连接字符串配置
    /// </summary>
    public class ConnectionStringConfig
    {
        #region Fields

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

        #region Properties

        /// <summary>
        /// 数据库提供者(默认为MySQL)
        /// </summary>
        public string Provider { get; set; }

        /// <summary>
        /// 主机地址
        /// </summary>
        public string Host { get; set; }

        /// <summary>
        /// 端口号
        /// </summary>
        public int? Port { get; set; }

        /// <summary>
        /// 账号
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 数据库
        /// </summary>
        public string Database { get; set; }

        /// <summary>
        /// 其他参数
        /// </summary>
        public string Params { get; set; }

        #endregion

        #region Logic Properties

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
