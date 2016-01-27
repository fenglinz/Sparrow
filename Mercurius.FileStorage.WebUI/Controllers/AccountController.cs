using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;

namespace Mercurius.FileStorage.WebUI.Controllers
{
    public class AccountController : Controller
    {
        #region 常量

        private const string SessionVerifyCode = "session_verifyCode";
        
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
        [ValidateAntiForgeryToken]
        public ActionResult LogOn(string account, string password, string verifyCode)
        {
            var isSuccess = true;

            this.ViewBag.Account = account;

            if (string.Compare(verifyCode, Convert.ToString(this.Session[SessionVerifyCode]), StringComparison.OrdinalIgnoreCase) != 0)
            {
                isSuccess = false;
                ModelState.AddModelError("VerifyCode", "验证码不正确！");
            }

            this.Session.Remove(SessionVerifyCode);

            if (!isSuccess)
            {
                return View();
            }

            var rspUser = this.UserService.ValidateUser(account, password);

            if (!rspUser.IsSuccess)
            {
                ModelState.AddModelError("Exception", rspUser.ErrorMessage);
            }
            else if (rspUser.Data == null)
            {
                ModelState.AddModelError("UserName", "账号或密码不正确！");
            }
            else if (rspUser.Data.Status != 1)
            {
                ModelState.AddModelError("UserName", "用户已经被禁用，请联系管理员！");
            }
            else
            {
                WebHelper.SetAuthCookie(rspUser.Data.Id, $"{rspUser.Data.Name}({rspUser.Data.Account})");

                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
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
    }
}