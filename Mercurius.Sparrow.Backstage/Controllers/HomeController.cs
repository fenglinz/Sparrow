using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.Core;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 主页控制器。
    /// </summary>
    public class HomeController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户信息服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 获取或者设置权限管理服务对象。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        #endregion

        public ActionResult MainSwitch()
        {
            return this.RedirectToAction("Main");
        }

        public ActionResult Main()
        {
            this.ViewBag.SystemMenus = this.PermissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

            return this.View("MainDefault");
        }

        public ActionResult Index()
        {
            var totalRecords = 0;
            var rspHomeShortcuts = this.UserService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            this.ViewBag.HomeShortcuts = rspHomeShortcuts.Datas;
            this.ViewBag.LogOnOffs = this.DynamicQuery
                .Where<OperationRecord>(m => m.BusinessId, WebHelper.GetLogOnUserId())
                .OrderBy(m => m.RecordDateTime, OrderBy.Desc)
                .PagedList(1, 20, out totalRecords);

            return this.View();
        }

        [HttpPost]
        public JsonResult GetSystemMenus()
        {
            var rspMenus = this.PermissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

            return this.Json(rspMenus.Datas);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
