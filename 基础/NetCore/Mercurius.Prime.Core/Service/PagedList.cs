using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 分页集合
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    public sealed class PagedList<T>
    {
        #region Properties

        /// <summary>
        /// 当前页
        /// </summary>
        public int PageIndex { get; set; }

        /// <summary>
        /// 每页显示数据大小
        /// </summary>
        public int PageSize { get; set; }

        /// <summary>
        /// 开始序号
        /// </summary>
        public int StartIndex { get => (this.PageIndex < 0 ? 1 : this.PageIndex - 1) * this.PageSize + 1; }

        /// <summary>
        /// 总记录数
        /// </summary>
        public int TotalRecords { get; set; }

        /// <summary>
        /// 数据集合
        /// </summary>
        public IEnumerable<T> Datas { get; set; }

        #endregion
    }
}
