using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Data.Ado;
using Mercurius.Prime.Data.Parser;
using Mercurius.Prime.Data.Parser.Builder;

namespace Mercurius.Prime.Data.Dapper
{
    /// <summary>
    /// 基于dapper的数据持久化类。
    /// </summary>
    public class Persistence
    {
        #region Fields

        /// <summary>
        /// 主库数据库连接
        /// </summary>
        [ThreadStatic]
        private static DbHelper _masterDbHelper;

        /// <summary>
        /// 从库数据库连接
        /// </summary>
        [ThreadStatic]
        private static DbHelper _slaveDbHelper;

        /// <summary>
        /// 主库配置信息
        /// </summary>
        private ConnectionStringOption _master;

        #endregion

        #region Properties

        /// <summary>
        /// 主库连接配置.
        /// </summary>
        public ConnectionStringOption Master
        {
            get => this._master;
            set
            {
                this._master = value;

                switch (value?.Provider.ToLower())
                {
                    case "mysql":
                        this.CommandTextBuilder = new MySqlCommandTextBuilder();

                        break;

                    case "sqlserver":
                        this.CommandTextBuilder = new SqlClientCommandTextBuilder();

                        break;
                    default:
                        this.CommandTextBuilder = null;

                        break;
                }
            }
        }

        /// <summary>
        /// 从库连接配置.
        /// </summary>
        public ConnectionStringOption Slave { get; set; }

        /// <summary>
        /// 命令生成器对象
        /// </summary>
        public CommandTextBuilder CommandTextBuilder { get; private set; }

        #endregion

        #region Execute

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="executeObject">数据对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <returns>受影响的记录数</returns>
        public ExecuteObject Execute(StatementNamespace ns, string name, object executeObject = null)
        {
            return new ExecuteObject(() =>
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                return xcommand.Text;
            }, executeObject);
        }

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="executeObject">数据对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <returns>受影响的记录数</returns>
        public async Task<int> ExecuteAsync(StatementNamespace ns, string name, object paramObject = null)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.Execute(ns, name, paramObject);

                return await executeObject.Execute(connection);
            }
        }

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="executeObject">数据对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <returns>受影响的记录数</returns>
        public ExecuteObject Execute<T>(StatementNamespace ns, string name, object executeObject, Action<Criteria<T>> action = null)
        {
            return new ExecuteObject(() =>
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                return this.CommandTextBuilder.GetNonQueryCommandText(xcommand, action);
            }, executeObject);
        }

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="paramObject">数据对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <returns>受影响的记录数</returns>
        public async Task<int> ExecuteAsync<T>(StatementNamespace ns, string name, object paramObject, Action<Criteria<T>> action = null)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.Execute(ns, name, paramObject, action);

                return await executeObject.Execute(connection);
            }
        }

        #endregion

        #region StoredProcedure

        /// <summary>
        /// 执行存储过程(同步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>受影响的记录数</returns>
        public ExecuteObject StoredProcedure(string procedure, object paramObject, Action<DapperParameters> sets = null)
        {
            var dapperParameters = new DapperParameters(paramObject);

            sets?.Invoke(dapperParameters);

            return new ExecuteObject(() => procedure, dapperParameters, CommandType.StoredProcedure);
        }

        /// <summary>
        /// 执行存储过程(异步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>受影响的记录数</returns>
        public async Task<int> StoredProcedureAsync(string procedure,
            object paramObject, Action<DapperParameters> sets = null, Action<DapperParameters> gets = null)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.StoredProcedure(procedure, paramObject, sets);

                var rs = await executeObject.Execute(connection);

                gets?.Invoke(executeObject.Parameters);

                return rs;
            }
        }

        /// <summary>
        /// 执行存储过程(同步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>返回的结果集</returns>
        public ExecuteObject StoredProcedure<T>(string procedure, object paramObject)
        {
            return new ExecuteObject(() => procedure, paramObject, CommandType.StoredProcedure);
        }

        /// <summary>
        /// 执行存储过程(异步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>返回的结果集</returns>
        public async Task<IEnumerable<T>> StoredProcedureAsync<T>(string procedure, object paramObject)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.StoredProcedure(procedure, paramObject);

                return await executeObject.QueryForList<T>(connection);
            }
        }

        #endregion

        #region Create

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="entities">实体对象集合</param>
        /// <returns>受影响的记录数</returns>
        public ExecuteObject Create<T>(params T[] entities)
        {
            return new ExecuteObject(() => this.CommandTextBuilder.GetCreateCommandText<T>(), entities);
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="entities">实体对象集合</param>
        /// <returns>受影响的记录数</returns>
        public async Task<int> CreateAsync<T>(params T[] entities)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.Create(entities);

                return await executeObject.Execute(connection);
            }
        }

        #endregion

        #region Update

        /// <summary>
        /// 更新实体信息
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="param">更新实体</param>
        /// <param name="action">更新条件回调设置</param>
        /// <returns>受影响的记录数</returns>
        public ExecuteObject Update<T>(object param, Action<Criteria<T>> action = null)
        {
            return new ExecuteObject(() => this.CommandTextBuilder.GetUpdateCommandText(param is T ? null : param, action), param);
        }

        /// <summary>
        /// 更新实体信息
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="param">更新实体</param>
        /// <param name="action">更新条件回调设置</param>
        /// <returns>受影响的记录数</returns>
        public async Task<int> UpdateAsync<T>(object param, Action<Criteria<T>> action = null)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.Update(param, action);

                return await executeObject.Execute(connection);
            }
        }

        #endregion

        #region Remove

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="param">数据信息</param>
        /// <param name="action">删除条件</param>
        /// <returns>受影响的记录</returns>
        public ExecuteObject Remove<T>(object param, Action<Criteria<T>> action = null)
        {
            return new ExecuteObject(() => this.CommandTextBuilder.GetDeleteCommandText(action), param);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="param">数据信息</param>
        /// <param name="action">删除条件</param>
        /// <returns>受影响的记录</returns>
        public async Task<int> RemoveAsync<T>(object param, Action<Criteria<T>> action = null)
        {
            using (var connection = this.GetConnection(this.Master))
            {
                var executeObject = this.Remove(param, action);

                return await executeObject.Execute(connection);
            }
        }

        #endregion

        #region QueryForObject

        /// <summary>
        /// 获取单条实体数据信息
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体对象信息</returns>
        public ExecuteObject QueryForObject<T>(object so = null, Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            return new ExecuteObject(() => this.CommandTextBuilder.GetQueryForObjectCommandText(action, selectors), so);
        }

        /// <summary>
        /// 获取单条实体数据信息
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体对象信息</returns>
        public async Task<T> QueryForObjectAsync<T>(object so = null, Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var executeObject = this.QueryForObject(so, action, selectors);

                return await executeObject.QueryForObject<T>(connection);
            }
        }

        /// <summary>
        /// 返回一条数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="so">查询对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public ExecuteObject QueryForObject<T>(StatementNamespace ns,
            string name, object so = null, Action<SelectCriteria<T>> callback = null)
        {
            return new ExecuteObject(() =>
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                return this.CommandTextBuilder.GetQueryForObjectCommandText(command, callback);
            }, so);
        }

        /// <summary>
        /// 返回一条数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="so">查询对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public async Task<T> QueryForObjectAsync<T>(StatementNamespace ns, string name, object so = null,
            Action<SelectCriteria<T>> callback = null, Func<CommandText, T, Task> subQuery = null)
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetQueryForObjectCommandText(command, callback);

                await connection.OpenAsync();

                command.Connection = connection;

                var data = await connection.QueryFirstOrDefaultAsync<T>(commandText, so);

                if (subQuery != null && data != null)
                {
                    await subQuery(command, data);
                }

                return data;
            }
        }

        #endregion

        #region QueryForList

        /// <summary>
        /// 返回所有符合条件的实体数据.
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体数据集合</returns>
        public IEnumerable<T> QueryForList<T>(object so = null, Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(action, selectors);

                connection.Open();

                return connection.Query<T>(commandText, so);
            }
        }

        /// <summary>
        /// 返回所有符合条件的实体数据.
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体数据集合</returns>
        public async Task<IEnumerable<T>> QueryForListAsync<T>(object so = null, Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(action, selectors);

                await connection.OpenAsync();

                return await connection.QueryAsync<T>(commandText, so);
            }
        }

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public IEnumerable<T> QueryForList<S, T>(StatementNamespace ns, string name,
            S so = null, Action<SelectCriteria<S>> callback = null, Action<CommandText, T> subQuery = null) where S : SearchObject, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(command, callback);

                connection.Open();
                command.Connection = connection;

                var datas = connection.Query<T>(commandText, so);

                if (subQuery != null && !datas.IsEmpty())
                {
                    foreach (var item in datas)
                    {
                        subQuery(command, item);
                    }
                }

                return datas;
            }
        }

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public async Task<IEnumerable<T>> QueryForListAsync<S, T>(StatementNamespace ns, string name,
            S so = null, Action<SelectCriteria<S>> callback = null, Func<CommandText, T, Task> subQuery = null) where S : class, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(command, callback);

                await connection.OpenAsync();

                command.Connection = connection;

                var datas = await connection.QueryAsync<T>(commandText, so);

                if (subQuery != null && !datas.IsEmpty())
                {
                    foreach (var item in datas)
                    {
                        await subQuery(command, item);
                    }
                }

                return datas;
            }
        }

        #endregion

        #region QueryForPagedList

        /// <summary>
        /// 分页查询并返回实体集合
        /// </summary>
        /// <typeparam name="S">查询类型</typeparam>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询参数设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体对象集合</returns>
        public PagedList<T> QueryForPagedList<S, T>(S so = null, Action<SelectCriteria<S>> action = null, params string[] selectors) where S : SearchObject, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                so = so ?? new S();

                var rs = new PagedList<T> { PageIndex = so.PageIndex, PageSize = so.PageSize };
                var commandTexts = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(action, selectors);

                connection.Open();

                var results = connection.QueryMultiple($"{commandTexts.QueryCommandText};{commandTexts.TotalCommandText}", so);

                rs.Datas = results.Read<T>();
                rs.TotalRecords = results.ReadFirstOrDefault<int>();

                return rs;
            }
        }

        /// <summary>
        /// 分页查询并返回实体集合
        /// </summary>
        /// <typeparam name="S">查询类型</typeparam>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="so">查询对象</param>
        /// <param name="action">查询参数设置回调</param>
        /// <param name="selectors">返回数据的列</param>
        /// <returns>实体对象集合</returns>
        public async Task<PagedList<T>> QueryForPagedListAsync<S, T>(S so = null, Action<SelectCriteria<S>> action = null, params string[] selectors) where S : SearchObject, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                so = so ?? new S();

                var rs = new PagedList<T> { PageIndex = so.PageIndex, PageSize = so.PageSize };
                var commandTexts = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(action, selectors);

                await connection.OpenAsync();

                var results = await connection.QueryMultipleAsync($"{commandTexts.QueryCommandText};{commandTexts.TotalCommandText}", so);

                rs.Datas = await results.ReadAsync<T>();
                rs.TotalRecords = await results.ReadFirstOrDefaultAsync<int>();

                return rs;
            }
        }

        /// <summary>
        /// 分页查询。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public PagedList<T> QueryForPagedList<S, T>(StatementNamespace ns, string name, S so = null,
            Action<SelectCriteria<S>> callback = null, Action<CommandText, T> subQuery = null) where S : SearchObject, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                so = so ?? new S();

                var rs = new PagedList<T> { PageIndex = so.PageIndex, PageSize = so.PageSize };

                var command = ns.GetXCommand(name);

                // 分页处理
                var (QueryCommandText, TotalCommandText) = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(command, callback);

                connection.Open();

                var results = connection.QueryMultiple($"{QueryCommandText};{TotalCommandText}", so);

                rs.Datas = results.Read<T>();
                rs.TotalRecords = results.ReadFirstOrDefault<int>();

                command.Connection = connection;

                if (subQuery != null && !rs.Datas.IsEmpty())
                {
                    foreach (var item in rs.Datas)
                    {
                        subQuery(command, item);
                    }
                }

                return rs;
            }
        }

        /// <summary>
        /// 分页查询。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">命令命名空间</param>
        /// <param name="name">命令名称</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        public async Task<PagedList<T>> QueryForPagedListAsync<S, T>(StatementNamespace ns, string name, S so = null,
            Action<SelectCriteria<S>> callback = null, Func<CommandText, T, Task> subQuery = null) where S : SearchObject, new()
        {
            using (var connection = this.GetConnection(this.Slave))
            {
                so = so ?? new S();

                var rs = new PagedList<T> { PageIndex = so.PageIndex, PageSize = so.PageSize };

                var command = ns.GetXCommand(name);

                // 分页处理
                var (QueryCommandText, TotalCommandText) = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(command, callback);

                await connection.OpenAsync();

                var results = await connection.QueryMultipleAsync($"{QueryCommandText};{TotalCommandText}", so);

                rs.Datas = await results.ReadAsync<T>();
                rs.TotalRecords = await results.ReadFirstOrDefaultAsync<int>();

                command.Connection = connection;

                if (subQuery != null && !rs.Datas.IsEmpty())
                {
                    foreach (var item in rs.Datas)
                    {
                        await subQuery(command, item);
                    }
                }

                return rs;
            }
        }

        #endregion

        #region Unit Of Work

        /// <summary>
        /// 
        /// </summary>
        /// <param name="executeObjects"></param>
        /// <param name="useTransaction"></param>
        public async Task ExecuteBatchAsync(IEnumerable<ExecuteObject> executeObjects, bool useTransaction = false)
        {
            if (executeObjects.IsEmpty())
            {
                throw new Exception("没有需要批量处理的数据库操作！");
            }

            using (var connection = this.GetConnection(this.Master))
            {
                var transaction = useTransaction ? connection.BeginTransaction() : null;

                foreach (var item in executeObjects)
                {
                    await item.Execute(connection, transaction);
                }
            }
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// 获取数据库操作对象
        /// </summary>
        /// <param name="element">配置元素</param>
        /// <returns>数据库操作对象</returns>
        private DbConnection GetConnection(ConnectionStringOption element)
        {
            var providerName = element.ProviderName;
            var connectionString = element.ConnectionString;

            var dbHelper = element == this.Master
                ? (_masterDbHelper = _masterDbHelper ?? new DbHelper(providerName, connectionString))
                : (_slaveDbHelper = _slaveDbHelper ?? new DbHelper(providerName, connectionString));

            return dbHelper.GetConnection();
        }

        #endregion
    }
}
