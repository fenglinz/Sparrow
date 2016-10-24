using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Mvc.Extensions;
using static Mercurius.Sparrow.Backstage.Constants;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 控制台管理控制器。
    /// </summary>
    public class AccountController : BaseController
    {
        /// <summary>
        /// 用户登录界面。
        /// </summary>
        /// <returns>视图界面</returns>
        [AllowAnonymous]
        public ActionResult LogOn()
        {
            if (Request.HasConsoleRight())
            {
                return RedirectToAction("Index", "Home", new { @Area = "Console" });
            }

            this.ViewBag.Type = this.Request.QueryString["type"];

            return View();
        }

        /// <summary>
        /// 用户登录。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns>登录结果</returns>
        [HttpPost]
        [AllowAnonymous]
        public ActionResult LogOn(string account, string password)
        {
            this.ViewBag.Account = account;

            if (System.IO.File.Exists(ConsoleManagerStoragePath))
            {
                using (var reader = new StreamReader(ConsoleManagerStoragePath))
                {
                    var token = reader.ReadLine();

                    if (!string.IsNullOrWhiteSpace(token))
                    {
                        if (token == GenerateConsoleManagerToken(password))
                        {
                            this.Response.SetCookie(new HttpCookie(ConsoleManagerToken, token)
                            {
                                Expires = DateTime.Now.AddMinutes(ConsoleManagerTokenExpires)
                            });

                            return RedirectToAction("Index", "Home", new { @Area = "Console" });
                        }
                        else
                        {
                            ModelState.AddModelError("account", "账号或者密码错误！");

                            return View();
                        }
                    }
                }
            }

            if (account == ConsoleManagerAccount && password == ConsoleManagerDefaultPassword)
            {
                var token = GenerateConsoleManagerToken(password);

                using (var writer = new StreamWriter(ConsoleManagerStoragePath, false, Encoding.UTF8))
                {
                    writer.WriteLine(token);
                }

                this.Response.SetCookie(new HttpCookie(ConsoleManagerToken, token)
                {
                    Expires = DateTime.Now.AddMinutes(ConsoleManagerTokenExpires)
                });

                return RedirectToAction("Index", "Home", new { @Area = "Console" });
            }

            ModelState.AddModelError("account", "账号或者密码错误！");

            return View();
        }

        #region 修改密码

        /// <summary>
        /// 显示修改密码界面。
        /// </summary>
        /// <param name="type">消息类型</param>
        /// <returns>UI界面</returns>
        public ActionResult ChangePassword(string type = "")
        {
            if (!string.IsNullOrWhiteSpace(type))
            {
                this.ViewBag.Message = "密码修改成功！";
            }

            return View();
        }

        /// <summary>
        /// 修改控制台管理员密码。
        /// </summary>
        /// <param name="oldPassword">旧密码</param>
        /// <param name="newPassword">新密码</param>
        /// <param name="confirmPassword">确认密码</param>
        /// <returns>显示结果</returns>
        [HttpPost]
        public ActionResult ChangePassword(string oldPassword, string newPassword, string confirmPassword)
        {
            if (newPassword != confirmPassword)
            {
                this.ViewBag.Message = "确认密码和新密码不一致！";

                return View();
            }

            using (var reader = new StreamReader(ConsoleManagerStoragePath, Encoding.UTF8))
            {
                var token = reader.ReadLine();
                var oldToken = GenerateConsoleManagerToken(oldPassword);

                if (token != oldToken)
                {
                    this.ViewBag.Message = "旧密码不正确！";

                    return View();
                }
            }

            using (var writer = new StreamWriter(ConsoleManagerStoragePath, false, Encoding.UTF8))
            {
                var newToken = GenerateConsoleManagerToken(newPassword);

                writer.WriteLine(newToken);

                this.Response.SetCookie(new HttpCookie(ConsoleManagerToken, newToken)
                {
                    Expires = DateTime.Now.AddMinutes(ConsoleManagerTokenExpires)
                });

                this.ViewBag.Message = "修改成功！";

                return RedirectToAction("ChangePassword", new { type = 1 });
            }
        }

        #endregion

        /// <summary>
        /// 退出登录。
        /// </summary>
        /// <returns>退出结果</returns>
        public ActionResult LogOff()
        {
            var cookie = this.Request.Cookies[ConsoleManagerToken];

            if (cookie != null)
            {
                cookie.Expires = DateTime.Now;
                this.Response.SetCookie(cookie);
            }

            return RedirectToAction("LogOn", "Account", new { @Area = "Console" });
        }
    }
}