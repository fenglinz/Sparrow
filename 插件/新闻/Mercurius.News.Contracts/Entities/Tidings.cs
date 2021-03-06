﻿// <copyright file="Tidings.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>fengl</author>
// <create>2017-01-22</create>

using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.News.Contracts.Entities
{
    /// <summary>
    /// 新闻。
    /// </summary>
    [Table("News")]
    public class Tidings : EntityBase
    {
        #region 属性
    
        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column("Id", IsPrimaryKey = true)]
        public virtual Guid Id { get; set; }
        
        /// <summary>
        /// 分类。
        /// </summary>
        [Display(Name = "分类")]
        [Column("Category")]
        [StringLength(250, ErrorMessage = "分类不能超过{1}个字符。")]
        public virtual string Category { get; set; }
        
        /// <summary>
        /// 标题。
        /// </summary>
        [Display(Name = "标题")]
        [Column("Title")]
        [StringLength(500, ErrorMessage = "标题不能超过{1}个字符。")]
        public virtual string Title { get; set; }
        
        /// <summary>
        /// 内容。
        /// </summary>
        [Display(Name = "内容")]
        [Column("Content")]
        public virtual string Content { get; set; }
        
        /// <summary>
        /// 状态(1：待审核，2：已发布，4：已删除)。
        /// </summary>
        [Display(Name = "状态(1：待审核，2：已发布，4：已删除)")]
        [Column("Status")]
        public virtual int? Status { get; set; }
        
        /// <summary>
        /// 浏览次数。
        /// </summary>
        [Display(Name = "浏览次数")]
        [Column("BrowseTimes")]
        public virtual int? BrowseTimes { get; set; }
        
        /// <summary>
        /// 发布者编号。
        /// </summary>
        [Display(Name = "发布者编号")]
        [Column("PublisherId")]
        public virtual Guid? PublisherId { get; set; }
        
        /// <summary>
        /// 发布时间。
        /// </summary>
        [Display(Name = "发布时间")]
        [Column("PublishDateTime")]
        public virtual DateTime? PublishDateTime { get; set; }
        
        #endregion
    }
}
  