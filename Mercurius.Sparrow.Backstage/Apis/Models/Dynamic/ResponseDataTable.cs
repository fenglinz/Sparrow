using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Sparrow.Backstage.Apis.Models.Dynamic
{
    /// <summary>
    /// 返回的数据集信息。
    /// </summary>
    public class ResponseDataTable : Response
    {
        #region 属性

        /// <summary>
        /// 数据集。
        /// </summary>
        public DataTable Datas { get; set; }

        /// <summary>
        /// 总记录数。
        /// </summary>
        public int TotalRecords { get; set; }

        #endregion
    }
}