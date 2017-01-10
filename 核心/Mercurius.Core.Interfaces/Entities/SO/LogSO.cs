using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.EntityBase;

namespace Mercurius.Core.Interfaces.Entities.SO
{
	/// <summary>
	/// 日志信息查询对象。
	/// </summary>
	public class LogSO : SearchObject
	{
		#region 属性

		/// <summary>
		/// 表分空间。
		/// </summary>
		public string Partition { get; set; }

		/// <summary>
		/// 日志级别。
		/// </summary>
		public string Level { get; set; }

		/// <summary>
		/// 开始日期。
		/// </summary>
		[DisplayFormat(ApplyFormatInEditMode = true,
			DataFormatString = "{0:yyyy-MM-dd}")]
		public DateTime? StartDate { get; set; }

		/// <summary>
		/// 结束日期。
		/// </summary>
		[DisplayFormat(ApplyFormatInEditMode = true,
		   DataFormatString = "{0:yyyy-MM-dd}")]
		public DateTime? EndDate { get; set; }

		/// <summary>
		/// 登录用户名。
		/// </summary>
		public string LogOnName { get; set; }

		/// <summary>
		/// 登录IP地址。
		/// </summary>
		public string LogOnIP { get; set; }

		/// <summary>
		/// 模块名。
		/// </summary>
		public string ModelName { get; set; }

		#endregion
	}
}
