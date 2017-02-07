using System;
using System.ComponentModel.DataAnnotations;

namespace Mercurius.Prime.Core.Logger
{
    /// <summary>
    /// 日志级别。
    /// </summary>
    public enum Level
    {
        /// <summary>
        /// 所有。
        /// </summary>
        All = 0,

        /// <summary>
        /// 调试。
        /// </summary>
        Debug,

        /// <summary>
        /// 普通信息。
        /// </summary>
        Info,

        /// <summary>
        /// 警告。
        /// </summary>
        Warn,

        /// <summary>
        /// 错误。
        /// </summary>
        Error,

        /// <summary>
        /// 记录。
        /// </summary>
        Record
    }
}
