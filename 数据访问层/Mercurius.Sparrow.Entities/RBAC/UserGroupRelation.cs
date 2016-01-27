using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 用户-用户组关系。
    /// </summary>
	[Table("RBAC.UserGroupRelation")]
    public class UserGroupRelation : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户-用户组关系编号。
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
        /// 获取或者设置用户组编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string UserGroupId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取或者设置关联的用户信息。
        /// </summary>
        public virtual User User { get; set; }

        /// <summary>
        /// 获取或者设置关联的用户组信息。
        /// </summary>
        public virtual UserGroup UserGroup { get; set; }

        #endregion
    }
}
