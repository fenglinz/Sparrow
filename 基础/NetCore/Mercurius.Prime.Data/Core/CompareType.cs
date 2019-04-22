using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 比较类型
    /// </summary>
    public enum CompareType
    {
        /// <summary>
        /// NULL
        /// </summary>
        Null,

        /// <summary>
        /// 不为NULL
        /// </summary>
        NotNull,

        /// <summary>
        /// 相等
        /// </summary>
        Equal,

        /// <summary>
        /// 不等于
        /// </summary>
        NotEqual,

        /// <summary>
        /// 模糊匹配
        /// </summary>
        Like,

        /// <summary>
        /// 前匹配
        /// </summary>
        StartsWith,

        /// <summary>
        /// 后匹配
        /// </summary>
        EndsWith,

        /// <summary>
        /// 大于
        /// </summary>
        GreaterThan,

        /// <summary>
        /// 大于等于
        /// </summary>
        GreaterEqual,

        /// <summary>
        /// 小于
        /// </summary>
        LessThan,

        /// <summary>
        /// 小于等于
        /// </summary>
        LessEqual,

        /// <summary>
        /// 包含
        /// </summary>
        In,

        /// <summary>
        /// 不包含
        /// </summary>
        NotIn,

        /// <summary>
        /// 无操作符
        /// </summary>
        None
    }
}
