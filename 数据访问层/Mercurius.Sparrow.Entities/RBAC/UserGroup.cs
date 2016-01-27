using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 用户组信息。
    /// </summary>
	[Table("RBAC.UserGroup")]
    public class UserGroup : ModificationDomain, IHierarchy<string>
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户组编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置用户组父编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 获取或者设置用户组代号。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 获取或者设置用户组名称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 获取或者设置是否允许编辑。
        /// </summary>
        public virtual bool? AllowEdit { get; set; }

        /// <summary>
        /// 获取或者设置是否允许删除。
        /// </summary>
        public virtual bool? AllowDelete { get; set; }

        /// <summary>
        /// 获取或者设置排序号。
        /// </summary>
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 获取或者设置备注信息。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public string Remark { get; set; }

		/// <summary>
		/// 获取或者设置实体信息的状态。
		/// </summary>
		public virtual int? Status { get; set; }

		#endregion

		#region 导航属性

		/// <summary>
		/// 获取或者设置用户-用户组关系信息。
		/// </summary>
		public virtual IList<UserGroupRelation> UserGroupRelations { get; set; }

        /// <summary>
        /// 获取或者设置用户组权限信息。
        /// </summary>
        public virtual IList<UserGroupPermission> UserGroupPermissions { get; set; }

        #endregion
    }
}
