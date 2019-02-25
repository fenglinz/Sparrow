using System;
using System.Collections.Generic;
using System.Diagnostics;
using Dapper;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Data.Ado;
using Mercurius.Prime.Data.Parser;
using Mercurius.Prime.Data.Parser.Builder;
using Mercurius.Prime.Data.Service;

namespace Mercurius.Prime.Data.Dapper
{
    /// <summary>
    /// 基于dapper的数据持久化类。
    /// </summary>
    public class Persistence
    {
        #region 字段

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
        private ConnectionStringElement _master;

        #endregion

        #region 属性

        /// <summary>
        /// 主库连接配置.
        /// </summary>
        public ConnectionStringElement Master
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

                    default:
                        this.CommandTextBuilder = null;

                        break;
                }
            }
        }

        /// <summary>
        /// 从库连接配置.
        /// </summary>
        public ConnectionStringElement Slave { get; set; }

        /// <summary>
        /// 命令生成器对象
        /// </summary>
        public CommandTextBuilder CommandTextBuilder { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public Persistence()
        {
            this.Master = PlatformSection.Instance.ConnectionStrings.MasterConnectionString;
            this.Slave = PlatformSection.Instance.ConnectionStrings.SlaveConnectionString;
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
        public int Execute(
            StatementNamespace ns, string name,
            object executeObject = null, Action<CommandText> callback = null)
        {
            if (name == null)
            {
                throw new ArgumentNullException(nameof(name));
            }

            using (var helper = this.GetDbHelper(this.Master))
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                xcommand.Criteria = new Criteria<object>(this.CommandTextBuilder);

                callback?.Invoke(xcommand);

                return helper.OpenSession().Execute(xcommand.EffectiveCommandText, executeObject);
            }
        }

        /// <summary>
        /// 执行命令
        /// </summary>
        /// <param name="ns">命令的命名空间</param>
        /// <param name="name">命名名称</param>
        /// <param name="callback">查询设置回调</param>
        /// <param name="transaction">是否启用事务(默认不启用)</param>
        /// <returns>执行结果</returns>
        public bool Execute(
            StatementNamespace ns, string name,
            Action<CommandText> callback, bool transaction = false)
        {
            if (name == null)
            {
                throw new ArgumentNullException(nameof(name));
            }

            var result = false;

            using (var helper = this.GetDbHelper(this.Master))
            {
                var xcommand = ns.GetXCommand(name);

                try
                {
                    if (transaction)
                    {
                        helper.BeginTransaction();
                    }

                    var session = helper.OpenSession();

                    xcommand.Connection = session;

                    callback.Invoke(xcommand);

                    if (transaction)
                    {
                        helper.Commit();
                    }

                    result = true;
                }
                catch (Exception exp)
                {
                    if (transaction)
                    {
                        helper.Rollback();
                    }

                    throw exp;
                }
            }

            return result;
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

        public T QueryForObject<T>(IEnumerable<string> selectors, object so = null, Action<SelectCriteria> action = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForObjectCommandText<T>(selectors, action);

                return helper.OpenSession().QuerySingleOrDefault<T>(commandText, so);
            }
        }

        public T QueryForObject<T>(object so = null, Action<SelectCriteria> action = null)
        {
            return this.QueryForObject<T>(null, so, action);
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
            Action<SelectCriteria> callback = null, Action<CommandText, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                var session = helper.OpenSession();

                xcommand.Connection = session;
                xcommand.Criteria = new SelectCriteria<T>(this.CommandTextBuilder);

                callback?.Invoke(xcommand.Criteria as SelectCriteria);

                var data = session.QueryFirstOrDefault<T>(xcommand.EffectiveCommandText, so);

                if (subQuery != null && data != null)
                {
                    subQuery(xcommand, data);
                }

                return data;
            }
        }

        #endregion

        #region QueryForList


        public IEnumerable<T> QueryForList<T>(IEnumerable<string> selectors, object so = null, Action<SelectCriteria<T>> action = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandText = this.CommandTextBuilder.GetQueryForListCommandText(selectors, action);

                return helper.OpenSession().Query<T>(commandText, so);
            }
        }

        public IEnumerable<T> QueryForList<T>(object so = null, Action<SelectCriteria<T>> action = null)
        {
            return this.QueryForList(null, so, action);
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
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                var session = helper.OpenSession();

                xcommand.Connection = session;
                xcommand.Criteria = new SelectCriteria<T>(this.CommandTextBuilder);

                callback?.Invoke(xcommand.Criteria as SelectCriteria<T>);

                var datas = helper.OpenSession().Query<T>(xcommand.EffectiveCommandText, so);

                if (subQuery != null && !datas.IsEmpty())
                {
                    foreach (var item in datas)
                    {
                        subQuery(xcommand, item);
                    }
                }

                return datas;
            }
        }

        #endregion

        #region QueryForPagedList

        public IEnumerable<T> QueryForPagedList<T>(out int totalRecords, IEnumerable<string> selectors, SearchObject so = null, Action<SelectCriteria> action = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var commandTexts = this.CommandTextBuilder.GetQueryForPagedListCommandText<T>(selectors, action);
                var connection = helper.OpenSession();

                totalRecords = connection.ExecuteScalar<int>(commandTexts.Item2, so);

                return connection.Query<T>(commandTexts.Item1, so);
            }
        }

        public IEnumerable<T> QueryForPagedList<T>(out int totalRecords, SearchObject so = null, Action<SelectCriteria> action = null)
        {
            return this.QueryForPagedList<T>(out totalRecords, so, action);
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
        public IEnumerable<T> QueryForPagedList<T>(
        StatementNamespace ns, string name,
        out int totalRecords, SearchObject so = null,
        Action<SelectCriteria<T>> callback = null, Action<CommandText, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper(this.Slave))
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                xcommand.Criteria = new SelectCriteria<T>(this.CommandTextBuilder);

                callback?.Invoke(xcommand.Criteria as SelectCriteria<T>);

                // 分页处理
                var pagedCommandText = this.PreparePagedCommand(xcommand.EffectiveCommandText);

                var session = helper.OpenSession();
                var pagedList = session.Query<T>(pagedCommandText, so ?? new SearchObject());

                totalRecords = session.ExecuteScalar<int>("SELECT FOUND_ROWS()");

                xcommand.Connection = session;

                if (subQuery != null && !pagedList.IsEmpty())
                {
                    foreach (var item in pagedList)
                    {
                        subQuery(xcommand, item);
                    }
                }

                return pagedList;
            }
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取数据库操作对象
        /// </summary>
        /// <param name="element">配置元素</param>
        /// <returns>数据库操作对象</returns>
        private DbHelper GetDbHelper(ConnectionStringElement element)
        {
            var providerName = element.ProviderName;
            var connectionString = element.ConnectionString;

            return element == this.Master
                ? (_masterDbHelper = _masterDbHelper ?? new DbHelper(providerName, connectionString))
                : (_slaveDbHelper = _slaveDbHelper ?? new DbHelper(providerName, connectionString));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="command"></param>
        private string PreparePagedCommand(string command)
        {
            if (command?.IsNullOrEmpty() != false)
            {
                return string.Empty;
            }

            if (command.StartsWith("select", StringComparison.InvariantCultureIgnoreCase) && !command.ToUpper().Contains("SQL_CALC_FOUND_ROWS"))
            {
                command = "SELECT SQL_CALC_FOUND_ROWS " + command.Substring(6);
            }

            command += " LIMIT @OffsetRows, @PageSize";

            return command;
        }

        #endregion
    }
}
