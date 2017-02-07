using System;

namespace Mercurius.Infrastructure.Data
{
    /// <summary>
    /// 数据类型枚举。
    /// </summary>
    [Serializable]
    public enum DataType
    {
        /// <summary>
        /// 字符型。
        /// </summary>
        String,

        /// <summary>
        /// 日期型。
        /// </summary>
        DateTime,

        /// <summary>
        /// 数值型。
        /// </summary>
        Numeric,

        /// <summary>
        /// 布尔型。
        /// </summary>
        Boolean
    }
}
