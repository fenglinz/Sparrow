using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 排序字段信息
    /// </summary>
    public class OrderColumn
    {
        #region 属性

        /// <summary>
        /// 前缀
        /// </summary>
        internal string Prefix { get; set; }

        /// <summary>
        /// 字段名称
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 排序方式
        /// </summary>
        public string OrderBy { get; set; }
        
        #endregion
    }
}
