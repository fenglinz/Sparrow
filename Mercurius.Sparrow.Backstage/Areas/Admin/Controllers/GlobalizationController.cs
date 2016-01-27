using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 视图资源管理控制器。
    /// </summary>
    public class GlobalizationController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置视图资源服务对象。
        /// </summary>
        public IGlobalizationService GlobalizationService { get; set; }

        #endregion

        public ActionResult Index()
        {
            return this.View();
        }

        public ActionResult _GetLocalResources(GlobalizationSO so)
        {
            this.ViewBag.SO = so;

            var model = this.GlobalizationService.GetLocalResources(so);

            return this.PartialView("_LocalResources", model);
        }

        public ActionResult _GetGlobalResources(SearchObject so)
        {
            var model = this.GlobalizationService.GetGlobalResources(so);

            return this.PartialView("_GlobalResources", model);
        }

        public ActionResult CreateOrUpdateLocalResource(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rspResource = this.GlobalizationService.GetResource(id);

            return this.View(rspResource.Data);
        }

        [HttpPost]
        public ActionResult CreateOrUpdateLocalResource(Globalization resource)
        {
            if (string.IsNullOrWhiteSpace(resource.Id))
            {
                resource.Id = Guid.NewGuid().ToString();
            }

            var rsp = this.GlobalizationService.CreateOrUpdateResource(resource);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！", callback: "ReloadResource('local')") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        public ActionResult CreateOrUpdateGlobalResource(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rspResource = this.GlobalizationService.GetResource(id);

            return this.View(rspResource.Data);
        }

        [HttpPost]
        public ActionResult CreateOrUpdateGlobalResource(Globalization resource)
        {
            var rsp = this.GlobalizationService.CreateOrUpdateGlobalResource(resource.Key, resource.Value, resource.Remark);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！", callback: "ReloadResource('global')") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        [HttpPost]
        public ActionResult Remove(string id, string type)
        {
            var rsp = this.GlobalizationService.Remove(id);

            return this.Json(new { IsSuccess = rsp.IsSuccess, Message = rsp.ErrorMessage, Type = type });
        }
    }
}
