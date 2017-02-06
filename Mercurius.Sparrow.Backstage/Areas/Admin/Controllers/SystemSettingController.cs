using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Xml.XPath;
using Autofac;
using IBatisNet.Common.Transaction;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Implementations.Storage.WebApi;
using Mercurius.Kernel.WebExtensions.Filters;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Utils;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 系统设置管理控制器。
    /// </summary>
    public class SystemSettingController : BaseController
    {
        #region 属性

        /// <summary>
        /// 文件上传Web Api客户端。
        /// </summary>
        public FileStorageClient FileStorageClient { get; set; }

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

            this.ViewBag.LocalMachineKey = this.GetLocalMachineKey();

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

                    this.SaveChangedMachineKey(validationKey, decryptionKey);

                    tran.Complete();
                }
            }
            catch (Exception e)
            {
                return Alert($"错误：{e.Message}", AlertType.Error);
            }

            return AlertWithRefresh("计算机密钥修改成功！");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult GetRemoteMachineKey()
        {
            var localMachineKey = this.GetLocalMachineKey();
            var rsp = this.FileStorageClient.GetMachineKey(WebHelper.GetLogOnAccount());

            return Json(new
            {
                IsSuccess = rsp.IsSuccess,
                ValidationKey = rsp.Data?.ValidationKey,
                DecryptionKey = rsp.Data?.DecryptionKey,
                IsSame = localMachineKey.ValidationKey == rsp.Data?.ValidationKey
            });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult SynchronizeMachineKey()
        {
            var machineKey = this.GetLocalMachineKey();

            var rsp = this.FileStorageClient.ChangeMachineKey(WebHelper.GetLogOnAccount(), machineKey);

            return Json(rsp);
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取当前系统的计算机密钥。
        /// </summary>
        /// <returns>
        /// 计算机密钥。
        /// </returns>
        private MachineKey GetLocalMachineKey()
        {
            var xdoc = XDocument.Load(Server.MapPath("~/web.config"));
            var machineKey = xdoc.XPathSelectElement("//system.web/machineKey");

            return new MachineKey
            {
                ValidationKey = machineKey?.Attribute("validationKey").Value,
                DecryptionKey = machineKey?.Attribute("decryptionKey").Value
            };
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