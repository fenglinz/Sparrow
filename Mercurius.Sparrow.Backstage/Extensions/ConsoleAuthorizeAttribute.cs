using System;
using System.Collections.Generic;
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

            var token = filterContext.HttpContext.Request.Headers["ConsoleManagerToken"];

            if (token == null)
            {
                filterContext.HttpContext.Response.Redirect("~/Console/Account/LogOn", true);

                filterContext.HttpContext.Response.Write("<b>无权限访问该页面！</b>");
                filterContext.HttpContext.Response.End();
            }
        }
    }
}