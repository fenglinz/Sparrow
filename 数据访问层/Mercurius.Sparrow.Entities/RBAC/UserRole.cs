using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 用户角色信息。
    /// </summary>
	[Table("RBAC.UserRole")]
    public class UserRole : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户角色编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public string Id { get; set; }

        /// <summary>
        /// 获取或者设置用户编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public string UserId { get; set; }

        /// <summary>
        /// 获取或者设置角色编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public string RoleId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取或者设置用户信息。
        /// </summary>
        public virtual string UserName { get; set; }

        /// <summary>
        /// 获取或者设置角色名称。
        /// </summary>
        public virtual string RoleName { get; set; }

        /// <summary>
        /// 获取或者设置所属部门名称。
        /// </summary>
        public virtual IList<string> Departments { get; set; }

        /// <summary>
        /// 获取或者设置关联的用户信息。
        /// </summary>
        public virtual User User { get; set; }

        /// <summary>
        /// 获取或者设置关联的角色信息。
        /// </summary>
        public virtual Role Role { get; set; }

        #endregion
    }
}
