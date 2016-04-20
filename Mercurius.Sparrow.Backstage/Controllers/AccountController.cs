using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.WebPages;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 账户信息处理控制器。
    /// </summary>
    [AllowAnonymous]
    public class AccountController : BaseController
    {
        #region 常量

        private const string InstallStatusKey = "Install.Status";
        private const string SessionVerifyCode = "session_verifyCode";

        /// <summary>
        /// 验证码错误。
        /// </summary>
        private const string VerifyCodeError = "验证码错误！";

        /// <summary>
        /// 账号或密码错误。
        /// </summary>
        private const string AccountOrPasswordError = "账号或密码错误！";

        /// <summary>
        /// 账户被锁。
        /// </summary>
        private const string AccountLocked = "账户被锁！";

        /// <summary>
        /// 用户已经登录。
        /// </summary>
        private const string AccountAlreadyLogOn = "用户已经登录！";

        /// <summary>
        /// 登录成功。
        /// </summary>
        private const string LogOnValidateError = "用户信息查询失败，请检查数据库服务器是否正常！";

        #endregion

        #region 属性

        /// <summary>
        /// 用户服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        #endregion

        /// <summary>
        /// 显示登录界面。
        /// </summary>
        /// <returns>登录界面</returns>
        public ActionResult LogOn()
        {
            var installStatus = 1;

            if (ConfigurationManager.AppSettings[InstallStatusKey] != null)
            {
                installStatus = ConfigurationManager.AppSettings[InstallStatusKey].AsInt(0);
            }

            if (installStatus == 0)
            {
                return RedirectToAction("Index", "Install", new { @Area = "Admin" });
            }

            return this.View();
        }

        /// <summary>
        /// 登录处理。
        /// </summary>
        /// <param name="name">账号</param>
        /// <param name="password">密码</param>
        /// <param name="verifyCode">验证码</param>
        /// <returns>登录验证结果</returns>
        [HttpPost]
        public ActionResult LogOn(string name, string password, string verifyCode)
        {
            if (string.Compare(verifyCode, Convert.ToString(this.Session[SessionVerifyCode]), StringComparison.OrdinalIgnoreCase) != 0)
            {
                return this.Json(VerifyCodeError);
            }

            var rspUser = this.UserService.ValidateUser(name, password);

            if (!rspUser.IsSuccess)
            {
                return this.Json(LogOnValidateError);
            }

            var result = string.Empty;

            if (rspUser.Data == null)
            {
                result = AccountOrPasswordError;
            }
            else if (rspUser.Data.Status != 1)
            {
                result = AccountLocked;
            }
            else
            {
                WebHelper.SetAuthCookie(rspUser.Data.Id, rspUser.Data.Account, rspUser.Data.Name);

                (this.UserService as ServiceSupport)?.AddOperationRecord("用户管理", rspUser.Data.Id, "登录");
            }

            this.Session.Remove(SessionVerifyCode);

            return this.Json(result);
        }

        /// <summary>
        /// 退出。
        /// </summary>
        /// <returns>退出处理</returns>
        public ActionResult LogOff()
        {
            (this.UserService as ServiceSupport)?.AddOperationRecord("用户管理", WebHelper.GetLogOnUserId(), "退出");

            FormsAuthentication.SignOut();

            return this.RedirectToAction("LogOn", "Account");
        }

        /// <summary>
        /// 获取验证码。
        /// </summary>
        /// <returns>验证码图片</returns>
        public ActionResult GetVerifyCode()
        {
            var verifyCode = SecurityExtensions.CreateVerifyCode(4);

            this.Session.Add(SessionVerifyCode, verifyCode);

            var buffers = verifyCode.CreateImage();
            var ms = new MemoryStream(buffers);

            return this.File(ms, "image/jpeg");
        }
    }
}
