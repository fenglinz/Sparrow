using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 首页快捷方式控制器。
    /// </summary>
    public class HomeShortcutController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户信息服务。
        /// </summary>
        public IUserService UserService { get; set; }

        #endregion

        public ActionResult Index()
        {
            var homeShortcuts = this.UserService.GetHomeShortcuts(WebHelper.GetLogOnUserId());

            return this.View(homeShortcuts);
        }

        public ActionResult CreateOrUpdate(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rsp = this.UserService.GetHomeShortcut(id);

            return this.View(rsp.Data);
        }

        [HttpPost]
        public ActionResult CreateOrUpdate(HomeShortcut homeShortcut)
        {
            if (string.IsNullOrWhiteSpace(homeShortcut.Id))
            {
                homeShortcut.Id = Guid.NewGuid().ToString();
            }

            homeShortcut.UserId = WebHelper.GetLogOnUserId();

            var rsp = this.UserService.CreateOrUpdateHomeShortcut(homeShortcut);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage);
        }

        [HttpPost]
        public ActionResult Remove(string ids)
        {
            var args = ids.Split(',');
            var rsp = this.UserService.RemoveHomeShortcut(WebHelper.GetLogOnUserId(), args);

            return this.Json(new { rsp.IsSuccess, Message = rsp.ErrorMessage });
        }
    }
}
