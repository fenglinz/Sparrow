using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 按钮管理控制器。
    /// </summary>
    public class ButtonController : BaseController
    {
        #region 属性

        /// <summary>
        /// 按钮信息服务对象。
        /// </summary>
        public IButtonService ButtonService { get; set; }

        #endregion

        /// <summary>
        /// 进入页面查看
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            this.ViewBag.Buttons = this.ButtonService.GetButtons();

            return this.View();
        }

        /// <summary>
        /// 进入新增或修改按钮信息界面
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateOrUpdate(string id = null)
        {
            if (!string.IsNullOrWhiteSpace(id))
            {
                var resBtn = this.ButtonService.GetButtonById(id);

                if (!resBtn.IsSuccess)
                {
                    this.ViewBag.ErrorMessage = resBtn.ErrorMessage;
                }

                return this.View(resBtn.Data);
            }

            return this.View();
        }

        /// <summary>
        /// 执行新增或修改操作
        /// </summary>
        /// <param name="button"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Button button)
        {
            button.Initialize();

            var rsp = this.ButtonService.CreateOrUpdate(button);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功!") : this.Alert("执行失败，失败原因：" + rsp.ErrorMessage);
        }

        /// <summary>
        /// 删除按钮。
        /// </summary>
        /// <param name="id">按钮编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        public ActionResult Remove(string id)
        {
            var rsp = this.ButtonService.Remove(id);

            return Json(rsp);
        }
    }
}
