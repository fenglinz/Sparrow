using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 角色信息。
    /// </summary>
    [Table("RBAC.Role")]
    public class Role : ModificationDomain, IHierarchy<string>
    {
		#region 属性

		/// <summary>
		/// 编号。
		/// </summary>
		[Required]
		[StringLength(36, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Id { get; set; }

		/// <summary>
		/// 父角色编号。
		/// </summary>
		[StringLength(36, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string ParentId { get; set; }

		/// <summary>
		/// 角色名称。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Name { get; set; }

		/// <summary>
		/// 条件限制。
		/// </summary>
		[StringLength(200, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Restriction { get; set; }

		/// <summary>
		/// 是否允许编辑。
		/// </summary>
		public virtual bool? AllowEdit { get; set; }

		/// <summary>
		/// 是否允许删除。
		/// </summary>
		public virtual bool? AllowDelete { get; set; }

		/// <summary>
		/// 排序号。
		/// </summary>
		public virtual int? Sort { get; set; }

		/// <summary>
		/// 备注信息。
		/// </summary>
		[StringLength(500, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Remark { get; set; }

		/// <summary>
		/// 实体信息的状态。
		/// </summary>
		public virtual int? Status { get; set; }

		#endregion
	}
}
