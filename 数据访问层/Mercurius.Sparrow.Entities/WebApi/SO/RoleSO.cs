using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.Sparrow.Entities.WebApi.SO
{
    /// <summary>
    /// Web API角色查询条件。
    /// </summary>
    public class RoleSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 名称。
        /// </summary>
        public virtual string Name { get; set; }

        #endregion
    }
}
