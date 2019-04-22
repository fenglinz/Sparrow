using System;
using System.Collections.Generic;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Data.Dapper;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 服务抽象类。
    /// </summary>
    public abstract class ServiceSupport
    {
        #region Properties

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region Protected Methods

        protected Response Create<TRequest, TEntity>(params TRequest[] items)
        {
            var rs = new Response();
            var entities = items.As<TRequest, TEntity>();

            this.Persistence.Create(entities);

            return rs;
        }

        protected Response Update<TRequest, TEntity>(object data, Action<Criteria<TEntity>> action = null)
        {
            var rs = new Response();

            this.Persistence.Update(data, action);

            return rs;
        }

        protected Response Remove<TRequest, TEntity>(object param, Action<Criteria<TEntity>> action = null)
        {
            var rs = new Response();

            this.Persistence.Remove(param, action);

            return rs;
        }

        public Response<TResponse> QueryForObject<TResponse, TEntity>(IEnumerable<string> selectors, object so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            var rs = new Response<TResponse>();
            var entity = this.Persistence.QueryForObject<TEntity>(selectors, so, action);

            rs.Data = entity.As<TEntity, TResponse>();

            return rs;
        }

        public Response<TResponse> QueryForObject<TResponse, TEntity>(object so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            var rs = new Response<TResponse>();
            var entity = this.Persistence.QueryForObject<TEntity>(so, action);

            rs.Data = entity.As<TEntity, TResponse>();

            return rs;
        }

        public ResponseSet<TResponse> QueryForList<TResponse, TEntity>(IEnumerable<string> selectors, object so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            var rs = new ResponseSet<TResponse>();
            var entities = this.Persistence.QueryForList(selectors, so, action);

            rs.Datas = entities.As<TEntity, TResponse>();

            return rs;
        }

        public ResponseSet<TResponse> QueryForList<TResponse, TEntity>(object so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            return this.QueryForList<TResponse, TEntity>(null, so, action);
        }

        public ResponseSet<TResponse> QueryForPagedList<TResponse, TEntity>(IEnumerable<string> selectors, SearchObject so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            var totalRecords = 0;
            var rs = new ResponseSet<TResponse>();
            var entities = this.Persistence.QueryForPagedList(out totalRecords, selectors, so, action);

            rs.TotalRecords = totalRecords;
            rs.Datas = entities.As<TEntity, TResponse>();

            return rs;
        }

        public ResponseSet<TResponse> QueryForPagedList<TResponse, TEntity>(SearchObject so = null, Action<SelectCriteria<TEntity>> action = null)
        {
            return this.QueryForPagedList<TResponse, TEntity>(null, so, action);
        }

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

            this.Persistence.Execute(ns, name, callback, transaction);

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
        /// <typeparam name="TEntity">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        protected Response<TResponse> QueryForObject<TResponse, TEntity>(StatementNamespace ns, string name,
            object so = null, Action<SelectCriteria> callback = null, Action<CommandText, TEntity> subQuery = null)
        {
            var rs = new Response<TResponse>();
            var entity = this.Persistence.QueryForObject(ns, name, so, callback, subQuery);

            rs.Data = entity.As<TEntity, TResponse>();

            return rs;
        }

        /// <summary>
        /// 返回所有符合条件的结果
        /// </summary>
        /// <typeparam name="TEntity">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询对象</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>查询结果</returns>
        protected ResponseSet<TResponse> QueryForList<TResponse, TEntity>(StatementNamespace ns, string name,
            object so = null, Action<SelectCriteria> callback = null, Action<CommandText, TEntity> subQuery = null)
        {
            var rs = new ResponseSet<TResponse>();
            var entities = this.Persistence.QueryForList(ns, name, so, callback, subQuery);

            rs.Datas = entities.As<TEntity, TResponse>();

            return rs;
        }

        /// <summary>
        /// 返回分页查询的数据。
        /// </summary>
        /// <typeparam name="TEntity">数据类型</typeparam>
        /// <param name="ns">sql命令所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="so">查询数据</param>
        /// <param name="callback">命令设置回调</param>
        /// <param name="subQuery">子查询回调</param>
        /// <returns>返回结果</returns>
        protected ResponseSet<TResponse> QueryForPagedList<TResponse, TEntity>(StatementNamespace ns, string name,
            SearchObject so = null, Action<SelectCriteria> callback = null, Action<CommandText, TEntity> subQuery = null)
        {
            so = so ?? new SearchObject();

            var total = 0;
            var rs = new ResponseSet<TResponse>();
            var entities = this.Persistence.QueryForPagedList(ns, name, out total, so, callback, subQuery);

            rs.TotalRecords = total;
            rs.Datas = entities.As<TEntity, TResponse>();

            return rs;
        }

        #endregion
    }
}
