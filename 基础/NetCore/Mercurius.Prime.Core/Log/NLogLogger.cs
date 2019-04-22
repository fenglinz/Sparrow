using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NLog;

namespace Mercurius.Prime.Core.Log
{
    /// <summary>
    /// 基于NLoger日志类。
    /// </summary>
    public class NLogLogger : AbstractLogger
    {
        #region 字段

        private Logger _logger = LogManager.GetCurrentClassLogger();

        #endregion

        /// <summary>
        /// 记录日志。
        /// </summary>
        /// <param name="message">日志信息</param>
        /// <param name="level">日志级别</param>
        protected override void Log(string message, Level level = Level.Info)
        {
            switch (level)
            {
                case Level.Debug:
                    this._logger.Debug(message);

                    break;
                case Level.Info:
                    this._logger.Info(message);

                    break;
                case Level.Warn:
                    this._logger.Warn(message);

                    break;
                case Level.Fatal:
                    this._logger.Fatal(message);

                    break;
            }
        }
    }
}
