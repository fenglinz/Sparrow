using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// DbHelper创建器。
    /// </summary>
    public static class DbHelperCreator
    {
        #region 常量

        private const string MSSQLFormater = "Data Source={0};Initial Catalog={1};Persist Security Info=True;User ID={2};Password={3}";
        private const string OracleFormater = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST={0})(PORT={4})))(CONNECT_DATA=(sid={1})));User Id={2};Password={3}";
        private const string MySQLFormater = "server={0};database={1};persistsecurityinfo=True;user id={2};password={3}";

        #endregion

        #region 静态字段

        /// <summary>
        /// 数据库提供者集合。
        /// </summary>
        private static readonly string[] Providers = { "System.Data.SqlClient", "Oracle.ManagedDataAccess.Client", "MySql.Data.MySqlClient" };

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取数据库类型。
        /// </summary>
        /// <param name="provider">数据库提供者</param>
        /// <returns>数据库类型</returns>
        public static DatabaseType GetDatabaseType(string provider)
        {
            var result = default(DatabaseType);

            if (string.Compare(Providers[0], provider,true)==0)
            {
                result = DatabaseType.MSSQL;
            }
            else if (string.Compare(Providers[1], provider, true)==0)
            {
                result = DatabaseType.Oracle;
            }
            else
            {
                result = DatabaseType.MySQL;
            }

            return result;
        }

        /// <summary>
        /// 获取数据库帮助对象。
        /// </summary>
        /// <param name="database">数据库类型</param>
        /// <param name="host">数据库主机</param>
        /// <param name="instance">数据库实例</param>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <param name="port">端口号</param>
        /// <returns>数据库帮助对象</returns>
        public static DbHelper Create(
            DatabaseType database,
            string host,
            string instance,
            string account,
            string password,
            int? port = null)
        {
            var connectionString = GetConnectionString(database, host, instance, account, password, port);
            var dbHelper = new DbHelper(Providers[(int)database], connectionString);

            switch (database)
            {
                case DatabaseType.MSSQL:
                    dbHelper.DbMetadata = new MSSQLMetadata();

                    break;
                case DatabaseType.Oracle:
                    dbHelper.DbMetadata = new OracleMetadata();

                    break;
            }

            return dbHelper;
        }

        /// <summary>
        /// 获取数据库连接字符串。
        /// </summary>
        /// <param name="database">数据库类型</param>
        /// <param name="host">数据库地址</param>
        /// <param name="instance">数据库实例名称</param>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <param name="port">端口号</param>
        /// <returns>数据库连接字符串</returns>
        public static string GetConnectionString(
            DatabaseType database,
            string host,
            string instance,
            string account,
            string password,
            int? port = null)
        {
            var connectionString = string.Empty;

            switch (database)
            {
                case DatabaseType.MSSQL:
                    connectionString = string.Format(MSSQLFormater, host, instance, account, password);

                    break;
                case DatabaseType.Oracle:
                    connectionString = string.Format(OracleFormater, host, instance, account, password, port.HasValue ? port : 1521);

                    break;
                case DatabaseType.MySQL:
                    connectionString = string.Format(MySQLFormater, host, instance, account, password);

                    break;
            }

            return connectionString;
        }

        #endregion
    }
}
