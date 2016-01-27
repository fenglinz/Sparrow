﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Siskin.Contracts.Core;
using Mercurius.Siskin.Entities.Core;

namespace Mercurius.Siskin.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 系统设置管理控制器。
    /// </summary>
    public class SystemSettingController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置系统设置服务对象。
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
        public ActionResult SaveLogLevlSetting(string level)
        {
            var rsp = this.SystemSettingService.SaveSetting(new SystemSetting
            {
                Id = Guid.NewGuid().ToString(),
                Name = "LogLevel",
                Value = level
            });

            return rsp.IsSuccess ? this.Alert("设置成功！") : this.Alert("设置失败，错误详情：" + rsp.ErrorMessage, AlertType.Error);
        }

        [HttpPost]
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

            return this.Alert("设置成功！");
        }
    }
}