using System;
using System.Collections.Generic;
using System.Diagnostics;
using Dapper;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Prime.Core.Dapper
{
    /// <summary>
    /// 基于dapper的数据持久化类。
    /// </summary>
    public class Persistence
    {
        #region 属性

        /// <summary>
        /// 驱动名称.
        /// </summary>
        public string ProviderName { get; set; }

        /// <summary>
        /// 数据库连接字符串.
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// 数据库连接字符串名称
        /// </summary>
        public string ConnectionStringName { get; set; } = "Default";

        #endregion 

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
            object executeObject = null, Action<XCommand> callback = null)
        {
            if (name == null)
            {
                throw new ArgumentNullException(nameof(name));
            }

            using (var helper = this.GetDbHelper())
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

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
            Action<XCommand> callback, bool transaction = false)
        {
            if (name == null)
            {
                throw new ArgumentNullException(nameof(name));
            }

            var result = false;

            using (var helper = this.GetDbHelper())
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
            Action<XCommand> callback = null, Action<XCommand, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper())
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                var session = helper.OpenSession();

                xcommand.Connection = session;
                callback?.Invoke(xcommand);

                var data = session.QueryFirstOrDefault<T>(xcommand.EffectiveCommandText, so);

                if (subQuery != null && data != null)
                {
                    subQuery(xcommand, data);
                }

                return data;
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
            Action<XCommand> callback = null, Action<XCommand, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper())
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                var session = helper.OpenSession();

                xcommand.Connection = session;
                callback?.Invoke(xcommand);

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
            Action<XCommand> callback = null, Action<XCommand, T> subQuery = null)
        {
            using (var helper = this.GetDbHelper())
            {
                var xcommand = ns.GetXCommand(name);

                Debug.Assert(xcommand != null, "未找到指定的命令配置信息！");

                callback?.Invoke(xcommand);

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

        #region 私有方法

        /// <summary>
        /// 获取数据库操作对象
        /// </summary>
        /// <returns>数据库操作对象</returns>
        private DbHelper GetDbHelper()
        {
            if (this.ProviderName.IsNotBlank() && this.ConnectionString.IsNotBlank())
            {
                return new DbHelper(this.ProviderName, this.ConnectionString);
            }

            return new DbHelper(this.ConnectionStringName);
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
