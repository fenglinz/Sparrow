using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Autofac.Extras.DynamicProxy;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Core.Log;
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
        /// 日志组件。
        /// </summary>
        public AbstractLogger Logger { get; set; }

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public Persistence Persistence { get; set; }

        /// <summary>
        /// 数据库连接配置节(默认为主信息)
        /// </summary>
        public virtual string ConnectionStringName => string.Empty;

        #endregion

        #region Protected Methods

        #region Caches

        protected void SetCache<T>(string key, T value, TimeSpan? expiry = null)
        {
            this.Redis?.Set(key, value, expiry);
        }

        protected void SetCache<T>(string buket, string key, T value)
        {
            this.Redis?.Set(buket, key, value);
        }

        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="expiry">过期时间</param>
        public async Task<Response<T>> FromCache<T>(string key, Func<Task<Response<T>>> cachingDataFunc, TimeSpan? expiry = null)
        {
            if (this.Redis == null)
            {
                return await cachingDataFunc();
            }

            var value = this.Redis.Get<T>(key);

            if (value == default)
            {
                var res = await cachingDataFunc();

                value = res.Data;

                if (value != default)
                {
                    this.Redis.Set(key, value, expiry);
                }
            }

            return new Response<T> { Data = value };
        }

        /// <summary>
        /// 设置缓存
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="bucket">hash表名称</param>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        public async Task<Response<T>> FromCache<T>(string bucket, string key, Func<Task<Response<T>>> cachingDataFunc)
        {
            if (this.Redis == null)
            {
                return await cachingDataFunc();
            }

            var value = this.Redis.Get<T>(bucket, key);

            if (value == default)
            {
                var res = await cachingDataFunc();

                value = res.Data;

                if (value != default)
                {
                    this.Redis.Set(bucket, key, value);
                }
            }

            return new Response<T>
            {
                Data = value
            };
        }

        /// <summary>
        /// 更新已存在的缓存
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="action">更新回调</param>
        public void UpdateCache<T>(string key, Action<T> action)
        {
            if (this.Redis == null)
            {
                return;
            }

            var value = this.Redis.Get<T>(key);

            if (value != default && action != null)
            {
                action(value);

                this.Redis.Set(key, value);
            }
        }

        /// <summary>
        /// 更新已存在的缓存
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="bucket">hash表名称</param>
        /// <param name="key">键</param>
        /// <param name="action">更新回调</param>
        public void UpdateCache<T>(string bucket, string key, Action<T> action)
        {
            if (this.Redis == null)
            {
                return;
            }

            var value = this.Redis.Get<T>(bucket, key);

            if (value != default && action != null)
            {
                action(value);

                this.Redis.Set(bucket, key, value);
            }
        }

        /// <summary>
        /// 删除缓存
        /// </summary>
        /// <param name="key">键</param>
        public void DeleteCache(string key)
        {
            this.Redis?.Delete(key);
        }

        /// <summary>
        /// 删除缓存
        /// </summary>
        /// <param name="bucket">hash表名称</param>
        /// <param name="key">键</param>
        public void DeleteCache(string bucket, string key)
        {
            this.Redis.Delete(bucket, key);
        }

        #endregion

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

            try
            {
                var entity = item.As<TRequest, TEntity>();

                handler?.Invoke(entity);

                await this.Persistence.CreateAsync(entity);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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

            try
            {
                var entities = items.As<TRequest, TEntity>();

                if (handler != null)
                {
                    foreach (var item in entities)
                    {
                        handler(item);
                    }
                }

                await this.Persistence.CreateAsync(entities.ToArray());
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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

            try
            {
                await this.Persistence.UpdateAsync(data, action);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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

            try
            {
                await this.Persistence.RemoveAsync(param, action);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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

            try
            {
                var entity = await this.Persistence.QueryForObjectAsync(so, action, selectors);

                rs.Data = entity.As<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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

            try
            {
                var entities = await this.Persistence.QueryForListAsync(so, action, selectors);

                rs.Datas = entities.As<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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
            try
            {
                var pgRs = await this.Persistence.QueryForPagedListAsync<TSO, TEntity>(so, action, selectors);

                return pgRs.AsResponseSet<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                return new ResponseSet<TResponse>
                {
                    ErrorMessage = ex.Message + "\r\n" + ex.StackTrace
                };
            }
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
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
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
            object so = null, Action<SelectCriteria> callback = null, Func<CommandText, TEntity, Task> subQuery = null)
        {
            var rs = new Response<TResponse>();

            try
            {
                var entity = await this.Persistence.QueryForObjectAsync(ns, name, so, callback, subQuery);

                rs.Data = entity.As<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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
        protected async Task<ResponseSet<TDomain>> QueryForList<TDomain>(StatementNamespace ns, string name,
            object so = null, Action<SelectCriteria<object>> callback = null, Func<CommandText, TDomain, Task> subQuery = null)
        {
            var rs = new ResponseSet<TDomain>();

            try
            {
                rs.Datas = await this.Persistence.QueryForListAsync(ns, name, so, callback, subQuery);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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
        protected async Task<ResponseSet<TResponse>> QueryForList<TSO, TEntity, TResponse>(StatementNamespace ns, string name,
            TSO so = null, Action<SelectCriteria<TSO>> callback = null, Func<CommandText, TEntity, Task> subQuery = null) where TSO : class, new()
        {
            var rs = new ResponseSet<TResponse>();

            try
            {
                var entities = await this.Persistence.QueryForListAsync(ns, name, so, callback, subQuery);

                rs.Datas = entities.As<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

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
            TSO so = null, Action<SelectCriteria<TSO>> callback = null, Func<CommandText, TEntity, Task> subQuery = null) where TSO : SearchObject, new()
        {
            try
            {
                var rs = await this.Persistence.QueryForPagedListAsync(ns, name, so, callback, subQuery);

                return rs.AsResponseSet<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                return new ResponseSet<TResponse>
                {
                    ErrorMessage = ex.Message + "\r\n" + ex.StackTrace
                };
            }
        }

        /// <summary>
        /// 执行存储过程(异步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>受影响的记录数</returns>
        public async Task<Response> StoredProcedureAsync(string procedure,
            object paramObject, Action<DapperParameters> sets = null, Action<DapperParameters> gets = null)
        {
            var rs = new Response();

            try
            {
                await this.Persistence.StoredProcedureAsync(procedure, paramObject, sets, gets);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

            return rs;
        }

        /// <summary>
        /// 执行存储过程(异步)
        /// </summary>
        /// <param name="procedure">存储过程名称</param>
        /// <param name="paramObject">存储过程参数</param>
        /// <returns>返回的结果集</returns>
        public async Task<ResponseSet<TResponse>> StoredProcedureAsync<TResponse, TEntity>(string procedure, object paramObject)
        {
            var rs = new ResponseSet<TResponse>();

            try
            {
                var entities = await this.Persistence.StoredProcedureAsync<TEntity>(procedure, paramObject);

                rs.Datas = entities.As<TEntity, TResponse>();
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

            return rs;
        }

        public async Task<Response> ExecuteBatch(IEnumerable<ExecuteObject> executeObjects, bool useTransaction = false)
        {
            var rs = new Response();

            try
            {
                await this.Persistence.ExecuteBatchAsync(executeObjects, useTransaction);
            }
            catch (Exception ex)
            {
                rs.ErrorMessage = ex.Message + "\r\n" + ex.StackTrace;
            }

            return rs;
        }

        #endregion
    }
}
