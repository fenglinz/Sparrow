using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.NewsCenter
{
    /// <summary>
    /// 新闻。
    /// </summary>
    [Serializable]
    [Table("News")]
    public class News : Domain
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
        /// 附件。
        /// </summary>
        [Display(Name = "附件")]
        [Column("Attachments")]
        [StringLength(4000, ErrorMessage = "附件不能超过{1}个字符。")]
        public virtual string Attachments { get; set; }

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
        [StringLength(36, ErrorMessage = "发布者编号不能超过{1}个字符。")]
        public virtual string PublisherId { get; set; }

        /// <summary>
        /// 发布时间。
        /// </summary>
        [Display(Name = "发布时间")]
        [Column("PublishDateTime")]
        public virtual DateTime? PublishDateTime { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 附件名称。
        /// </summary>
        public string AttachmentNames { get; set; }

        /// <summary>
        /// 附件描述信息。
        /// </summary>
        public string AttachmentDescriptions { get; set; }

        /// <summary>
        /// 发布者名称。
        /// </summary>
        public string PublisherName { get; set; }

        #endregion
    }
}
