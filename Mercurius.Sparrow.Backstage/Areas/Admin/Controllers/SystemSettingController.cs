using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Autofac;
using Mercurius.Infrastructure.Cache;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 系统设置管理控制器。
    /// </summary>
    public class SystemSettingController : BaseController
    {
        #region 属性

        /// <summary>
        /// 系统设置服务对象。
        /// </summary>
        public ISystemSettingService SystemSettingService { get; set; }

        #endregion

        /// <summary>
        /// 显示系统设置管理首页。
        /// </summary>
        /// <returns>操作结果</returns>
        public ActionResult Index()
        {
            this.ViewBag.LogLevel = this.SystemSettingService.GetSetting("LogLevel");
            this.ViewBag.ProductInfos = this.SystemSettingService.GetSettings("ProductName");

            return this.View();
        }

        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult SaveSetting(string name, string value)
        {
            var rsp = this.SystemSettingService.SaveSetting(new SystemSetting
            {
                Name = name,
                Value = value
            });

            return Json(rsp);
        }
        
        #region 保存产品信息

        /// <summary>
        /// 保存产品信息。
        /// </summary>
        /// <param name="productName">产品名称</param>
        /// <param name="productVersion">显示版本</param>
        /// <returns>保存结果通知</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult SaveProductInfo(string productName, string productVersion)
        {
            var productNameId = this.Request.Params["productNameId"];
            var productVersionId = this.Request.Params["productVersionId"];

            if (string.IsNullOrWhiteSpace(productNameId))
            {
                productNameId = Guid.NewGuid().ToString();
            }

            if (string.IsNullOrWhiteSpace(productVersionId))
            {
                productVersionId = Guid.NewGuid().ToString();
            }

            this.SystemSettingService.SaveSetting(new SystemSetting
            {
                Id = productNameId,
                Name = "ProductName",
                Value = productName
            });

            this.SystemSettingService.SaveSetting(new SystemSetting
            {
                Id = productVersionId,
                Name = "ProductVersion",
                ParentId = productNameId,
                Value = productVersion
            });

            return AlertWithRefresh("设置成功！");
        }

        #endregion

        #region 缓存管理

        public ActionResult ShowCaches()
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();
            var keys = cache.GetAllKeys();

            return View(keys);
        }

        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult ShowCacheValue(string key)
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();

            try
            {
                return Json(new { Value = cache.Get<string>(key) });
            }
            catch (Exception)
            {
                return Json(new { Value = "" });
            }
        }

        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult RemoveCacheValue(string key)
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();

            cache.Remove(key);

            return Json(new { IsSuccess = true });
        }

        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult ClearCache()
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();

            cache.Clear();

            return this.AlertWithRefresh("清除成功！");
        }

        #endregion
    }
}