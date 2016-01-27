using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Mercurius.Siskin.Entities.WebApi
{
    /// <summary>
    /// WebApi权限列表。
    /// </summary>
    public class RolePermission : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }

        /// <summary>
        /// Web API用户编号。
        /// </summary>
        [Display(Name = "Web API角色编号")]
        public virtual int RoleId { get; set; }

        /// <summary>
        /// API编号。
        /// </summary>
        [Display(Name = "API编号")]
        public virtual int ApiId { get; set; }

        #endregion
    }
}
