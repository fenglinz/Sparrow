using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.Sparrow.Entities.Dynamic.SO
{
    /// <summary>
    /// 扩展属性查询条件。
    /// </summary>
    public class ExtensionPropertySO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 分类。
        /// </summary>
        public virtual string Category { get; set; }

        #endregion
    }
}
