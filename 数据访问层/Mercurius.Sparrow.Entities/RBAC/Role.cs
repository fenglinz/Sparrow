using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.RBAC
{
    /// <summary>
    /// 角色信息。
    /// </summary>
    [Table("RBAC.Role")]
    public class Role : ModificationDomain, IHierarchy<string>
    {
		#region 属性

		/// <summary>
		/// 获取或者设置编号。
		/// </summary>
		[Required]
		[StringLength(36, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Id { get; set; }

		/// <summary>
		/// 获取或者设置父角色编号。
		/// </summary>
		[StringLength(36, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string ParentId { get; set; }

		/// <summary>
		/// 获取或者设置角色名称。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Name { get; set; }

		/// <summary>
		/// 获取或者设置条件限制。
		/// </summary>
		[StringLength(200, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Restriction { get; set; }

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
		public virtual string Remark { get; set; }

		/// <summary>
		/// 获取或者设置实体信息的状态。
		/// </summary>
		public virtual int? Status { get; set; }

		#endregion

		#region 导航属性

		/// <summary>
		/// 获取或者设置关联的用户权限信息。
		/// </summary>
		public virtual IList<UserRole> UserRoles { get; set; }

		/// <summary>
		/// 获取或者设置关联的角色权限信息。
		/// </summary>
		public virtual IList<RolePermission> RolePermissions { get; set; }

		#endregion
	}
}
