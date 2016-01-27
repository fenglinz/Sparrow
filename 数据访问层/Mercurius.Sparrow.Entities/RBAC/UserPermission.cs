using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 用户权限信息。
    /// </summary>
	[Table("RBAC.UserPermission")]
    public class UserPermission : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户权限信息编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置用户编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string UserId { get; set; }

        /// <summary>
        /// 获取或者设置菜单编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string SystemMenuId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取或者设置关联的用户信息。
        /// </summary>
        public virtual User User { get; set; }

        #endregion
    }
}
