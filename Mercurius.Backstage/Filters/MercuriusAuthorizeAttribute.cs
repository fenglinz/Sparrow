using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Autofac;
using Castle.Core.Internal;
using Mercurius.Backstage.Autofac;
using Mercurius.Core.Interfaces.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Web.Filters;

namespace Mercurius.Backstage.Filters
{
    /// <summary>
    /// 自定义用户授权特性。
    /// </summary>
    public class MercuriusAuthorizeAttribute : AuthorizeAttribute
    {
        #region 常量

        private static readonly IPermissionService _permissionService;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static MercuriusAuthorizeAttribute()
        {
            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                _permissionService = context.Resolve<IPermissionService>();
            }
        }

        #endregion

        /// <summary>
        /// 重写用户认证。
        /// </summary>
        /// <param name="filterContext">过滤器上下文</param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
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
            else if (filterContext.ActionDescriptor.GetAttribute<IgnorePermissionValidAttribute>() == null)
            {
                var currentUrl = filterContext.HttpContext.Request.GetCurrentNavigateUrl();
                var systemMenus = _permissionService.GetAccessibleMenus(WebHelper.GetLogOnUserId());

                if (!systemMenus.HasData() || systemMenus.Datas.All(d => string.CompareOrdinal(d.NavigateUrl, currentUrl) != 0))
                {
                    filterContext.HttpContext.Response.Write($"<b>无权限访问该页面({currentUrl})！</b>");
                    filterContext.HttpContext.Response.End();
                }
            }
        }
    }
}