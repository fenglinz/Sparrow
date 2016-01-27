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
    public class ButtonController : BaseController
    {
        #region 属性
        
        /// <summary>
        /// 获取或设置按钮信息。
        /// </summary>
        public IButtonService ButtonService { get; set; }

        #endregion

        /// <summary>
        /// 进入页面查看
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            var buttonInfos = this.ButtonService.GetButtons();

            this.ViewBag.ButtonInfos = buttonInfos;

            return this.View();
        }

        /// <summary>
        /// 进入新增或修改按钮信息界面
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateOrUpdate(string id =null)
        {
            if (!string.IsNullOrWhiteSpace(id))
            {
                //获取指定按钮信息
                var resBtn = this.ButtonService.GetButton(id);

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
            if (string.IsNullOrWhiteSpace(button.Id))
            {
                button.Id = Guid.NewGuid().ToString();
            }

            button.Initialize();

            if (button.IsValid())
            {
                var rsp = this.ButtonService.CreateOrUpdate(button);
                if (!rsp.IsSuccess)
                {
                    return this.Alert("执行失败，失败原因：" + rsp.ErrorMessage);
                }
            }
            else
            {
                return this.Alert(this.ConvertToHtml(button.GetErrorMessage()));
            }

            return this.CloseDialogWithAlert("执行成功!");
        }
    }
}
