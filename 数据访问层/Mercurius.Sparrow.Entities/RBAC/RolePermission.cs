using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 角色权限信息。
    /// </summary>
	[Table("RBAC.RolePermission")]
    public class RolePermission : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置角色权限编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置角色编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string RoleId { get; set; }

        /// <summary>
        /// 获取或者设置菜单编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string SystemMenuId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取或者设置关联的角色信息。
        /// </summary>
        public virtual Role Role { get; set; }

        #endregion
    }
}
