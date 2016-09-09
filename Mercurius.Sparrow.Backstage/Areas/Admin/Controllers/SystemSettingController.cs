using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Xml.XPath;
using Autofac;
using IBatisNet.Common.Transaction;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Cache;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.RBAC;
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

            var machineKey = this.GetMachineKey();

            this.ViewBag.ValidationKey = machineKey.Item1;
            this.ViewBag.DecryptionKey = machineKey.Item2;

            return this.View();
        }

        /// <summary>
        /// 保存系统设置。
        /// </summary>
        /// <param name="name">名称</param>
        /// <param name="value">值</param>
        /// <returns>保存结果信息</returns>
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

        /// <summary>
        /// 显示缓存列表。
        /// </summary>
        /// <returns>显示视图</returns>
        public ActionResult ShowCaches()
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();
            var keys = cache.GetAllKeys();

            return View(keys);
        }

        /// <summary>
        /// 显示缓存信息。
        /// </summary>
        /// <param name="key">缓存键</param>
        /// <returns>缓存值信息</returns>
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

        /// <summary>
        /// 删除缓存。
        /// </summary>
        /// <param name="key">缓存键</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult RemoveCacheValue(string key)
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();

            cache.Remove(key);

            return Json(new { IsSuccess = true });
        }

        /// <summary>
        /// 清空缓存。
        /// </summary>
        /// <returns>清空结果</returns>
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

        #region 加密/解密

        /// <summary>
        /// 加密、解密处理。
        /// </summary>
        /// <param name="type">类型(encrypt：加密、其他：解密)</param>
        /// <param name="source">需要处理的字符串</param>
        /// <returns>处理后的结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult EncryptOrDecrypt(string type, string source)
        {
            var result = string.Empty;

            try
            {
                result = type == "encrypt" ? source.Encrypt() : source.Decrypt();
            }
            catch (Exception e)
            {
                result = e.Message;
            }

            return Json(result);
        }

        #endregion

        #region 计算机密钥

        /// <summary>
        /// 刷新计算机密钥。
        /// </summary>
        /// <returns>刷新后的密钥</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult RefreshMachineKey()
        {
            return Json(new
            {
                ValidationKey = KeyCreator.CreateKey(64),
                DecryptionKey = KeyCreator.CreateKey(24)
            });
        }

        /// <summary>
        /// 修改计算机密钥。
        /// </summary>
        /// <param name="validationKey">验证密钥</param>
        /// <param name="decryptionKey">解密密钥</param>
        /// <returns>修改后结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult ChangeMachineKey(string validationKey, string decryptionKey)
        {
            try
            {
                using (var tran = new TransactionScope())
                {
                    var pageIndex = 1;
                    var totalRecords = 0;

                    do
                    {
                        var users = this.DynamicQuery.PagedList<User>(pageIndex++, 20, out totalRecords, columns: new[] { "Id", "Password" });

                        foreach (var user in users)
                        {
                            user.Password = user.Password.Decrypt().SymmetricEncryption(validationKey, decryptionKey);

                            this.DynamicQuery.Where<User>(u => u.Id, user.Id).Update(new { user.Password });
                        }
                    } while (pageIndex * 20 <= totalRecords);

                    tran.Complete();
                }

                this.SaveChangedMachineKey(validationKey, decryptionKey);
            }
            catch (Exception e)
            {
                return Alert($"错误：{e.Message}", AlertType.Error);
            }

            return AlertWithRefresh("计算机密钥修改成功！");
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取计算机密钥(值1：验证密钥、值2：解密密钥)。
        /// </summary>
        /// <returns>
        /// 值1：验证密钥
        /// 值2：解密密钥
        /// </returns>
        private Tuple<string, string> GetMachineKey()
        {
            var xdoc = XDocument.Load(Server.MapPath("~/web.config"));
            var machineKey = xdoc.XPathSelectElement("//system.web/machineKey");

            return new Tuple<string, string>(machineKey?.Attribute("validationKey").Value, machineKey?.Attribute("decryptionKey").Value);
        }

        private void SaveChangedMachineKey(string validationKey, string decryptionKey)
        {
            var xdoc = XDocument.Load(Server.MapPath("~/web.config"));
            var machineKey = xdoc.XPathSelectElement("//system.web/machineKey");

            machineKey.Attribute("validationKey").SetValue(validationKey);
            machineKey.Attribute("decryptionKey").SetValue(decryptionKey);

            xdoc.Save(Server.MapPath("~/web.config"), SaveOptions.None);
        }

        #endregion
    }
}