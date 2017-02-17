using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.WebCores.Filters;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 资源管理控制器。
    /// </summary>
    public class GlobalizationController : BaseController
    {
        #region 属性

        /// <summary>
        /// 视图资源服务对象。
        /// </summary>
        public IGlobalizationService GlobalizationService { get; set; }

        #endregion

        /// <summary>
        /// 显示资源管理首页。
        /// </summary>
        /// <returns>资源管理首页</returns>
        public ActionResult Index()
        {
            return this.View();
        }

        /// <summary>
        /// 获取局部资源。
        /// </summary>
        /// <param name="so">资源查询对象</param>
        /// <returns>局部资源部分视图</returns>
        [IgnorePermissionValid]
        public ActionResult _GetLocalResources(GlobalizationSO so)
        {
            this.ViewBag.SO = so;

            var model = this.GlobalizationService.GetLocalResources(so);

            return this.PartialView("_LocalResources", model);
        }

        /// <summary>
        /// 获取全局资源。
        /// </summary>
        /// <param name="so">资源查询对象</param>
        /// <returns>全局资源部分视图</returns>
        [IgnorePermissionValid]
        public ActionResult _GetGlobalResources(SearchObject so)
        {
            var model = this.GlobalizationService.GetGlobalResources(so);

            return this.PartialView("_GlobalResources", model);
        }

        /// <summary>
        /// 显示局部资源信息。
        /// </summary>
        /// <param name="id">资源编号</param>
        /// <returns>局部资源显示界面</returns>
        public ActionResult CreateOrUpdateLocalResource(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rspResource = this.GlobalizationService.GetResource(id);

            return this.View(rspResource.Data);
        }

        /// <summary>
        /// 保存局部资源信息。
        /// </summary>
        /// <param name="resource">局部资源信息</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdateLocalResource(Globalization resource)
        {
            var rsp = this.GlobalizationService.CreateOrUpdateResource(resource);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！", callback: "top.main.ReloadResource('local')") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 显示全局资源信息界面。
        /// </summary>
        /// <param name="id">资源编号</param>
        /// <returns>全局资源界面</returns>
        public ActionResult CreateOrUpdateGlobalResource(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rspResource = this.GlobalizationService.GetResource(id);

            return this.View(rspResource.Data);
        }

        /// <summary>
        /// 保存全局资源。
        /// </summary>
        /// <param name="resource">全局资源信息</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdateGlobalResource(Globalization resource)
        {
            var rsp = this.GlobalizationService.CreateOrUpdateGlobalResource(resource.Key, resource.Value, resource.Remark);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！", callback: "top.main.ReloadResource('global')") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 删除资源。
        /// </summary>
        /// <param name="id">资源编号</param>
        /// <param name="type">资源类型</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string id, string type)
        {
            var rsp = this.GlobalizationService.Remove(id);

            return this.Json(new { rsp.IsSuccess, rsp.ErrorMessage, Type = type });
        }
    }
}
