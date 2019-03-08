using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Core.Log;

namespace Mercurius.Prime.Boot.Autofac.Interceptor
{
    /// <summary>
    /// 基于autofac的日志记录过滤器。
    /// </summary>
    public class LoggingActionFilter : IAutofacActionFilter
    {
        #region 字段

        /// <summary>
        /// 计时器
        /// </summary>
        private readonly Stopwatch _stopwatch;

        /// <summary>
        /// 日志对象
        /// </summary>
        private readonly AbstractLogger _logger;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="logger">日志对象</param>
        public LoggingActionFilter(AbstractLogger logger)
        {
            this._logger = logger;
            this._stopwatch = new Stopwatch();
        }

        #endregion

        #region IAutofacActionFilter接口实现

        /// <summary>
        /// 记录action开始执行时的日志。
        /// </summary>
        /// <param name="actionContext">action执行上下文</param>
        /// <param name="cancellationToken">线程取消的令牌</param>
        /// <returns>异步任务</returns>
        public Task OnActionExecutingAsync(HttpActionContext actionContext, CancellationToken cancellationToken)
        {
            if (cancellationToken.IsCancellationRequested)
            {
                return Task.FromResult(0);
            }

            var controllerDescriptor = actionContext.ActionDescriptor.ControllerDescriptor;
            var controllerType = controllerDescriptor.ControllerType;

            var fullName = controllerType.FullName;
            var model = controllerDescriptor.ControllerName;
            var method = actionContext.ActionDescriptor.ActionName;

            this._logger?.BeforeExecution(fullName, method, actionContext.ActionArguments, model);

            // 开始计时
            this._stopwatch.Start();

            return Task.FromResult(0);
        }

        /// <summary>
        /// 记录action执行完成后的日志。
        /// </summary>
        /// <param name="actionExecutedContext">action执行完成后的上下文</param>
        /// <param name="cancellationToken">线程取消的令牌</param>
        /// <returns>异步任务</returns>
        public Task OnActionExecutedAsync(HttpActionExecutedContext actionExecutedContext, CancellationToken cancellationToken)
        {
            if (cancellationToken.IsCancellationRequested)
            {
                return Task.FromResult(0);
            }

            var controllerDescriptor = actionExecutedContext.ActionContext.ActionDescriptor.ControllerDescriptor;
            var controllerType = controllerDescriptor.ControllerType;

            var fullName = controllerType.FullName;
            var modelName = controllerDescriptor.ControllerName;
            var methodName = actionExecutedContext.ActionContext.ActionDescriptor.ActionName;
            var parameters = actionExecutedContext.ActionContext.ActionArguments;

            this._stopwatch.Stop();

            if (this._logger?.IsEnabledFor(Level.Debug) == true)
            {
                var returnValue = actionExecutedContext.Response?.Content?.ReadAsStringAsync()?.Result;

                this._logger?.AfterExecution(fullName, methodName, this._stopwatch.Elapsed, parameters, returnValue, modelName);
            }

            return Task.FromResult(0);
        }

        #endregion
    }
}
