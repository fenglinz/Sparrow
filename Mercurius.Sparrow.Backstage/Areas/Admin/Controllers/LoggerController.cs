using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure.Ado;
using Mercurius.Siskin.Contracts.Core;
using Mercurius.Siskin.Entities.Core.SO;

namespace Mercurius.Siskin.Backstage.Areas.Admin.Controllers
{
	/// <summary>
	/// 日志管理控制器。
	/// </summary>
	public class LoggerController : BaseController
	{
		#region 属性

		/// <summary>
		/// 获取或者设置日志信息服务对象。
		/// </summary>
		public ILoggerService LoggerService { get; set; }

		#endregion

		public ActionResult Index()
		{
			//this.ViewBag.Partitions = this.LoggerService.GetPartitions();

			return this.View();
		}

		public ActionResult Search(LogSO so)
		{
			if (so.EndDate.HasValue)
			{
				so.EndDate = DateTime.Parse($"{so.EndDate.Value.ToString("yyyy-MM-dd")} 23:59:59");
			}

			this.ViewBag.Logs = this.LoggerService.GetLogs(so);
			//this.ViewBag.Partitions = this.LoggerService.GetPartitions();

			return this.View("Index", so);
		}

		[HttpPost]
		public ActionResult ClearLogs()
		{
			var rsp = this.LoggerService.ClearLogs();

			return this.Json(new { IsSuccess = rsp.IsSuccess, Message = rsp.ErrorMessage });
		}

		public ActionResult ViewDetails(string partition, string id)
		{
			var model = this.LoggerService.GetLog(partition, id);

			return this.View(model);
		}
	}
}
