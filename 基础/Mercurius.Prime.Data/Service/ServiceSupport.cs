using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Data.Ado;
using Mercurius.Prime.Data.Dapper;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 服务抽象类。
    /// </summary>
    public abstract class ServiceSupport
    {
        #region 属性

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region 受保护的方法

        /// <summary>
        /// 执行数据库操作
        /// </summary>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="transaction">是否启用事务(默认不启用)</param>
        /// <returns>返回结果</returns>
        protected Response Execute(
            StatementNamespace ns, string name,
            Action<CommandText> callback, bool transaction = false)
        {
            var rs = new Response();

            try
            {
                this.Persistence.Execute(ns, name, callback, transaction);
            }
            catch (Exception e)
            {
                rs.ErrorMessage = e.Message;
            }

            return rs;
        }

        /// <summary>
        /// 执行数据库命令
        /// </summary>
        /// <param name="ns">sql所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="executeObject">数据对象</param>
        /// <param name="callback">命令执行回调</param>
        /// <returns>操作结果</returns>
        protected Response Execute(
            StatementNamespace ns, string name,
            object executeObject = null, Action<CommandText> callback = null)
        {
            var rs = new Response();

            try
            {
                this.Persistence.Execute(ns, name, executeObject, callback);
            }
            catch (Exception e)
            {
                rs.ErrorMessage = e.Message;
            }

            return rs;
        }

        /// <summary>
        /// 返回一条数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        protected Response<T> QueryForObject<T>(
            StatementNamespace ns, string name, object so = null,
            Action<SelectCriteria> callback = null, Action<CommandText, T> subQuery = null)
        {
            var rs = new Response<T>();

            try
            {
                rs.Data = this.Persistence.QueryForObject(ns, name, so, callback, subQuery);
            }
            catch (Exception e)
            {
                rs.ErrorMessage = e.Message;
            }

            return rs;
        }

        /// <summary>
        /// 返回所有符合条件的结果
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        protected ResponseSet<T> QueryForList<T>(
            StatementNamespace ns, string name, object so = null,
            Action<SelectCriteria> callback = null, Action<CommandText, T> subQuery = null)
        {
            var rs = new ResponseSet<T>();

            try
            {
                rs.Datas = this.Persistence.QueryForList(ns, name, so, callback, subQuery);
            }
            catch (Exception e)
            {
                rs.ErrorMessage = e.Message;
            }

            return rs;
        }

        /// <summary>
        /// 返回分页查询的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>返回结果</returns>
        protected ResponseSet<T> QueryForPagedList<T>(
            StatementNamespace ns, string name, SearchObject so = null,
            Action<SelectCriteria> callback = null, Action<CommandText, T> subQuery = null)
        {
            so = so ?? new SearchObject();

            var total = 0;
            var rs = new ResponseSet<T>();

            try
            {
                rs.Datas = this.Persistence.QueryForPagedList<T>(ns, name, out total, so, callback, subQuery);
                rs.TotalRecords = total;
            }
            catch (Exception e)
            {
                rs.ErrorMessage = e.Message;
            }

            return rs;
        }

        #endregion
    }
}
