using System;
using System.ComponentModel.DataAnnotations;

namespace Mercurius.Siskin.Entities.Core.SO
{
	/// <summary>
	/// 日志信息查询对象。
	/// </summary>
	public class LogSO : SearchObject
	{
		#region 属性

		/// <summary>
		/// 获取或者设置表分空间。
		/// </summary>
		public string Partition { get; set; }

		/// <summary>
		/// 获取或者设置日志级别。
		/// </summary>
		public string Level { get; set; }

		/// <summary>
		/// 获取或者设置开始日期。
		/// </summary>
		[DisplayFormat(ApplyFormatInEditMode = true,
			DataFormatString = "{0:yyyy-MM-dd}")]
		public DateTime? StartDate { get; set; }

		/// <summary>
		/// 获取或者设置结束日期。
		/// </summary>
		[DisplayFormat(ApplyFormatInEditMode = true,
		   DataFormatString = "{0:yyyy-MM-dd}")]
		public DateTime? EndDate { get; set; }

		/// <summary>
		/// 获取或者设置登录用户名。
		/// </summary>
		public string LogOnName { get; set; }

		/// <summary>
		/// 获取或者设置登录IP地址。
		/// </summary>
		public string LogOnIP { get; set; }

		/// <summary>
		/// 获取或者设置模块名。
		/// </summary>
		public string ModelName { get; set; }

		#endregion
	}
}
