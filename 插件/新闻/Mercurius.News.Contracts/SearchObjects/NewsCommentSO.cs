// <copyright file="NewsCommentSO.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>fengl</author>
// <create>2017-01-22</create>

using System;
using Mercurius.Prime.Core.Services;

namespace Mercurius.News.Contracts.SearchObjects
{
    /// <summary>
    /// 新闻评论查询条件。
    /// </summary>
    public class NewsCommentSO : SearchObject
    {
        #region 属性
        
        /// <summary>
        /// 新闻编号。
        /// </summary>
        public virtual Guid? NewsId { get; set; }
        
        /// <summary>
        /// 状态(1：代审核，2：审核通过、4：审核失败)。
        /// </summary>
        public virtual int? Status { get; set; }
        
        #endregion
    }
}
    