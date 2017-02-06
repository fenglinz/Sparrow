using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Kernel.WebExtensions.Filters;
using Mercurius.Prime.Core;

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

        /// <summary>
        /// 快捷方式管理首页。
        /// </summary>
        /// <returns>首页视图</returns>
        public ActionResult Index()
        {
            var homeShortcuts = this.HomeShortcutService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            return this.View(homeShortcuts);
        }

        /// <summary>
        /// 显示添加或编辑首页快捷方式界面。
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult CreateOrUpdate(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rsp = this.HomeShortcutService.GetHomeShortcutById(id);

            return this.View(rsp.Data);
        }

        /// <summary>
        /// 保存首页快捷方式信息。
        /// </summary>
        /// <param name="homeShortcut">首页快捷方式信息</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdate(HomeShortcut homeShortcut)
        {
            homeShortcut.UserId = WebHelper.GetLogOnUserId();

            var rsp = this.HomeShortcutService.CreateOrUpdate(homeShortcut);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 删除首页快捷方式。
        /// </summary>
        /// <param name="ids">快捷方式编号</param>
        /// <returns>删除结果信息</returns>
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
