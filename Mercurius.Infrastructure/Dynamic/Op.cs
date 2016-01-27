using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 查询操作枚举。
    /// </summary>
    public enum Op
    {
        /// <summary>
        /// 等于。
        /// </summary>
        Eq = 0,

        /// <summary>
        /// 大于。
        /// </summary>
        Gt = 1,

        /// <summary>
        /// 大于等于。
        /// </summary>
        Ge = 2,

        /// <summary>
        /// 小于。
        /// </summary>
        Lt = 3,

        /// <summary>
        /// 小于等于。
        /// </summary>
        Le = 4,

        /// <summary>
        /// 包含。
        /// </summary>
        Like = 5,

        /// <summary>
        /// null。
        /// </summary>
        IsNull = 6,

        /// <summary>
        /// 非null。
        /// </summary>
        IsNotNull = 7
    }
}
