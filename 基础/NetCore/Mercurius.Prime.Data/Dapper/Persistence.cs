using System;
using System.Collections.Generic;
using System.Diagnostics;
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
        private ConnectionStringConfig _master;

        #endregion

        #region Properties

        /// <summary>
        /// 主库连接配置.
        /// </summary>
        public ConnectionStringConfig Master
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
        public ConnectionStringConfig Slave { get; set; }

        /// <summary>
        /// 命令生成器对象
        /// </summary>
        public CommandTextBuilder CommandTextBuilder { get; private set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public Persistence()
        {
            this.Master = PlatformConfig.Instance.ConnectionStrings.Master;
            this.Slave = PlatformConfig.Instance.ConnectionStrings.Slave;
        }

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
        public int Execute(StatementNamespace ns, string name, object executeObject = null)
        {
            using (var helper = this.GetDbHelper(this.Master))
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                return helper.OpenSession().Execute(xcommand.Text, executeObject);
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
        public int Execute<T>(StatementNamespace ns, string name, object executeObject, Action<Criteria<T>> action = null)
        {
            using (var helper = this.GetDbHelper(this.Master))
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetNonQueryCommandText(xcommand, action);

                return helper.OpenSession().Execute(commandText, executeObject);
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
        public int Create<T>(params T[] entities)
        {
            using (var helper = this.GetDbHelper(this.Master))
            {
                var commandText = this.CommandTextBuilder.GetCreateCommandText<T>();

                return helper.OpenSession().Execute(commandText, entities);
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
        public int Update<T>(object param, Action<Criteria<T>> action = null)
        {
            using (var helper = this.GetDbHelper(this.Master))
            {
                var commandText = this.CommandTextBuilder.GetUpdateCommandText(param is T ? null : param, action);

                return helper.OpenSession().Execute(commandText, param);
            }
        }

        #endregion

        #region Remove

        public int Remove<T>(object param, Action<Criteria<T>> action = null)
        {
            using (var helper = this.GetDbHelper(this.Master))
            {
                var commandText = this.CommandTextBuilder.GetDeleteCommandText(action);

                return helper.OpenSession().Execute(commandText, param);
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
        public T QueryForObject<T>(object so = null, Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForObjectCommandText(action, selectors);

                return helper.OpenSession().QuerySingleOrDefault<T>(commandText, so);
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
        public T QueryForObject<T>(
            StatementNamespace ns, string name, object so = null,
            Action<SelectCriteria<T>> callback = null, Action<CommandText, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetQueryForObjectCommandText(command, callback);
                var session = helper.OpenSession();

                command.Connection = session;

                var data = session.QueryFirstOrDefault<T>(commandText, so);

                if (subQuery != null && data != null)
                {
                    subQuery(command, data);
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
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(action, selectors);

                return helper.OpenSession().Query<T>(commandText, so);
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
        public IEnumerable<T> QueryForList<T>(
            StatementNamespace ns, string name, object so = null,
            Action<SelectCriteria<T>> callback = null, Action<CommandText, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var command = ns.GetXCommand(name);

                Debug.Assert(command != null, "未找到指定的命令配置信息！");

                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(command, callback);
                var session = helper.OpenSession();

                command.Connection = session;

                var datas = helper.OpenSession().Query<T>(commandText, so);

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
        public IEnumerable<T> QueryForPagedList<S, T>(out int totalRecords, S so = null, Action<SelectCriteria<S>> action = null, params string[] selectors) where S : SearchObject, new()
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandTexts = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(action, selectors);
                var connection = helper.OpenSession();

                so = so ?? new S();
                var param = new DynamicParameters();

                totalRecords = connection.ExecuteScalar<int>(commandTexts.TotalCommandText, so);

                return connection.Query<T>(commandTexts.QueryCommandText, so);
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
        public IEnumerable<T> QueryForPagedList<S, T>(
            StatementNamespace ns,
            string name,
            out int totalRecords,
            S so = null,
            Action<SelectCriteria<S>> callback = null,
            Action<CommandText, T> subQuery = null) where S : SearchObject, new()
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var command = ns.GetXCommand(name);

                // 分页处理
                var (QueryCommandText, TotalCommandText) = this.CommandTextBuilder.GetQueryForPagedListCommandText<S, T>(command, callback);

                var session = helper.OpenSession();
                var pagedList = session.Query<T>(QueryCommandText, so ?? new SearchObject());

                totalRecords = session.ExecuteScalar<int>(TotalCommandText);

                command.Connection = session;

                if (subQuery != null && !pagedList.IsEmpty())
                {
                    foreach (var item in pagedList)
                    {
                        subQuery(command, item);
                    }
                }

                return pagedList;
            }
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// 获取数据库操作对象
        /// </summary>
        /// <param name="element">配置元素</param>
        /// <returns>数据库操作对象</returns>
        private DbHelper GetDbHelper(ConnectionStringConfig element)
        {
            var providerName = element.ProviderName;
            var connectionString = element.ConnectionString;

            return element == this.Master
                ? (_masterDbHelper = _masterDbHelper ?? new DbHelper(providerName, connectionString))
                : (_slaveDbHelper = _slaveDbHelper ?? new DbHelper(providerName, connectionString));
        }

        #endregion
    }
}
