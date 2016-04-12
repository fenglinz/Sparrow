using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 首页快捷方式控制器。
    /// </summary>
    public class HomeShortcutController : BaseController
    {
        #region 属性

        /// <summary>
        /// 首页快捷方式服务对象。
        /// </summary>
        public IHomeShortcutService HomeShortcutService { get; set; }

        #endregion

        public ActionResult Index()
        {
            var homeShortcuts = this.HomeShortcutService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            return this.View(homeShortcuts);
        }

        public ActionResult CreateOrUpdate(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rsp = this.HomeShortcutService.GetHomeShortcutById(id);

            return this.View(rsp.Data);
        }

        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdate(HomeShortcut homeShortcut)
        {
            homeShortcut.UserId = WebHelper.GetLogOnUserId();

            var rsp = this.HomeShortcutService.CreateOrUpdate(homeShortcut);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string ids)
        {
            var args = ids.Split(',');
            var rsp = this.HomeShortcutService.Remove(WebHelper.GetLogOnUserId(), args);

            return this.Json(rsp);
        }
    }
}
