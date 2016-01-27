﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Entities.Chart
{
    /// <summary>
    /// 图表条目。
    /// </summary>
    public class Entry
    {
        #region 属性

        /// <summary>
        /// 获取或者设置X轴值。
        /// </summary>
        public virtual string XValue { get; set; }

        /// <summary>
        /// 获取或者设置Y轴值。
        /// </summary>
        public virtual object YValue { get; set; }

        #endregion
    }
}
