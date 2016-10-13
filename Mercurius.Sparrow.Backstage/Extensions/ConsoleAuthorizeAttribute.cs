using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 管理控制台权限认证。
    /// </summary>
    public class ConsoleAuthorizeAttribute : AuthorizeAttribute
    {
        /// <summary>
        /// 重写认证。
        /// </summary>
        /// <param name="filterContext">过滤器上下文</param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var area = filterContext.RouteData.DataTokens?["area"];

            if (Convert.ToString(area) != "Console")
            {
                return;
            }

            if (filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true) ||
                filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true))
            {
                return;
            }

            var valid = false;
            var request = filterContext.HttpContext.Request;
            var token = request.Cookies["ConsoleManagerToken"]?.Value;

            var securityData = request.RequestContext.HttpContext.Server.MapPath("~/App_Data/console.dat");

            if (!string.IsNullOrWhiteSpace(token) && File.Exists(securityData))
            {
                using (var reader = new StreamReader(securityData))
                {
                    var accountToken = reader.ReadLine();

                    valid = accountToken == token;
                }
            }

            if (!valid)
            {
                filterContext.HttpContext.Response.Redirect("~/Console/Account/LogOn?type=1", true);
            }
        }
    }
}