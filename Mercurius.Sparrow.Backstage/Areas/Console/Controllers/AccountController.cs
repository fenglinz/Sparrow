using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 控制台管理控制器。
    /// </summary>
    [AllowAnonymous]
    public class AccountController : BaseController
    {
        /// <summary>
        /// 用户登录界面。
        /// </summary>
        /// <returns>视图界面</returns>
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
        public ActionResult LogOn(string account, string password)
        {
            this.ViewBag.Account = account;

            var securityFile = Server.MapPath("~/App_Data/console.dat");

            if (System.IO.File.Exists(securityFile))
            {
                using (var reader = new StreamReader(securityFile))
                {
                    var token = reader.ReadLine();

                    if (!string.IsNullOrWhiteSpace(token))
                    {
                        if (token == $"{account}--->{password}".MD5())
                        {
                            this.Response.SetCookie(new HttpCookie("ConsoleManagerToken", token)
                            {
                                Expires = DateTime.Now.AddMinutes(15)
                            });

                            return RedirectToAction("Index", "Home", new { @Area = "Console" });
                        }
                    }
                }
            }

            if (account == "admin" && password == "admin")
            {
                var token = $"{account}--->{password}".MD5();

                using (var writer = new StreamWriter(securityFile, false, Encoding.UTF8))
                {
                    writer.WriteLine(token);
                }

                this.Response.SetCookie(new HttpCookie("ConsoleManagerToken", token)
                {
                    Expires = DateTime.Now.AddMinutes(15)
                });

                return RedirectToAction("Index", "Home", new { @Area = "Console" });
            }

            ModelState.AddModelError("account", "账号或者密码错误！");

            return View();
        }
    }
}