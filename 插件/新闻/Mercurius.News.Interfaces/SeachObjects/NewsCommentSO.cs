using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.EntityBase;

namespace Mercurius.News.Interfaces.SearchObjects
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
        /// 评论编号(回复评论)。
        /// </summary>
        public virtual Guid? ReplyCommentId { get; set; }

        /// <summary>
        /// 状态(1：代审核，2：审核通过、4：审核失败)。
        /// </summary>
        public virtual int? Status { get; set; }

        /// <summary>
        /// 评论者编号。
        /// </summary>
        public virtual string CommentUserId { get; set; }

        #endregion
    }
}
