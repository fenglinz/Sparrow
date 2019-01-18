using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Dapper
{
    /// <summary>
    /// XCommand执行的Sql片段.
    /// </summary>
    internal class SqlSegment<T>
    {
        #region 属性

        /// <summary>
        /// sql片段
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// 片段起效lambda表达式。
        /// </summary>
        public Func<T, bool> Predicate { get; set; }

        #endregion
    }
}
