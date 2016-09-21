﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Autofac;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Cache;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Mvc.Extensions;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 管理控制台控制器。
    /// </summary>
    [AllowAnonymous]
    public class HomeController : BaseController
    {
        #region 属性

        /// <summary>
        /// 
        /// </summary>
        public CacheProvider Cache { get; set; }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        #region 修改密码

        /// <summary>
        /// 修改密码。
        /// </summary>
        /// <param name="name">账号</param>
        /// <param name="password">密码</param>
        /// <returns>修改结果</returns>
        public ActionResult ChangePassword(string name, string password)
        {
            var connected = this.DynamicQuery.Provider.TryConnect();

            if (connected)
            {
                this.DynamicQuery.Where<User>(u => u.Account, name).Update(new {Password = password.Encrypt()});

                return JavaScript("alert('修改成功！')");
            }

            return JavaScript("alert('数据库连接失败！')");
        }

        #endregion

        #region 缓存管理

        /// <summary>
        /// 显示缓存列表。
        /// </summary>
        /// <returns>显示视图</returns>
        public ActionResult ShowCaches()
        {
            var keys = this.Cache.GetAllKeys();

            return PartialView(keys);
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
            try
            {
                return Json(new { Value = JsonConvert.SerializeObject(this.Cache.Get<object>(key)) });
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
        [ValidateAntiForgeryToken]
        public ActionResult ClearCache()
        {
            var cache = AutofacConfig.Container.Resolve<CacheProvider>();

            cache.Clear();

            return this.AlertWithRefresh("清除成功！");
        }

        #endregion

        #region 加密/解密

        public ActionResult EncryptOrDecrypt()
        {
            return View();
        }

        /// <summary>
        /// 加密、解密处理。
        /// </summary>
        /// <param name="type">类型(encrypt：加密、其他：解密)</param>
        /// <param name="source">需要处理的字符串</param>
        /// <returns>处理后的结果</returns>
        [HttpPost]
        public ActionResult EncryptOrDecrypt(string type, string source)
        {
            string result;

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
    }
}