using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 分组字段
    /// </summary>
    public class GroupColumn
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

        #endregion
    }
}
