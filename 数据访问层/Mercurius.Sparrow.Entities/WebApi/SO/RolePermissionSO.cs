using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.Siskin.Entities.WebApi.SO
{
    /// <summary>
    /// WebApi权限列表查询条件。
    /// </summary>
    public class RolePermissionSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// Web API用户编号。
        /// </summary>
        public virtual int? UserId { get; set; }

        public virtual int? RoleId { get; set; }

        #endregion
    }
}
