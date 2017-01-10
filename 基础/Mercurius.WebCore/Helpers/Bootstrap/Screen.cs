using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.WebCore.Helpers.Bootstrap
{
    /// <summary>
    /// 屏幕枚举。
    /// </summary>
    public enum Screen
    {
        /// <summary>
        /// 默认。
        /// </summary>
        Default = 0,

        /// <summary>
        /// 超小屏幕(&lt;768px)
        /// </summary>
        XS,

        /// <summary>
        /// 小屏幕(≥768px)
        /// </summary>
        SM,

        /// <summary>
        /// 中等屏幕(≥992px)
        /// </summary>
        MD,

        /// <summary>
        /// 大屏幕(≥1200px)
        /// </summary>
        LG
    }
}