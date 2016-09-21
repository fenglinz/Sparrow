using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// 数据库访问工具类。
    /// </summary>
    public sealed class DbHelper : IDisposable
    {
        #region 字段

        private object _locker = new object();
        private readonly string _providerName;
        private readonly DbProviderFactory _dbProviderFactory;

        private DbMetadata _dbMetadata;
        private DbConnection _connection;
        private DbTransaction _transaction;

        #endregion

        #region 属性

        /// <summary>
        /// 数据库类型。
        /// </summary>
        public DatabaseType Database { get; private set; }

        /// <summary>
        /// 获取或者设置数据库连接。
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// 获取或者设置数据库元数据信息。
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
            var connectionString = ConfigurationManager.ConnectionStrings[connectionStringName];

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

        #region IDispose接口实现

        /// <summary>
        /// 提交/回滚事务。
        /// </summary>
        public void Dispose()
        {
            if (this._transaction != null)
            {
                try
                {
                    this._transaction.Commit();
                }
                catch
                {
                    this._transaction.Rollback();
                }
            }

            this.CloseSession();
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

            this.OpenSession().TryConnect(out result);

            return result;
        }

        #endregion

        #region 创建/关闭数据库连接

        /// <summary>
        /// 打开数据库连接。
        /// </summary>
        /// <returns>数据库连接对象</returns>
        public DbConnection OpenSession()
        {
            if (this._transaction != null && this._connection != null)
            {
                return this._transaction.Connection;
            }

            lock (this._locker)
            {
                if (this._connection == null)
                {
                    this._connection = this._dbProviderFactory.CreateConnection();
                    this._connection.ConnectionString = this.ConnectionString;
                }
            }

            return this._connection.SafeOpen();
        }

        /// <summary>
        /// 关闭数据库连接。
        /// </summary>
        public void CloseSession()
        {
            if (this._connection != null)
            {
                this._connection.Dispose();
                this._connection = null;
            }

            if (this._transaction != null)
            {
                this._transaction.Dispose();
                this._transaction = null;
            }
        }

        #endregion

        #region 事务处理

        /// <summary>
        /// 开始事务处理。
        /// </summary>
        /// <param name="isolationLevel">事务锁级别</param>
        /// <returns>数据库访问工具对象</returns>
        public DbHelper BeginTransaction(IsolationLevel? isolationLevel = null)
        {
            var connection = this.OpenSession().SafeOpen();

            this._transaction = isolationLevel.HasValue ? connection.BeginTransaction(isolationLevel.Value) : connection.BeginTransaction();

            return this;
        }

        /// <summary>
        /// 提交事务。
        /// </summary>
        public void Commit()
        {
            if (this._transaction != null)
            {
                this._transaction.Commit();

                this._transaction.Connection.Dispose();
                this._transaction.Dispose();

                this._transaction = null;
                this._connection = null;
            }
        }

        /// <summary>
        /// 回滚事务。
        /// </summary>
        public void Rollback()
        {
            if (this._transaction != null)
            {
                this._transaction.Rollback();

                this._transaction.Connection.Dispose();
                this._transaction.Dispose();

                this._transaction = null;
                this._connection = null;
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
            connection = connection ?? this.OpenSession();

            var command = connection.CreateCommand();
            command.Transaction = this._transaction;

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
        public void Execute(params string[] commandTexts)
        {
            if (!commandTexts.IsEmpty())
            {
                var connection = this.OpenSession().SafeOpen();
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
            var connection = this.OpenSession().SafeOpen();
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
                connection.SafeOpen();

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
            var connection = this.OpenSession();
            var command = this.CreateCommand(commandText, connection);

            commandHandler?.Invoke(command);

            connection.SafeOpen();

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
            var connection = this.OpenSession();
            var command = this.CreateCommand(commandText, connection);

            commandHandler?.Invoke(command);

            connection.SafeOpen();

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
