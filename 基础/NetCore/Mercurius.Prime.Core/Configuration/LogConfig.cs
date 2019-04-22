using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 日志配置信息
    /// </summary>
    public class LogConfig
    {
        #region Properties

        /// <summary>
        /// 日志的级别(Debug、Info、Warn、Fatal)
        /// </summary>
        public string Level { get; set; } = "Debug";

        /// <summary>
        /// 日志记录类型
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// ElasticSearch地址
        /// </summary>
        public string ElasticSearchUrl { get; set; }

        #endregion
    }
}
