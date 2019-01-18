using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Ado
{
    /// <summary>
    /// where条件
    /// </summary>
    internal class WhereSegment
    {
        #region 字段

        /// <summary>
        /// 默认去掉的前缀和后缀
        /// </summary>
        public static readonly string[] DefaultTrimed = { "AND", "OR" };

        #endregion

        #region 属性

        /// <summary>
        /// 去掉的前缀和后缀
        /// </summary>
        public IEnumerable<string> Trimeds { get; set; }

        #endregion
    }
}
