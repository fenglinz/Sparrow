using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Dynamic.Entities;
using Mercurius.Kernel.Contracts.Dynamic.SearchObjects;
using Mercurius.Kernel.Contracts.Dynamic.Services;
using Mercurius.Kernel.WebCores.Filters;
using Mercurius.Prime.Core;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Controllers
{
    /// <summary>
    /// 扩展属性管理控制器。
    /// </summary>
    public class ExtensionPropertyController : BaseController
    {
        #region 属性

        /// <summary>
        /// 扩展属性服务对象。
        /// </summary>
        public IExtensionPropertyService ExtensionPropertyService { get; set; }

        #endregion

        /// <summary>
        /// 扩展属性列表显示&amp;查找。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>查询结果视图</returns>
        public ActionResult Index(ExtensionPropertySO so)
        {
            var rsp = this.ExtensionPropertyService.SearchExtensionProperties(so);

            this.ViewBag.Categories = this.ExtensionPropertyService.GetCategories();

            return View(rsp);
        }

        /// <summary>
        /// 扩展属性查找。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>查找结果部分视图</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Search(ExtensionPropertySO so)
        {
            var rsp = this.ExtensionPropertyService.SearchExtensionProperties(so);

            return PartialView("_Properties", rsp);
        }

        /// <summary>
        /// 获取分组信息。
        /// </summary>
        /// <param name="id">扩展属性编号</param>
        /// <returns>分组信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult GetGroupNames(string id)
        {
            var rsp = this.ExtensionPropertyService.GetGroupNames(id);

            return Json(rsp);
        }

        /// <summary>
        /// 添加或修改扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <param name="category">分类</param>
        /// <returns>显示视图</returns>
        public ActionResult CreateOrUpdate(Guid? id = null, string category = null)
        {
            this.ViewBag.Categories = this.ExtensionPropertyService.GetCategories();

            if (id.HasValue)
            {
                var rsp = this.ExtensionPropertyService.GetExtensionPropertyById(id.Value);

                return View(rsp.Data);
            }

            this.ViewBag.Category = category;

            return View();
        }

        /// <summary>
        /// 保存扩展属性信息。
        /// </summary>
        /// <param name="model">扩展属性信息</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(ExtensionProperty model)
        {
            model.Initialize();

            var rsp = this.ExtensionPropertyService.CreateOrUpdate(model);

            return rsp.IsSuccess ? CloseDialogWithAlert("添加成功！", callback: $"top.main.ReSearch('{model.Category}');") : Alert("添加失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 删除扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(Guid id)
        {
            var rsp = this.ExtensionPropertyService.Remove(id);

            return Json(rsp);
        }

        /// <summary>
        /// 保存扩展属性信息。
        /// </summary>
        /// <param name="id">业务逻辑编号</param>
        /// <param name="instances">扩展属性信息列表</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult SaveProperties(string id, ExtensionPropertyInstance[] instances)
        {
            if (instances.IsEmpty())
            {
                return Alert("无保存的数据！", AlertType.Waring);
            }

            var index = 0;
            foreach (var item in instances)
            {
                item.Value = this.Request.Form[$"instances[{index++}].Value"];
            }

            var rsp = this.ExtensionPropertyService.CreateInstances(id, instances);

            return rsp.IsSuccess ? AlertWithRefresh("保存成功！") : Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }
    }
}