using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using System.Reflection;
using Autofac;
using Mercurius.Kernel.WebCores.Filters;
using Mercurius.Sparrow.Autofac;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 自定义用户授权特性。
    /// </summary>
    public class MercuriusAuthorizeAttribute : AuthorizeAttribute
    {
        /// <summary>
        /// 重写用户认证。
        /// </summary>
        /// <param name="filterContext">过滤器上下文</param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var urlReferrer = filterContext.HttpContext.Request.UrlReferrer;

            if (urlReferrer != null && (urlReferrer.AbsolutePath.Contains("/api/")))
            {
                filterContext.HttpContext.Response.ContentType = "application/json";
                filterContext.HttpContext.Response.Write("{ msg: 'Web Api Token验证无效或无访问权限！' }");
                filterContext.HttpContext.Response.End();
            }

            var area = filterContext.RouteData.DataTokens?["area"];

            if (Convert.ToString(area) == "Console")
            {
                return;
            }

            if (filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true) ||
                filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true))
            {
                return;
            }

            var loginUrl = FormsAuthentication.LoginUrl;

            if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                filterContext.HttpContext.Response.Redirect(loginUrl, true);
            }
            else if (filterContext.ActionDescriptor.GetType().GetCustomAttributes<IgnorePermissionValidAttribute>() == null)
            {
                using (var context = AutofacConfig.Container.BeginLifetimeScope())
                {
                    var permissionService = context.Resolve<IPermissionService>();
                    var currentUrl = filterContext.HttpContext.Request.GetCurrentNavigateUrl();
                    var systemMenus = permissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

                    if (!systemMenus.HasData() || systemMenus.Datas.All(d => string.CompareOrdinal(d.NavigateUrl, currentUrl) != 0))
                    {
                        filterContext.HttpContext.Response.Write($"<b>无权限访问该页面({currentUrl})！</b>");
                        filterContext.HttpContext.Response.End();
                    }
                }
            }
        }
    }
}