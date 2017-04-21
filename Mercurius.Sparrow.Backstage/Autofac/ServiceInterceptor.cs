using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Web;
using Castle.DynamicProxy;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.Services;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Autofac
{
    /// <summary>
    /// 服务拦截器。
    /// </summary>
    public class ServiceInterceptor : StandardInterceptor
    {
        #region 属性

        /// <summary>
        /// 日志组件。
        /// </summary>
        public ILogger Logger { get; set; }

        /// <summary>
        /// 缓存提供者。
        /// </summary>
        public CacheProvider Cache { get; set; }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 拦截方法调用前的处理。
        /// </summary>
        /// <param name="invocation">拦截信息</param>
        protected override void PreProceed(IInvocation invocation)
        {
            base.PreProceed(invocation);
        }

        /// <summary>
        /// 拦截方法调用中的处理。
        /// </summary>
        /// <param name="invocation">拦截信息</param>
        protected override void PerformProceed(IInvocation invocation)
        {
            var responseType = typeof(Response);

            if (invocation.Method.ReturnType != typeof(void) &&
                (invocation.Method.ReturnType == responseType ||
                invocation.Method.ReturnType.IsSubclassOf(responseType)))
            {
                var type = invocation.Method.DeclaringType;

                this.Logger?.BeforeExecution(type.Name, invocation.Method.DeclaringType.Name, invocation.Method.Name, invocation.Arguments);

                var stopwatch = new Stopwatch();

                stopwatch.Start();

                if (invocation.Method.ReturnType == responseType)
                {
                    try
                    {
                        base.PerformProceed(invocation);
                    }
                    catch (Exception exp)
                    {
                        invocation.ReturnValue = new Response { ErrorMessage = exp.Message };

                        this.Logger?.Abnormal(type.Name, invocation.Method.DeclaringType.Name, invocation.Method.Name, exp, invocation.Arguments);
                    }
                }
                else
                {
                    var cache = invocation.Method.GetCustomAttribute<NonCacheAttribute>();

                    if (cache?.UseCache == false)
                    {
                        base.PerformProceed(invocation);

                        return;
                    }

                    var cacheKey = this.GetCacheKey(invocation);
                    var cacheValue = this.Cache.Get(cacheKey);

                    try
                    {
                        if (cacheValue != null)
                        {
                            invocation.ReturnValue = JsonConvert.DeserializeObject(cacheValue, invocation.Method.ReturnType);
                        }
                        else
                        {
                            base.PerformProceed(invocation);

                            this.Cache.Add(cacheKey, invocation.ReturnValue);
                        }
                    }
                    catch (Exception exp)
                    {
                        var res = invocation.ReturnValue as Response;

                        if (res != null)
                        {
                            res.IsSuccess = false;
                            res.ErrorMessage = exp.Message;
                        }

                        this.Logger?.Abnormal(type.Name, invocation.Method.DeclaringType.Name, invocation.Method.Name, exp, invocation.Arguments);
                    }
                }

                stopwatch.Stop();
                this.Logger?.AfterExecution(type.Name, invocation.Method.DeclaringType.Name, invocation.Method.Name, stopwatch.Elapsed, invocation.Arguments, invocation.ReturnValue);
            }
        }

        /// <summary>
        /// 拦截方法调用后的处理。
        /// </summary>
        /// <param name="invocation">拦截信息</param>
        protected override void PostProceed(IInvocation invocation)
        {
            base.PostProceed(invocation);
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取缓存键。
        /// </summary>
        /// <param name="invocation"></param>
        /// <returns></returns>
        private string GetCacheKey(IInvocation invocation)
        {
            return $"{invocation.TargetType.Namespace?.Replace(".", "_")}_{invocation.Method.Name}_{invocation.Arguments?.AsJson()}";
        }

        #endregion
    }
}