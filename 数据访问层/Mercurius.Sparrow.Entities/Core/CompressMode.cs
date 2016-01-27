﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 压缩模式枚举。
    /// </summary>
    public enum CompressMode
    {
        /// <summary>
        /// 原始图像
        /// </summary>
        Original = 1,

        /// <summary>
        /// 小
        /// </summary>
        Small = 2,

        /// <summary>
        /// 中等
        /// </summary>
        Medium = 4,

        /// <summary>
        /// 大
        /// </summary>
        Large = 8
    }
}
