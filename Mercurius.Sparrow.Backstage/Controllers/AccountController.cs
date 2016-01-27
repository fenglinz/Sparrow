using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.Core;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 账户信息处理控制器。
    /// </summary>
    public class AccountController : BaseController
    {
        #region 常量

        private const string SessionVerifyCode = "session_verifyCode";

        /// <summary>
        /// 验证码错误。
        /// </summary>
        private const string VerifyCodeError = "1";

        /// <summary>
        /// 账号或密码错误。
        /// </summary>
        private const string AccountOrPasswordError = "2";

        /// <summary>
        /// 账户被锁。
        /// </summary>
        private const string AccountLocked = "3";

        /// <summary>
        /// 用户已经登录。
        /// </summary>
        private const string AccountAlreadyLogOn = "4";

        /// <summary>
        /// 登录成功。
        /// </summary>
        private const string LogOnSuccess = "5";

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置用户服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        #endregion

        /// <summary>
        /// 登录。
        /// </summary>
        /// <returns></returns>
        public ActionResult LogOn()
        {
            return this.View();
        }

        [HttpPost]
        public ActionResult LogOn(string name, string password, string verifyCode)
        {
            var result = string.Empty;

            if (string.Compare(verifyCode, Convert.ToString(this.Session[SessionVerifyCode]), StringComparison.OrdinalIgnoreCase) != 0)
            {
                result = VerifyCodeError;

                return this.Json(result);
            }

            var rspUser = this.UserService.ValidateUser(name, password);

            if (!rspUser.IsSuccess)
            {
                return this.Json(result);
            }

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
                result = LogOnSuccess;
                WebHelper.SetAuthCookie(
                    rspUser.Data.Id,
                    $"{rspUser.Data.Name}({rspUser.Data.Account})");

                this.DynamicQuery.Create(new OperationRecord
                {
                    BusinessId = rspUser.Data.Id,
                    BusinessType = "用户登录/登出",
                    UserId = WebHelper.GetLogOnUserId(),
                    RecordDateTime = DateTime.Now,
                    RecordContent = $"于({WebHelper.GetClientIPAddress()})登录"
                });
            }

            this.Session.Remove(SessionVerifyCode);

            return this.Json(result);
        }

        public ActionResult LogOff()
        {
            this.DynamicQuery.Create(new OperationRecord
            {
                BusinessId = WebHelper.GetLogOnUserId(),
                BusinessType = "用户登录/登出",
				UserId = WebHelper.GetLogOnUserId(),
				RecordDateTime = DateTime.Now,
                RecordContent = $"于({WebHelper.GetClientIPAddress()})登出"
            });

            FormsAuthentication.SignOut();

            return this.RedirectToAction("LogOn", "Account");
        }

        public ActionResult GetVerifyCode()
        {
            var verifyCode = SecurityExtensions.CreateVerifyCode(4);

            this.Session.Add(SessionVerifyCode, verifyCode);

            var buffers = verifyCode.CreateImage();
            var ms = new MemoryStream(buffers);

            return this.File(ms, "image/jpeg");
        }

        public ActionResult ChangeLanguage(string language, string returnUrl)
        {
            var cookie = new HttpCookie("language", language) { Expires = DateTime.Now.AddDays(30) };

            this.Response.SetCookie(cookie);

            return this.Redirect(returnUrl);
        }
    }
}
