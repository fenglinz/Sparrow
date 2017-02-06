using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.WebExtensions.Filters;
using Mercurius.Prime.Core;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 字典管理控制器。
    /// </summary>
    public class DictionaryController : BaseController
    {
        #region 属性

        /// <summary>
        /// 字典服务对象。
        /// </summary>
        public IDictionaryService DictionaryService { get; set; }

        #endregion

        /// <summary>
        /// 进入字典管理首页。
        /// </summary>
        /// <returns>操作结果</returns>
        public ActionResult Index()
        {
            var result = this.DictionaryService.GetDictionaries();

            return this.View(result);
        }

        /// <summary>
        /// 进入添加或者编辑字典信息页面。
        /// </summary>
        /// <returns>操作结果</returns>
        public ActionResult CreateOrUpdate(string id, string parentId)
        {
            this.ViewBag.Categories = this.DictionaryService.GetCategories();

            if (!string.IsNullOrWhiteSpace(parentId))
            {
                this.ViewBag.ParentId = parentId;
            }

            if (string.IsNullOrWhiteSpace(id))
            {
                return this.View();
            }

            var rspDictionary = this.DictionaryService.GetDictionary(id);

            return this.View(rspDictionary.Data);
        }

        /// <summary>
        /// 保存字典信息。
        /// </summary>
        /// <param name="model">字典模型</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdate(Dictionary model)
        {
            if (string.IsNullOrWhiteSpace(model.Id))
            {
                model.Id = Guid.NewGuid().ToString();
            }

            if (!model.IsValid())
            {
                return this.Alert("保存失败，请重新保存！", AlertType.Error);
            }

            var rsp = this.DictionaryService.CreateOrUpdate(model);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 显示创建字典分类页面。
        /// </summary>
        /// <param name="id">字典分类编号</param>
        /// <param name="parentId">父级字典分类编号</param>
        /// <returns>显示字典分类界面</returns>
        public ActionResult CreateOrUpdateCategory(string id, string parentId)
        {
            this.ViewBag.Id = id;
            this.ViewBag.Categories = this.DictionaryService.GetCategories();

            if (!string.IsNullOrWhiteSpace(id))
            {
                var rsp = this.DictionaryService.GetDictionary(id);
                this.ViewBag.ParentId = rsp.Data.ParentId;

                return this.View(rsp.Data);
            }

            this.ViewBag.ParentId = parentId;

            return this.View();
        }

        /// <summary>
        /// 添加或者修改字典分类信息。
        /// </summary>
        /// <param name="model">字典分类信息</param>
        /// <returns>保存结果通知</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdateCategory(Dictionary model)
        {
            if (string.IsNullOrWhiteSpace(model.Id))
            {
                model.Id = Guid.NewGuid().ToString();
            }

            model.Type = 1;
            var rsp = this.DictionaryService.CreateOrUpdateCategory(model);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 删除字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string id)
        {
            var result = this.DictionaryService.Remove(id);

            return this.Json(result);
        }

        /// <summary>
        /// 更改字典状态。
        /// </summary>
        /// <param name="id">字典Id</param>
        /// <param name="status">状态</param>
        /// <returns>操作结果</returns>
        [IgnorePermissionValid]
        public ActionResult ChangeStatus(string id, int status)
        {
            var result = this.DictionaryService.ChangeStatus(id, status);

            return this.Json(result);
        }
    }
}
