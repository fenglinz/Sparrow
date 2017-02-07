// <copyright file="TidingsSO.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>fengl</author>
// <create>2017-01-22</create>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Services;

namespace Mercurius.News.Contracts.SearchObjects
{
    /// <summary>
    /// 新闻查询条件。
    /// </summary>
    public class TidingsSO : SearchObject
    {
        #region 属性
        
        /// <summary>
        /// 分类。
        /// </summary>
        public virtual string Category { get; set; }
        
        /// <summary>
        /// 标题。
        /// </summary>
        public virtual string Title { get; set; }
        
        /// <summary>
        /// 状态(1：待审核，2：已发布，4：已删除)。
        /// </summary>
        public virtual int? Status { get; set; }
        
        #endregion
    }
}
    