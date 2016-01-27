using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 用户组权限信息。
    /// </summary>
	[Table("RBAC.UserGroupPermission")]
    public class UserGroupPermission : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户组权限编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置用户组编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string UserGroupId { get; set; }

        /// <summary>
        /// 获取或者设置菜单编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string SystemMenuId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取或者设置关联的用户组信息。
        /// </summary>
        public virtual UserGroup UserGroup { get; set; }

        #endregion
    }
}
