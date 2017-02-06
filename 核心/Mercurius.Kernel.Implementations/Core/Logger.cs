using System;
using System.Collections.Generic;
using System.Text;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Data.IBatisNet;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core
{
    /// <summary>
    /// 日志数据访问仓储接口实现。
    /// </summary>
    public class Logger : ILogger
    {
        #region 静态变量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.Logger";

        #endregion

        #region 委托

        /// <summary>
        /// 写日志委托。
        /// </summary>
        /// <param name="level">日志级别</param>
        /// <param name="logOnIp">登录者IP地址</param>
        /// <param name="logOnId">登录者Id</param>
        /// <param name="callback">回调处理函数</param>
        private delegate void WriteLogDelegate(Level level, string logOnIp, string logOnId, Func<Log> callback);

        #endregion

        #region 属性

        /// <summary>
        /// 缓存器。
        /// </summary>
        public CacheProvider Cache { get; set; }

        /// <summary>
        /// SqlMapper管理器。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Logger()
        {
            var type = this.GetType();
        }

        #endregion

        #region ILogger接口实现

        /// <summary>
        /// 获取指定级别的日志是否可记录。
        /// </summary>
        /// <param name="level">级别</param>
        /// <returns>是否可记录</returns>
        public bool IsEnabledFor(Level level)
        {
            var cacheValue = this.Cache.Get<string>(Constants.LogerLevelCacheKey);

            if (string.IsNullOrWhiteSpace(cacheValue))
            {
                try
                {
                    cacheValue = this.Persistence.QueryForObject<string>(NS, "GetLoggerLevel");

                    if (string.IsNullOrWhiteSpace(cacheValue))
                    {
                        cacheValue = "1";
                    }
                    else
                    {
                        this.Cache.Add(Constants.LogerLevelCacheKey, cacheValue);
                    }
                }
                catch
                {
                    cacheValue = "1";
                }
            }

            var iLevel = int.Parse(cacheValue);

            var minLevel = (Level)iLevel;

            return level >= minLevel;
        }

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="message">日志信息</param>
        public void Write(string model, string message)
        {
            WriteLogDelegate action = this.WriteLog;

            action.BeginInvoke(
                Level.Record,
                WebHelper.GetClientIPAddress(),
                WebHelper.GetLogOnUserId(),
                () => Log.Create(model, message, message, Level.Record),
                ar =>
                {
                    var writeLog = ar.AsyncState as WriteLogDelegate;

                    writeLog.EndInvoke(ar);
                },
                action);
        }

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="summary">日志摘要信息</param>
        /// <param name="details">详细信息</param>
        /// <param name="level">日志级别</param>
        public void Write(string model, string summary, string details, Level level = Level.Info)
        {
            WriteLogDelegate action = this.WriteLog;

            action.BeginInvoke(
                level,
                WebHelper.GetClientIPAddress(),
                WebHelper.GetLogOnUserId(),
                () => Log.Create(model, summary, details, level),
                ar =>
                {
                    var writeLog = ar.AsyncState as WriteLogDelegate;

                    writeLog.EndInvoke(ar);
                },
                action);
        }

        /// <summary>
        /// 记录方法执行前的日志。
        /// </summary>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="model">所属模块</param>
        /// <param name="args">方法参数列表</param>
        public void BeforeExecution(string model, string type, string method, object args = null)
        {
            WriteLogDelegate action = this.WriteLog;

            action.BeginInvoke(
                Level.Debug,
                WebHelper.GetClientIPAddress(),
                WebHelper.GetLogOnUserId(),
                () =>
                {
                    var summary = Constants.ExecuteBefore;
                    var details = string.Format("当前方法详情{2}所在类：{0}{2}方法：{1}", type, method, Environment.NewLine);

                    if (args != null)
                    {
                        details += string.Format("{1}参数列表：{0}", args.AsJson(), Environment.NewLine);
                    }

                    return Log.Create(model, summary, details, Level.Debug);
                },
                ar =>
                {
                    var writeLog = ar.AsyncState as WriteLogDelegate;

                    writeLog.EndInvoke(ar);
                },
                action);
        }

        /// <summary>
        /// 记录方法执行完后的日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="elapsed">方法执行完运行的时间</param>
        /// <param name="args">方法参数列表</param>
        /// <param name="returnValue">返回值</param>
        public void AfterExecution(string model, string type, string method, TimeSpan elapsed, object args = null, object returnValue = null)
        {
            WriteLogDelegate action = this.WriteLog;

            action.BeginInvoke(
                Level.Debug,
                WebHelper.GetClientIPAddress(),
                WebHelper.GetLogOnUserId(),
                () =>
                {
                    var summary = Constants.ExecuteAfter;
                    var details = new StringBuilder();

                    details.AppendFormat("方法执行耗时：{0}毫秒！{1}{1}", elapsed.TotalMilliseconds, Environment.NewLine);
                    details.AppendFormat("当前方法详情{2}所在类：{0}{2}方法：{1}", type, method, Environment.NewLine);

                    if (args != null)
                    {
                        details.AppendFormat("{1}参数列表：{0}{1}", args.AsJson(), Environment.NewLine);
                    }

                    if (returnValue != null)
                    {
                        details.AppendFormat("{1}方法返回值：{0}", returnValue, Environment.NewLine);
                    }

                    return Log.Create(model, summary, details.ToString(), Level.Debug);
                },
            ar =>
            {
                var writeLog = ar.AsyncState as WriteLogDelegate;

                writeLog.EndInvoke(ar);
            },
            action);
        }

        /// <summary>
        /// 记录异常日志信息。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="exception">异常</param>
        /// <param name="args">方法参数列表</param>
        public void Abnormal(string model, string type, string method, Exception exception, object args = null)
        {
            WriteLogDelegate action = this.WriteLog;

            action.BeginInvoke(
                Level.Error,
                WebHelper.GetClientIPAddress(),
                WebHelper.GetLogOnUserId(),
                () =>
                {
                    var summary = $"{Constants.ExceptionOccurred}：{exception.Message}";
                    var details = new StringBuilder();

                    details.AppendFormat("当前方法详情：{2}所在类：{0}{2}方法：{1}", type, method, Environment.NewLine);

                    if (args != null)
                    {
                        details.AppendFormat("{1}参数列表：{0}{1}", args.AsJson(), Environment.NewLine);
                    }

                    details.AppendFormat("调用堆栈：{1}{0}", exception.StackTrace, Environment.NewLine);

                    return Log.Create(model, summary, details.ToString(), Level.Error);
                },
                ar =>
                {
                    var writeLog = ar.AsyncState as WriteLogDelegate;

                    writeLog.EndInvoke(ar);
                },
                action);
        }

        #endregion

        #region 私有方法
        
        /// <summary>
        /// 将日志记录写入数据库。
        /// </summary>
        /// <param name="level">日志级别</param>
        /// <param name="logOnIp">登录者IP地址</param>
        /// <param name="logOnId">登录者Id</param>
        /// <param name="callback">回调处理函数</param>
        private void WriteLog(Level level, string logOnIp, string logOnId, Func<Log> callback)
        {
            try
            {
                if (this.IsEnabledFor(level))
                {
                    var log = callback();

                    log.LogOnIP = logOnIp;
                    log.LogOnId = logOnId;

                    this.Persistence.Create(NS, "Write", log);
                }
            }
            catch
            {
            }
        }

        #endregion
    }
}
