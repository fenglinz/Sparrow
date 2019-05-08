using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Cache;
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
        /// redis客户端
        /// </summary>
        public RedisClient Redis { get; set; }

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region Protected Methods

        /// <summary>
        /// 添加数据
        /// </summary>
        /// <typeparam name="TRequest">数据请求类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="item">数据请求对象</param>
        /// <param name="handler">添加前的数据处理</param>
        /// <returns>添加结果</returns>
        protected async Task<Response> Create<TRequest, TEntity>(TRequest item, Action<TEntity> handler = null)
        {
            var rs = new Response();
            var entity = item.As<TRequest, TEntity>();

            handler?.Invoke(entity);

            await this.Persistence.CreateAsync(entity);

            return rs;
        }

        /// <summary>
        /// 批量添加数据
        /// </summary>
        /// <typeparam name="TRequest">数据请求类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="items">数据请求对象集合</param>
        /// <param name="handler">添加前的数据处理</param>
        /// <returns>添加结果</returns>
        protected async Task<Response> Create<TRequest, TEntity>(IEnumerable<TRequest> items, Action<TEntity> handler = null)
        {
            var rs = new Response();
            var entities = items.As<TRequest, TEntity>();

            if (handler != null)
            {
                foreach (var item in entities)
                {
                    handler(item);
                }
            }

            await this.Persistence.CreateAsync(entities);

            return rs;
        }

        /// <summary>
        /// 更新数据
        /// </summary>
        /// <typeparam name="TRequest">数据请求类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="data">数据对象</param>
        /// <param name="action">更新条件设置回调</param>
        /// <returns>更新结果</returns>
        protected async Task<Response> Update<TRequest, TEntity>(object data, Action<Criteria<TEntity>> action = null)
        {
            var rs = new Response();

            await this.Persistence.UpdateAsync(data, action);

            return rs;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <typeparam name="TRequest">数据请求类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="param">数据对象</param>
        /// <param name="action">删除条件设置回调</param>
        /// <returns>删除结果</returns>
        protected async Task<Response> Remove<TRequest, TEntity>(object param, Action<Criteria<TEntity>> action = null)
        {
            var rs = new Response();

            await this.Persistence.RemoveAsync(param, action);

            return rs;
        }

        /// <summary>
        /// 返回单条数据
        /// </summary>
        /// <typeparam name="TResponse">数据返回类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="so">查询数据</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">数据返回列集合</param>
        /// <returns>返回结果</returns>
        protected async Task<Response<TResponse>> QueryForObject<TResponse, TEntity>(object so = null, Action<SelectCriteria<TEntity>> action = null, params string[] selectors)
        {
            var rs = new Response<TResponse>();
            var entity = await this.Persistence.QueryForObjectAsync(so, action, selectors);

            rs.Data = entity.As<TEntity, TResponse>();

            return rs;
        }

        /// <summary>
        /// 返回所有符合条件的数据
        /// </summary>
        /// <typeparam name="TResponse">数据返回类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="so">查询数据</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">数据返回列集合</param>
        /// <returns>返回结果</returns>
        protected async Task<ResponseSet<TResponse>> QueryForList<TResponse, TEntity>(object so = null, Action<SelectCriteria<TEntity>> action = null, params string[] selectors)
        {
            var rs = new ResponseSet<TResponse>();
            var entities = await this.Persistence.QueryForListAsync(so, action, selectors);

            rs.Datas = entities.As<TEntity, TResponse>();

            return rs;
        }

        /// <summary>
        /// 分页返回数据
        /// </summary>
        /// <typeparam name="TSO">分页查询类型</typeparam>
        /// <typeparam name="TResponse">数据返回类型</typeparam>
        /// <typeparam name="TEntity">实体类型</typeparam>
        /// <param name="so">查询数据</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">数据返回列集合</param>
        /// <returns>返回结果</returns>
        protected async Task<ResponseSet<TResponse>> QueryForPagedList<TSO, TEntity, TResponse>(TSO so = null, Action<SelectCriteria<TSO>> action = null, params string[] selectors) where TSO : SearchObject, new()
        {
            var pgRs = await this.Persistence.QueryForPagedListAsync<TSO, TEntity>(so, action, selectors);

            return pgRs.AsResponseSet<TEntity, TResponse>();
        }

        /// <summary>
        /// 执行数据库命令
        /// </summary>
        /// <param name="ns">sql所在的命名空间</param>
        /// <param name="name">sql命令名称</param>
        /// <param name="executeObject">数据对象</param>
        /// <param name="callback">命令执行回调</param>
        /// <returns>操作结果</returns>
        protected async Task<Response> Execute(StatementNamespace ns, string name, object executeObject)
        {
            var rs = new Response();

            try
            {
                await this.Persistence.ExecuteAsync(ns, name, executeObject);
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
        protected async Task<Response<TResponse>> QueryForObject<TResponse, TEntity>(StatementNamespace ns, string name,
            object so = null, Action<SelectCriteria> callback = null, Action<CommandText, TEntity> subQuery = null)
        {
            var rs = new Response<TResponse>();
            var entity = await this.Persistence.QueryForObjectAsync(ns, name, so, callback, subQuery);

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
        protected async Task<ResponseSet<TResponse>> QueryForList<TResponse, TEntity>(StatementNamespace ns, string name,
            object so = null, Action<SelectCriteria> callback = null, Action<CommandText, TEntity> subQuery = null)
        {
            var rs = new ResponseSet<TResponse>();
            var entities = await this.Persistence.QueryForListAsync(ns, name, so, callback, subQuery);

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
        protected async Task<ResponseSet<TResponse>> QueryForPagedList<TSO, TEntity, TResponse>(StatementNamespace ns, string name,
            TSO so = null, Action<SelectCriteria<TSO>> callback = null, Action<CommandText, TEntity> subQuery = null) where TSO : SearchObject, new()
        {
            var rs = await this.Persistence.QueryForPagedListAsync(ns, name, so, callback, subQuery);

            return rs.AsResponseSet<TEntity, TResponse>();
        }

        #endregion
    }
}
