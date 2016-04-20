using System;
using System.Collections.Generic;
using System.Data;
using IBatisNet.DataMapper;

namespace Mercurius.Sparrow.Repositories
{
    /// <summary>
    /// SqlMapper扩展。
    /// </summary>
    public static class SqlMapperExtensions
    {
        #region 常量

        /// <summary>
        /// 数据库提供程序字典(Key：提供者名称、Value：提供者)。
        /// </summary>
        private static readonly Dictionary<string, string> providerDictionary = new Dictionary<string, string>
        {
            { "sqlServer1.0", "System.Data.SqlClient" },
            { "sqlServer1.1", "System.Data.SqlClient" },
            { "sqlServer2.0", "System.Data.SqlClient" },
            { "sqlServer2005", "System.Data.SqlClient" },
            { "OleDb1.1", "System.Data.OleDb" },
            { "OleDb2.0", "System.Data.OleDb" },
            { "Odbc1.1", "System.Data.Odbc" },
            { "Odbc2.0", "System.Data.Odbc" },
            { "oracle9.2", "Oracle.DataAccess.Client" },
            { "ODAC4", "Oracle.DataAccess.Client" },
            { "oracleClient1.0", "System.Data.OracleClient" },
            { "ByteFx", "ByteFX.Data.MySqlClient" },
            { "MySql", "MySql.Data.MySqlClient" },
            { "SQLite3 Finisar", "Finisar.SQLite" },
            { "SQLite3", "System.Data.SQLite" },
            { "Firebird1.7", "FirebirdSql.Data.Firebird" },
            { "PostgreSql", "Npgsql" },
            { "iDb2.10", "IBM.Data.DB2.iSeries" },
            { "Informix", "IBM.Data.Informix" },
        };//

        #endregion

        /// <summary>
        /// 执行存储过程。
        /// </summary>
        /// <param name="sqlMapper">ISqlMapper对象</param>
        /// <param name="produceName">存储过程名称</param>
        /// <param name="commandHandler">Command命令处理</param>
        public static T ExecuteStoredProcedure<T>(this ISqlMapper sqlMapper, string produceName, Func<IDbCommand, T> commandHandler)
        {
            using (var session = sqlMapper.OpenConnection())
            {
                var command = session.CreateCommand(CommandType.StoredProcedure);

                command.CommandText = produceName;

                session.Connection.Open();

                var result = commandHandler.Invoke(command);

                session.Connection.Close();

                return result;
            }
        }

        /// <summary>
        /// 获取数据库提供者。
        /// </summary>
        /// <param name="sqlMapper">ISqlMapper对象</param>
        /// <returns>数据库提供者</returns>
        public static string GetProviderName(this ISqlMapper sqlMapper)
        {
            return providerDictionary[sqlMapper.DataSource.DbProvider.Name];
        }
    }
}
