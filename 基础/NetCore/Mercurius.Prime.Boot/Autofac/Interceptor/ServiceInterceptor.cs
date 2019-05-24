using System;
using System.Diagnostics;
using System.Reflection;
using Castle.DynamicProxy;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Service;
using Newtonsoft.Json;

namespace Mercurius.Prime.Boot.Autofac.Interceptor
{
    /// <summary>
    /// 服务拦截器。
    /// </summary>
    public class ServiceInterceptor : IInterceptor
    {
        #region Properties

        /// <summary>
        /// 日志组件。
        /// </summary>
        public AbstractLogger Logger { get; set; }

        /// <summary>
        /// 缓存提供者。
        /// </summary>
        public CacheProvider Cache { get; set; }

        #endregion

        #region Implements

        /// <summary>
        /// 拦截方法调用中的处理。
        /// </summary>
        /// <param name="invocation">拦截信息</param>
        public void Intercept(IInvocation invocation)
        {
            var responseType = typeof(Response);

            if (invocation.Method.ReturnType != typeof(void) && (invocation.Method.ReturnType == responseType || invocation.Method.ReturnType.IsSubclassOf(responseType)))
            {
                var type = invocation.Method.DeclaringType;

                this.Logger?.BeforeExecution(invocation.Method.DeclaringType.Name, invocation.Method.Name, invocation.Arguments, type.Name);

                var stopwatch = new Stopwatch();

                stopwatch.Start();

                if (invocation.Method.ReturnType == responseType)
                {
                    try
                    {
                        invocation.Proceed();
                    }
                    catch (Exception exp)
                    {
                        var returnValue = invocation.ReturnValue as Response ?? new Response();

                        returnValue.ErrorMessage = exp.Message;

                        invocation.ReturnValue = returnValue;

                        this.Logger?.Fatal(invocation.Method.DeclaringType.Name, invocation.Method.Name, exp, invocation.Arguments, type.Name);
                    }
                }
                else
                {
                    var nonCacheAttribute = invocation.Method.GetCustomAttribute<NonCacheAttribute>();

                    if (this.Cache == null || nonCacheAttribute != null)
                    {
                        invocation.Proceed();

                        return;
                    }

                    var cacheKey = this.GetCacheKey(invocation);
                    var cacheValue = this.Cache.Get(cacheKey);

                    try
                    {
                        if (cacheValue != null)
                        {
                            dynamic resData = JsonConvert.DeserializeObject(cacheValue, invocation.Method.ReturnType);

                            if (invocation.Method.ReturnType.GetProperty("Data") != null && resData.Data != null)
                            {
                                invocation.ReturnValue = resData;

                                return;
                            }
                            else if (invocation.Method.ReturnType.GetProperty("Datas") != null && resData.Datas != null && resData.Datas.Count > 0)
                            {
                                invocation.ReturnValue = resData;

                                return;
                            }
                        }

                        invocation.Proceed();

                        this.Cache.Add(cacheKey, invocation.ReturnValue);
                    }
                    catch (Exception exp)
                    {
                        var res = invocation.ReturnValue as Response;

                        if (res != null)
                        {
                            res.ErrorMessage = exp.Message;
                        }

                        this.Logger?.Fatal(invocation.Method.DeclaringType.Name, invocation.Method.Name, exp, invocation.Arguments, type.Name);
                    }
                }

                stopwatch.Stop();
                this.Logger?.AfterExecution(invocation.Method.DeclaringType.Name, invocation.Method.Name, stopwatch.Elapsed, invocation.Arguments, invocation.ReturnValue, type.Name);
            }
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
            var type = invocation.Method.ReturnType.GenericTypeArguments[0];

            return this.Cache.GetCacheKey(type, invocation.Method.Name, invocation.Arguments);
        }

        #endregion
    }
}
