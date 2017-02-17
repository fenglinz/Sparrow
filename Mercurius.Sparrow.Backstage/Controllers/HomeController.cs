using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Kernel.WebCores.Filters;
using Mercurius.Prime.Core;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 主页控制器。
    /// </summary>
    public class HomeController : BaseController
    {
        #region 属性

        /// <summary>
        /// 用户信息服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 权限管理服务对象。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        /// <summary>
        /// 首页快捷方式服务对象。
        /// </summary>
        public IHomeShortcutService HomeShortcutService { get; set; }

        /// <summary>
        /// 操作记录服务对象。
        /// </summary>
        public IOperationRecordService OperationRecordService { get; set; }

        #endregion

        /// <summary>
        /// 显示主页。
        /// </summary>
        /// <returns>显示主页</returns>
        public ActionResult Index()
        {
            this.ViewBag.SystemMenus = this.PermissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

            return this.View();
        }

        /// <summary>
        /// 显示工作台界面。
        /// </summary>
        /// <returns>显示界面</returns>
        public ActionResult Workstation()
        {
            var rspHomeShortcuts = this.HomeShortcutService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            this.ViewBag.HomeShortcuts = rspHomeShortcuts.Datas;

            return this.View();
        }

        /// <summary>
        /// 显示操作记录页面。
        /// </summary>
        /// <returns>显示界面</returns>
        public ActionResult OperationRecords(OperationRecordSO so)
        {
            var rsp = this.OperationRecordService.SearchOperationRecords(so);

            return View(rsp);
        }

        /// <summary>
        /// 显示关于界面。
        /// </summary>
        /// <returns>显示界面</returns>
        [IgnorePermissionValid]
        public ActionResult About()
        {
            return View();
        }

        /// <summary>
        /// 404界面。
        /// </summary>
        /// <returns>显示界面</returns>
        [AllowAnonymous]
        public ActionResult NotFound()
        {
            return View();
        }
    }
}
