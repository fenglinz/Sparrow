using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure.Ado;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core.SO;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
	/// <summary>
	/// 日志管理控制器。
	/// </summary>
	public class LoggerController : BaseController
	{
		#region 属性

		/// <summary>
		/// 日志信息服务对象。
		/// </summary>
		public ILoggerService LoggerService { get; set; }

		#endregion

		public ActionResult Index()
		{
            this.ViewBag.Logs = this.LoggerService.SearchLogs(new LogSO());

            return this.View();
		}

        [HttpPost]
        [IgnorePermissionValid]
		public ActionResult Search(LogSO so)
		{
			if (so.EndDate.HasValue)
			{
				so.EndDate = DateTime.Parse($"{so.EndDate.Value.ToString("yyyy-MM-dd")} 23:59:59");
			}

            this.ViewBag.SO = so;
			var rsp = this.LoggerService.SearchLogs(so);

			return this.PartialView("_Logs", rsp);
		}

		[HttpPost]
        [IgnorePermissionValid]
        public ActionResult ClearLogs()
		{
			var rsp = this.LoggerService.ClearLogs();

			return this.Json(rsp);
		}

		public ActionResult ViewDetails(string partition, string id)
		{
			var model = this.LoggerService.GetLog(partition, id);

			return this.View(model);
		}
	}
}
