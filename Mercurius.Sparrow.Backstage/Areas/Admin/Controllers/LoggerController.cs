using System;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.WebCores.Filters;

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

        /// <summary>
        /// 显示日志列表界面。
        /// </summary>
        /// <returns>显示视图</returns>
		public ActionResult Index()
		{
            this.ViewBag.Logs = this.LoggerService.SearchLogs(new LogSO());

            return this.View();
		}

        /// <summary>
        /// 日志查找。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>日志列表部分视图</returns>
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

        /// <summary>
        /// 清空日志。
        /// </summary>
        /// <returns>清空结果</returns>
		[HttpPost]
        [IgnorePermissionValid]
        public ActionResult ClearLogs()
		{
			var rsp = this.LoggerService.ClearLogs();

			return this.Json(rsp);
		}

        /// <summary>
        /// 查看日志详情。
        /// </summary>
        /// <param name="partition">分区</param>
        /// <param name="id">日志编号</param>
        /// <returns>显示视图</returns>
		public ActionResult ViewDetails(string partition, string id)
		{
			var model = this.LoggerService.GetLog(partition, id);

			return this.View(model);
		}
	}
}
