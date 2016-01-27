using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Siskin.Contracts.Dynamic;
using Mercurius.Siskin.Entities.Dynamic;
using Mercurius.Siskin.Entities.Dynamic.SO;

namespace Mercurius.Siskin.Backstage.Areas.DynamicPage.Controllers
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

        public ActionResult Index(ExtensionPropertySO so)
        {
            var rsp = this.ExtensionPropertyService.SearchExtensionProperties(so);

            this.ViewBag.Categories = this.ExtensionPropertyService.GetCategories();

            return View(rsp);
        }

        [HttpPost]
        public ActionResult Search(ExtensionPropertySO so)
        {
            var rsp = this.ExtensionPropertyService.SearchExtensionProperties(so);

            return PartialView("_Properties", rsp);
        }

        [HttpPost]
        public ActionResult GetGroupNames(string id)
        {
            var rsp = this.ExtensionPropertyService.GetGroupNames(id);

            return Json(rsp);
        }

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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(ExtensionProperty model)
        {
            model.Initialize();

            var rsp = this.ExtensionPropertyService.CreateOrUpdate(model);

            return rsp.IsSuccess ? CloseDialogWithAlert("添加成功！", callback: $"top.main.ReSearch('{model.Category}');") : Alert("添加失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        [HttpPost]
        public ActionResult Remove(Guid id)
        {
            var rsp = this.ExtensionPropertyService.Remove(id);

            return Json(rsp);
        }

        public ActionResult RenderProperties(string id)
        {
            var rsp = this.ExtensionPropertyService.GetExtensionProperties(id);

            this.ViewBag.Category = id;
            this.ViewBag.GroupNames = this.ExtensionPropertyService.GetGroupNames(id).Datas;

            return PartialView("_RenderProperties", rsp);
        }

        [HttpPost]
        public ActionResult SaveProperties(Guid id, ExtensionPropertyInstance[] instances)
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