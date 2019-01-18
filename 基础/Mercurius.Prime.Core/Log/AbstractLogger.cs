using System;

namespace Mercurius.Prime.Core.Log
{
    /// <summary>
    /// 记录日志的抽象类。
    /// </summary>
    public abstract class AbstractLogger
    {
        #region 公开方法

        /// <summary>
        /// 获取指定级别的日志是否可记录。
        /// </summary>
        /// <param name="level">级别</param>
        /// <returns>是否可记录</returns>
        public bool IsEnabledFor(Level level)
        {
            var canWriteLevel = Level.Debug;
            var success = Enum.TryParse<Level>(SystemConfiguration.LogLevel, out canWriteLevel);

            if (success)
            {
                return level >= canWriteLevel;
            }

            return level >= Level.Info;
        }

        /// <summary>
        /// 记录日志信息。
        /// </summary>
        /// <param name="message">日志信息</param>
        /// <param name="level">日志级别</param>
        public void Write(string message, Level level = Level.Info)
        {
            if (this.IsEnabledFor(level))
            {
                this.Log(message, level);
            }
        }

        /// <summary>
        /// 记录格式化日志信息。
        /// </summary>
        /// <param name="format">格式化字符串</param>
        /// <param name="args">参数</param>
        public void WriteFormat(string format, params object[] args)
        {
            this.Write(string.Format(format, args), Level.Debug);
        }

        /// <summary>
        /// 记录格式化日志信息。
        /// </summary>
        /// <param name="level">日志级别</param>
        /// <param name="format">格式化字符串</param>
        /// <param name="args">参数</param>
        public void WriteFormat(Level level, string format, params object[] args)
        {
            this.Write(string.Format(format, args), level);
        }

        /// <summary>
        /// 记录方法执行前的日志。
        /// </summary>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="args">方法参数列表</param>
        /// <param name="model">所属模块</param>
        public void BeforeExecution(string type, string method, object args = null, string model = null)
        {
            var message = $"{(model.IsNullOrEmpty() ? "" : $"【{model}】模块的")}【{type}#{method}】开始执行，传入参数为【{args.AsJson()}】。";

            this.Write(message, Level.Debug);
        }

        /// <summary>
        /// 记录方法执行完后的日志。
        /// </summary>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="elapsed">方法执行完运行的时间</param>
        /// <param name="args">方法参数列表</param>
        /// <param name="returnValue">返回值</param>
        /// <param name="model">所属模块</param>
        public void AfterExecution(string type, string method, TimeSpan elapsed, object args = null, object returnValue = null, string model = null)
        {
            var message = $"{(model.IsNullOrEmpty() ? "" : $"【{model}】模块的")}【{type}#{method}】执行完成，传入参数为【{args.AsJson()}】，返回结果为【{returnValue.AsJson()}】，共耗时【{elapsed.TotalMilliseconds}】毫秒。";

            this.Write(message, Level.Debug);
        }

        /// <summary>
        /// 记录异常日志信息。
        /// </summary>
        /// <param name="type">类型名称</param>
        /// <param name="method">需要记录日志的方法</param>
        /// <param name="exception">异常</param>
        /// <param name="args">方法参数列表</param>
        /// <param name="model">所属模块</param>
        public void Fatal(string type, string method, Exception exception, object args = null, string model = null)
        {
            var message = $"{(model.IsNullOrEmpty() ? "" : $"【{model}】模块的")}【{type}#{method}】在执行时出现错误，错误详情【{exception.Message}】，传入参数为【{args.AsJson()}】。";

            this.Write(message, Level.Fatal);
        }

        #endregion

        #region 抽象方法

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="message">日志信息</param>
        /// <param name="level">日志级别</param>
        protected abstract void Log(string message, Level level = Level.Info);

        #endregion
    }
}
