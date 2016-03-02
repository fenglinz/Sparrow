using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using Mercurius.Infrastructure.Cache;
using Mercurius.Infrastructure.Log;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Repositories;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Services.Support
{
    /// <summary>
    /// 分页服务回调委托。
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    /// <param name="totalRecords">总记录数</param>
    /// <returns>数据集合</returns>
    public delegate IList<T> PagingServiceCallback<T>(out int totalRecords);

    /// <summary>
    /// 服务处理支持类。
    /// </summary>
    public abstract class ServiceSupport
    {
        #region 字段

        /// <summary>
        /// 线程锁。
        /// </summary>
        private static object _locker = new object();

        /// <summary>
        /// 模块字典。
        /// </summary>
        private static readonly Dictionary<Type, string> _dictModuleNames;

        /// <summary>
        /// 缓存键前缀。
        /// </summary>
        private static readonly Dictionary<Type, string> _dictCacheKeyPrefix;

        /// <summary>
        /// 缓存键格式化字符串。
        /// </summary>
        private string _cacheKeyFormat;

        private ILogger _logger;
        private string _className;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置日志组件。
        /// </summary>
        public ILogger Logger
        {
            get
            {
                return this._logger;
            }

            set
            {
                this._logger = value;
                this._className = this.GetType().FullName;
            }
        }

        /// <summary>
        /// 获取或者设置缓存提供者。
        /// </summary>
        public ICacheProvider Cache { get; set; }

        /// <summary>
        /// 获取或者设置IBatis.Net持久化器。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static ServiceSupport()
        {
            _dictModuleNames = new Dictionary<Type, string>();
            _dictCacheKeyPrefix = new Dictionary<Type, string>();
        }

        #endregion

        #region 服务支持

        /// <summary>
        /// 执行服务。
        /// </summary>
        /// <param name="method">方法名</param>
        /// <param name="callback">回调方法</param>
        /// <param name="args">方法参数</param>
        /// <returns>操作结果</returns>
        protected Response InvokeService(string method, Action callback, params object[] args)
        {
            var model = this.GetModelName();

            this.Logger.BeforeExecution(model, this._className, method, args);

            var result = new Response();
            var stopwatch = new Stopwatch();

            stopwatch.Start();

            try
            {
                callback();
            }
            catch (Exception exception)
            {
                result.IsSuccess = false;
                result.ErrorMessage = exception.Message;

                this.Logger.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger.AfterExecution(model, this._className, method, stopwatch.Elapsed, result, args);

            return result;
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="callback">回调方法</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <param name="args">参数列表</param>
        /// <returns>服务返回结果</returns>
        protected Response<T> InvokeService<T>(
            string method,
            Func<T> callback,
            bool cacheable = true,
            params object[] args)
        {
            var model = this.GetModelName();

            this.Logger.BeforeExecution(model, this._className, method, args);

            var result = new Response<T>();
            var stopwatch = new Stopwatch();

            stopwatch.Start();

            try
            {
                if (cacheable)
                {
                    var cacheKey = this.GetCacheKey<T>(method, args);
                    var cacheValue = this.GetCache<T>(cacheKey);

                    if (cacheValue == null)
                    {
                        cacheValue = callback();

                        if (cacheValue != null)
                        {
                            this.AddCache(cacheKey, cacheValue);
                        }
                    }

                    result.Data = cacheValue;
                }
                else
                {
                    result.Data = callback();
                }
            }
            catch (Exception exception)
            {
                result.IsSuccess = false;
                result.ErrorMessage = exception.Message;

                this.Logger.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger.AfterExecution(model, this._className, method, stopwatch.Elapsed, result, args);

            return result;
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="handler">回调方法</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <param name="args">参数列表</param>
        /// <returns>服务返回结果</returns>
        protected ResponseCollection<T> InvokeService<T>(
            string method,
            Func<IList<T>> handler,
            bool cacheable = true,
            params object[] args)
        {
            var model = this.GetModelName();

            this.Logger.BeforeExecution(model, this._className, method, args);

            var stopwatch = new Stopwatch();
            var result = new ResponseCollection<T>();

            stopwatch.Start();

            try
            {
                if (cacheable)
                {
                    var cacheKey = this.GetCacheKey<T>(method, args);
                    var cacheValue = this.GetCache<IList<T>>(cacheKey);

                    if (cacheValue.IsEmpty())
                    {
                        cacheValue = handler();

                        if (!cacheValue.IsEmpty())
                        {
                            this.AddCache(cacheKey, cacheValue);
                        }
                    }

                    result.Datas = cacheValue;
                }
                else
                {
                    result.Datas = handler();
                }
            }
            catch (Exception exception)
            {
                result.IsSuccess = false;
                result.ErrorMessage = exception.Message;

                this.Logger.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger.AfterExecution(model, this._className, method, stopwatch.Elapsed, result, args);

            return result;
        }

        /// <summary>
        /// 执行分页服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="handler">回调方法</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <param name="args">参数列表</param>
        /// <returns>服务返回结果</returns>
        protected ResponseCollection<T> InvokePagingService<T>(
            string method,
            PagingServiceCallback<T> handler,
            bool cacheable = true,
            params object[] args)
        {
            var model = this.GetModelName();

            this.Logger.BeforeExecution(model, this._className, method, args);

            var stopwatch = new Stopwatch();
            var result = new ResponseCollection<T>();

            stopwatch.Start();

            try
            {
                if (cacheable)
                {
                    var cacheKey = this.GetCacheKey<T>(method, args);
                    var cacheValue = this.GetCache<ResponseCollection<T>>(cacheKey);

                    if (cacheValue == null || cacheValue.Datas.IsEmpty())
                    {
                        int totalRecords;

                        cacheValue = result;
                        cacheValue.Datas = handler(out totalRecords);
                        cacheValue.TotalRecords = totalRecords;

                        if (totalRecords > 0)
                        {
                            this.AddCache(cacheKey, cacheValue);
                        }
                    }

                    result = cacheValue;
                }
                else
                {
                    int totalRecords;
                    result.Datas = handler(out totalRecords);
                    result.TotalRecords = totalRecords;
                }
            }
            catch (Exception exception)
            {
                result.IsSuccess = false;
                result.ErrorMessage = exception.Message;

                this.Logger.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger.AfterExecution(model, this._className, method, stopwatch.Elapsed, result, args);

            return result;
        }

        #endregion

        #region 缓存处理

        /// <summary>
        /// 获取缓存键。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">查询参数</param>
        /// <returns>缓存键</returns>
        protected string GetCacheKey<T>(string key, object value = null)
        {
            if (string.IsNullOrWhiteSpace(this._cacheKeyFormat))
            {
                this._cacheKeyFormat = $"{GetCacheKeyPrefix<T>()}_{(value == null ? "{0}{1}" : "{0}_{1}")}";
            }

            return string.Format(
                this._cacheKeyFormat,
                key,
                value == null ? string.Empty : JsonConvert.SerializeObject(value).Replace("{", string.Empty).Replace("}", string.Empty).Replace("[", string.Empty).Replace("]", string.Empty).Replace(@"\", string.Empty).Replace("\"", string.Empty));
        }

        /// <summary>
        /// 获取缓存中数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">缓存主键</param>
        /// <returns>缓存数据</returns>
        protected T GetCache<T>(string key)
        {
            return this.Cache.Get<T>(key);
        }

        /// <summary>
        /// 添加缓存。
        /// </summary>
        /// <param name="key">缓存主键</param>
        /// <param name="value">需要缓存的数据</param>
        protected void AddCache(string key, object value)
        {
            if (value != null)
            {
                this.Cache.Add(key, value);
            }
        }

        /// <summary>
        /// 清除与本服务相关的缓存。
        /// </summary>
        protected void ClearCache<T>()
        {
            this.Cache.RemoveStarts(GetCacheKeyPrefix<T>());
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取模块名称。
        /// </summary>
        /// <returns>模块名称</returns>
        private string GetModelName()
        {
            var type = this.GetType();

            lock (_locker)
            {
                if (!_dictModuleNames.ContainsKey(type))
                {
                    var attributre = type.GetCustomAttribute<ModuleAttribute>();
                    var moduleName = attributre != null ? attributre.Name : type.Namespace.Split('.').LastOrDefault();

                    _dictModuleNames.Add(type, moduleName);
                }
            }

            return _dictModuleNames[type];
        }

        /// <summary>
        /// 获取缓存键前缀。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>缓存键前缀</returns>
        private static string GetCacheKeyPrefix<T>()
        {
            var typeInfo = typeof(T);

            lock (_locker)
            {
                if (!_dictCacheKeyPrefix.ContainsKey(typeInfo))
                {
                    var tableAttribute = typeInfo.GetCustomAttribute<TableAttribute>();
                    var tableName = tableAttribute == null ? typeInfo.Name : tableAttribute.Name;

                    _dictCacheKeyPrefix.Add(typeInfo, tableName.Replace('.', '_').ToUpper());
                }

                return _dictCacheKeyPrefix[typeInfo];
            }
        }

        #endregion
    }
}
