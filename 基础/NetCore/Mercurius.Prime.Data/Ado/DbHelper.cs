using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Reflection;
using System.Threading.Tasks;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Data.Parser;

namespace Mercurius.Prime.Data.Ado
{
    /// <summary>
    /// 数据库访问工具类。
    /// </summary>
    public sealed class DbHelper
    {
        #region 字段

        private object _locker = new object();
        private readonly string _providerName;
        private readonly DbProviderFactory _dbProviderFactory;

        private DbMetadata _dbMetadata;

        #endregion

        #region 属性

        /// <summary>
        /// 数据库类型。
        /// </summary>
        public Database Database { get; private set; }

        /// <summary>
        /// 数据库连接。
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// 数据库元数据信息。
        /// </summary>
        public DbMetadata DbMetadata
        {
            get
            {
                return this._dbMetadata;
            }
            set
            {
                if (this._dbMetadata != value)
                {
                    this._dbMetadata = value;
                    this._dbMetadata.DbHelper = this;
                }
            }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="connectionStringName">连接配置字符串名称</param>
        public DbHelper(string connectionStringName = "Default")
        {
            var connectionString = PlatformSection.Instance.ConnectionStrings.Master;

            if (connectionString == null)
            {
                throw new ArgumentException($"不存在名为【{connectionStringName}】的数据库连接配置信息！");
            }

            this._providerName = connectionString.ProviderName;
            this.ConnectionString = connectionString.ConnectionString;
            this.Database = DbHelperCreator.GetDatabaseType(connectionString.ProviderName);

            this._dbProviderFactory = DbProviderFactories.GetFactory(this._providerName);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="providerName">数据库提供者</param>
        /// <param name="connectionString">数据库连接字符串</param>
        public DbHelper(string providerName, string connectionString)
        {
            this._providerName = providerName;
            this.ConnectionString = connectionString;
            this.Database = DbHelperCreator.GetDatabaseType(providerName);

            this._dbProviderFactory = DbProviderFactories.GetFactory(this._providerName);
        }

        #endregion

        #region 尝试连接数据库

        /// <summary>
        /// 尝试连接数据库。
        /// </summary>
        /// <returns>是否连接成功</returns>
        public bool TryConnect()
        {
            var result = false;

            this.GetConnection().TryConnect(out result);

            return result;
        }

        #endregion

        #region 创建/关闭数据库连接

        /// <summary>
        /// 打开数据库连接。
        /// </summary>
        /// <returns>数据库连接对象</returns>
        public DbConnection GetConnection()
        {
            lock (this._locker)
            {
                var connection = this._dbProviderFactory.CreateConnection();

                connection.ConnectionString = this.ConnectionString;

                return connection;
            }
        }

        #endregion

        #region 创建命令对象

        /// <summary>
        /// 创建命令对象。
        /// <para>
        /// 如果已有连接，则创建该基于该连接的命令对象；
        /// 否则，重新创建一个连接和基于新连接的命令对象。
        /// </para>
        /// </summary>
        /// <param name="connection">数据库连接对象</param>
        /// <returns>命令对象</returns>
        public DbCommand CreateCommand(DbConnection connection = null)
        {
            connection = connection ?? this.GetConnection();

            var command = connection.CreateCommand();

            return command;
        }

        /// <summary>
        /// 创建命令对象。
        /// </summary>
        /// <param name="commandText">命令内容</param>
        /// <param name="connection">数据库连接对象</param>
        /// <returns>命令对象</returns>
        public DbCommand CreateCommand(string commandText, DbConnection connection = null)
        {
            var result = this.CreateCommand(connection);

            result.CommandText = commandText;
            result.CommandType = CommandType.Text;

            return result;
        }

        /// <summary>
        /// 创建命令对象。
        /// </summary>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandType">命令类型</param>
        /// <param name="connection">数据库连接对象</param>
        /// <returns>命令对象</returns>
        public DbCommand CreateCommand(string commandText, CommandType commandType, DbConnection connection = null)
        {
            var result = this.CreateCommand(commandText, connection);

            result.CommandType = commandType;

            return result;
        }

        /// <summary>
        /// 创建命令对象。
        /// </summary>
        /// <param name="ns">命令所属的命名空间</param>
        /// <param name="commandName">命令名称</param>
        /// <param name="connection">数据库连接对象</param>
        /// <returns>命令对象</returns>
        public DbCommand CreateCommand(StatementNamespace ns, string commandName, DbConnection connection = null)
        {
            var command = ns.GetXCommand(commandName);
            var result = this.CreateCommand(connection);

            result.CommandText = command.Text;
            result.CommandType = command.Type;

            return result;
        }

        #endregion

        #region 创建适配器

        /// <summary>
        /// 创建数据库适配器对象。
        /// </summary>
        /// <returns>数据库适配器对象</returns>
        public DbDataAdapter CreateDataAdapter()
        {
            return this._dbProviderFactory.CreateDataAdapter();
        }

        #endregion

        #region 命令执行

        /// <summary>
        /// 执行命令(基于同一事务管理)。
        /// </summary>
        /// <param name="commandTexts">命令列表</param>
        public async Task Execute(params string[] commandTexts)
        {
            if (!commandTexts.IsEmpty())
            {
                var connection = this.GetConnection();

                await connection.OpenAsync();

                var transaction = connection.BeginTransaction();

                try
                {
                    foreach (var item in commandTexts)
                    {
                        var command = this.CreateCommand(item, connection);

                        command.Transaction = transaction;

                        command.ExecuteNonQuery();
                    }

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }

        /// <summary>
        /// 执行命令。
        /// </summary>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandHandler">对命令对象进行处理的回调方法</param>
        /// <returns>受影响的行数</returns>
        public int Execute(string commandText, Action<DbCommand> commandHandler)
        {
            var connection = this.GetConnection();
            var command = this.CreateCommand(commandText, connection);

            commandHandler?.Invoke(command);

            return command.ExecuteNonQuery();
        }

        /// <summary>
        /// 执行命令(基于同一事务管理)。
        /// </summary>
        /// <param name="connection">数据库连接对象</param>
        /// <param name="commands">命令对象列表</param>
        public void Execute(DbConnection connection, params DbCommand[] commands)
        {
            if (connection != null && !commands.IsEmpty())
            {
                if (connection.State != ConnectionState.Open)
                {
                    connection.Open();
                }

                var transaction = connection.BeginTransaction();

                try
                {
                    foreach (var item in commands)
                    {
                        item.Connection = connection;
                        item.Transaction = transaction;

                        item.ExecuteNonQuery();
                    }

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();

                    throw;
                }
                finally
                {
                    connection.Dispose();
                }
            }
        }

        #endregion

        #region 获取数据

        /// <summary>
        /// 获取数据。
        /// </summary>
        /// <typeparam name="T">数据的类型</typeparam>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandHandler">对命令对象进行处理的回调方法</param>
        /// <param name="dataMappingHandler">处理数据映射的回调方法</param>
        /// <returns>数据信息集合</returns>
        public IList<T> Execute<T>(
            string commandText,
            Action<DbCommand> commandHandler,
            Func<DbDataReader, T> dataMappingHandler) where T : new()
        {
            using (var dataReader = this.ExecuteReader(commandText, commandHandler))
            {
                var result = new List<T>();

                dataMappingHandler = dataMappingHandler ?? AdoNetExtensions.ReflectionDataMapping<T>;

                while (dataReader.Read())
                {
                    result.Add(dataMappingHandler(dataReader));
                }

                return result;
            }
        }

        /// <summary>
        /// 获取数据。
        /// </summary>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandHandler">对命令对象进行处理的回调方法</param>
        /// <returns>DataReader</returns>
        public DbDataReader ExecuteReader(string commandText, Action<DbCommand> commandHandler = null)
        {
            var connection = this.GetConnection();
            var command = this.CreateCommand(commandText, connection);

            commandHandler?.Invoke(command);

            connection.Open();

            return command.ExecuteReader();
        }

        /// <summary>
        /// 获取数据。
        /// </summary>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandHandler">对命令对象进行处理的回调方法</param>
        /// <returns>数据</returns>
        public DataTable ExecuteDataTable(string commandText, Action<DbCommand> commandHandler = null)
        {
            using (var command = this.CreateCommand(commandText))
            {
                commandHandler?.Invoke(command);

                var result = new DataTable();
                var dataAdapter = this.CreateDataAdapter();

                dataAdapter.SelectCommand = command;
                dataAdapter.Fill(result);

                return result;
            }
        }

        /// <summary>
        /// 获取数据。
        /// </summary>
        /// <param name="command">命令对象</param>
        /// <returns>DataTable</returns>
        public DataTable ExecuteDataTable(DbCommand command)
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            using (command)
            {
                var result = new DataTable();
                var dataAdapter = this.CreateDataAdapter();

                dataAdapter.SelectCommand = command;
                dataAdapter.Fill(result);

                return result;
            }
        }

        /// <summary>
        /// 获取第一行第一列的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="commandText">命令内容</param>
        /// <param name="commandHandler">处理数据映射的回调方法</param>
        /// <returns>数据</returns>
        public T ExecuteScalar<T>(string commandText, Action<DbCommand> commandHandler = null) where T : struct
        {
            var connection = this.GetConnection();
            var command = this.CreateCommand(commandText, connection);

            commandHandler?.Invoke(command);

            connection.Open();

            return (T)command.ExecuteScalar();
        }

        /// <summary>
        /// 获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="commandText">命令内容</param>
        /// <param name="dataMappingHandler">处理数据映射的回调方法</param>
        /// <returns>数据信息集合</returns>
        public IList<T> Execute<T>(string commandText, Func<DbDataReader, T> dataMappingHandler)
        {
            using (var dataReader = this.ExecuteReader(commandText))
            {
                var result = new List<T>();

                while (dataReader.Read())
                {
                    result.Add(dataMappingHandler(dataReader));
                }

                return result;
            }
        }

        #endregion
    }
}
