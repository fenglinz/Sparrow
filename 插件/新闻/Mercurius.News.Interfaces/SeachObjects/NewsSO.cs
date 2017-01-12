using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Services;

namespace Mercurius.News.Interfaces.SearchObjects
{
    /// <summary>
    /// 新闻查询条件。
    /// </summary>
    public class NewsSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 分类。
        /// </summary>
        public virtual string Category { get; set; }

        /// <summary>
        /// 状态(1：待审核，2：已发布，4：已删除)。
        /// </summary>
        public virtual int? Status { get; set; }

        /// <summary>
        /// 发布者编号。
        /// </summary>
        public virtual string PublisherId { get; set; }

        #endregion
    }
}
