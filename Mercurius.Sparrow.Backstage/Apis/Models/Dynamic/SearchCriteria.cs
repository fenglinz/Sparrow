using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Prime.Core.Dynamic;

namespace Mercurius.Sparrow.Backstage.Apis.Models.Dynamic
{
    /// <summary>
    /// 查询条件。
    /// </summary>
    public class SearchCriteria
    {
        #region 属性

        /// <summary>
        /// 页序号。
        /// </summary>
        public int PageIndex { get; set; } = 1;

        /// <summary>
        /// 每页显示数据的大小。
        /// </summary>
        public int PageSize { get; set; } = 20;

        /// <summary>
        /// 查询条件。
        /// </summary>
        public Criteria Criteria { get; set; }

        #endregion
    }
}