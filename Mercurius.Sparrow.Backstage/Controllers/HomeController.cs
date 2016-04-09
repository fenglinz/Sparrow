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
        /// 用户信息服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 权限管理服务对象。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        #endregion

        public ActionResult Index()
        {
            this.ViewBag.SystemMenus = this.PermissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

            return this.View();
        }

        public ActionResult Workstation()
        {
            var rspHomeShortcuts = this.UserService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            this.ViewBag.HomeShortcuts = rspHomeShortcuts.Datas;

            return this.View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
