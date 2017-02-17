// <copyright file="NewsComment.cs" company="武汉链享医药供应链管理有限公司">
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
    /// 新闻评论。
    /// </summary>
    [Table("NewsComment")]
    public class NewsComment : Entity
    {
        #region 属性
    
        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column("Id", IsPrimaryKey = true)]
        public virtual Guid Id { get; set; }
        
        /// <summary>
        /// 新闻编号。
        /// </summary>
        [Display(Name = "新闻编号")]
        [Column("NewsId")]
        public virtual Guid NewsId { get; set; }
        
        /// <summary>
        /// 评论编号(回复评论)。
        /// </summary>
        [Display(Name = "评论编号(回复评论)")]
        [Column("ReplyCommentId")]
        public virtual Guid? ReplyCommentId { get; set; }
        
        /// <summary>
        /// 内容。
        /// </summary>
        [Display(Name = "内容")]
        [Column("Content")]
        [StringLength(2000, ErrorMessage = "内容不能超过{1}个字符。")]
        public virtual string Content { get; set; }
        
        /// <summary>
        /// 状态(1：代审核，2：审核通过、4：审核失败)。
        /// </summary>
        [Display(Name = "状态(1：代审核，2：审核通过、4：审核失败)")]
        [Column("Status")]
        public virtual int? Status { get; set; }
        
        /// <summary>
        /// 点赞次数。
        /// </summary>
        [Display(Name = "点赞次数")]
        [Column("LikePoints")]
        public virtual int? LikePoints { get; set; }
        
        /// <summary>
        /// 评论者编号。
        /// </summary>
        [Display(Name = "评论者编号")]
        [Column("CommentUserId")]
        public virtual Guid? CommentUserId { get; set; }
        
        /// <summary>
        /// 评论时间。
        /// </summary>
        [Display(Name = "评论时间")]
        [Column("CommentDateTime")]
        public virtual DateTime? CommentDateTime { get; set; }
        
        #endregion
    }
}
  