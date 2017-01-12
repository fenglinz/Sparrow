using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Logger
{
    /// <summary>
    /// 记录日志的接口。
    /// </summary>
    public interface ILogger
    {
        /// <summary>
        /// 获取指定级别的日志是否可记录。
        /// </summary>
        /// <param name="level">级别</param>
        /// <returns>是否可记录</returns>
        bool IsEnabledFor(Level level);

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="message">日志信息</param>
        void Write(string model, string message);

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="summary">日志摘要信息</param>
        /// <param name="details">详细信息</param>
        /// <param name="level">日志级别</param>
        void Write(string model, string summary, string details, Level level = Level.Info);

        /// <summary>
        /// 记录方法执行前的日志。
        /// </summary>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="model">所属模块</param>
        /// <param name="args">方法参数列表</param>
        void BeforeExecution(string model, string type, string method, object args = null);

        /// <summary>
        /// 记录方法执行完后的日志。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="elapsed">方法执行完运行的时间</param>
        /// <param name="args">方法参数列表</param>
        /// <param name="returnValue">返回值</param>
        void AfterExecution(string model, string type, string method, TimeSpan elapsed, object args = null, object returnValue = null);

        /// <summary>
        /// 记录异常日志信息。
        /// </summary>
        /// <param name="model">所属模块</param>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="exception">异常</param>
        /// <param name="args">方法参数列表</param>
        void Abnormal(string model, string type, string method, Exception exception, object args = null);
    }
}
