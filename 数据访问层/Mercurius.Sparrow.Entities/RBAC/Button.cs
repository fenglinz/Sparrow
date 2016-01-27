using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
	/// <summary>
	/// 按钮信息。
	/// </summary>
	[Table("RBAC.Button")]
	public class Button : ModificationDomain
	{
		#region 属性

		/// <summary>
		/// 获取或者设置按钮编号。
		/// </summary>
		[Required]
		[StringLength(36, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Id { get; set; }

		/// <summary>
		/// 获取或者设置按钮名称。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Name { get; set; }

		/// <summary>
		/// 获取或者设置按钮标记。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Title { get; set; }

		/// <summary>
		/// 获取或者设置按钮图标。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Image { get; set; }

		/// <summary>
		/// 获取或者设置按钮代号。
		/// </summary>
		[StringLength(200, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Code { get; set; }

		/// <summary>
		/// 获取和设置按钮类型。
		/// </summary>
		[StringLength(50, ErrorMessageResourceType = typeof(Constants),
			ErrorMessageResourceName = "MaxStringLength")]
		public virtual string Category { get; set; }

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
	}
}
