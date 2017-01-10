using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Cache;
using Mercurius.Infrastructure.Log;
using Mercurius.RepositoryBase;
using Mercurius.EntityBase;

namespace Mercurius.ServiceBase
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

        private ILogger _logger;
        private string _className;

        #endregion

        #region 属性

        /// <summary>
        /// 日志组件。
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
                this._className = this.GetType().FullName.Replace('.', '_');
            }
        }

        /// <summary>
        /// 缓存提供者。
        /// </summary>
        public CacheProvider Cache { get; set; }

        /// <summary>
        /// IBatis.Net持久化器。
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
        }

        #endregion

        #region 服务支持

        /// <summary>
        /// 执行服务。
        /// </summary>
        /// <param name="method">方法名</param>
        /// <param name="args">方法参数</param>
        /// <param name="callback">回调方法</param>
        /// <returns>操作结果</returns>
        protected Response InvokeService(string method, Action callback, object args = null)
        {
            var model = this.GetModelName();

            this.Logger?.BeforeExecution(model, this._className, method, args);

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

                this.Logger?.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger?.AfterExecution(model, this._className, method, stopwatch.Elapsed, args, result);

            return result;
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="callback">回调方法</param>
        /// <param name="args">参数列表</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <returns>服务返回结果</returns>
        protected Response<T> InvokeService<T>(
            string method,
            Func<T> callback,
            object args = null,
            bool cacheable = true)
        {
            var model = this.GetModelName();

            this.Logger?.BeforeExecution(model, this._className, method, args);

            var result = new Response<T>();
            var stopwatch = new Stopwatch();

            stopwatch.Start();

            try
            {
                if (cacheable && this.Cache != null)
                {
                    var cacheKey = this.Cache.GetCacheKey<T>($"{_className}_{method}", args);
                    var cacheValue = this.Cache.Get<T>(cacheKey);

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

                this.Logger?.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger?.AfterExecution(model, this._className, method, stopwatch.Elapsed, args, result);

            return result;
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="handler">回调方法</param>
        /// <param name="args">参数列表</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <returns>服务返回结果</returns>
        protected ResponseSet<T> InvokeService<T>(
            string method,
            Func<IList<T>> handler,
            object args = null,
            bool cacheable = true)
        {
            var model = this.GetModelName();

            this.Logger?.BeforeExecution(model, this._className, method, args);

            var stopwatch = new Stopwatch();
            var result = new ResponseSet<T>();

            stopwatch.Start();

            try
            {
                if (cacheable && this.Cache != null)
                {
                    var cacheKey = this.Cache.GetCacheKey<T>($"{_className}_{method}", args);
                    var cacheValue = this.Cache.Get<IList<T>>(cacheKey);

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

                this.Logger?.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger?.AfterExecution(model, this._className, method, stopwatch.Elapsed, args, result);

            return result;
        }

        /// <summary>
        /// 执行分页服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="method">方法名</param>
        /// <param name="handler">回调方法</param>
        /// <param name="args">参数列表</param>
        /// <param name="cacheable">是否缓存数据</param>
        /// <returns>服务返回结果</returns>
        protected ResponseSet<T> InvokePagingService<T>(
            string method,
            PagingServiceCallback<T> handler,
            object args = null,
            bool cacheable = true)
        {
            var model = this.GetModelName();

            this.Logger?.BeforeExecution(model, this._className, method, args);

            var stopwatch = new Stopwatch();
            var result = new ResponseSet<T>();

            stopwatch.Start();

            try
            {
                if (cacheable && this.Cache != null)
                {
                    var cacheKey = this.Cache.GetCacheKey<T>($"{_className}_{method}", args);
                    var cacheValue = this.Cache.Get<ResponseSet<T>>(cacheKey);

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

                this.Logger?.Abnormal(model, this._className, method, exception, args);
            }

            stopwatch.Stop();

            this.Logger?.AfterExecution(model, this._className, method, stopwatch.Elapsed, args, result);

            return result;
        }

        #endregion

        #region 操作记录

        /// <summary>
        /// 添加操作记录。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="content">记录内容</param>
        public void AddOperationRecord(string category, string serialNumber, string content)
        {
            //var record = new OperationRecord
            //{
            //    BusinessCategory = category,
            //    BusinessSerialNumber = serialNumber,
            //    Content = content,
            //    AddedUserId = WebHelper.GetLogOnUserId(),
            //    LogOnIPAddress = WebHelper.GetClientIPAddress()
            //};

            //var del = new Action<OperationRecord>(args =>
            //{
            //    this.Persistence.Create(OperationRecordNamespace, "Create", args);
            //});

            //del.BeginInvoke(record, ar =>
            //{
            //    var action = ar.AsyncState as Action<OperationRecord>;

            //    action.EndInvoke(ar);
            //    this.ClearCache<OperationRecord>();
            //}, del);
        }

        #endregion

        #region 缓存处理

        /// <summary>
        /// 添加缓存。
        /// </summary>
        /// <param name="key">缓存主键</param>
        /// <param name="value">需要缓存的数据</param>
        protected void AddCache(string key, object value)
        {
            if (value != null)
            {
                this.Cache?.Add(key, value);
            }
        }

        /// <summary>
        /// 清除与本服务相关的缓存。
        /// </summary>
        protected void ClearCache<T>()
        {
            this.Cache?.RemoveStarts(this.Cache?.GetCacheKey<T>(string.Empty));
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
                    var moduleName = string.IsNullOrWhiteSpace(attributre?.Name) ? type.Namespace.Split('.').LastOrDefault() : attributre.Name;

                    _dictModuleNames.Add(type, moduleName);
                }
            }

            return _dictModuleNames[type];
        }

        #endregion
    }
}
