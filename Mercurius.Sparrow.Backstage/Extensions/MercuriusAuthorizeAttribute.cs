using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Autofac;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 自定义用户授权特性。
    /// </summary>
    public class MercuriusAuthorizeAttribute : AuthorizeAttribute
    {
        #region 字段

        /// <summary>
        /// 用户信息。
        /// </summary>
        private User _user = null;

        #endregion

        /// <summary>
        /// 重写用户认证。
        /// </summary>
        /// <param name="filterContext">过滤器上下文</param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //this._user = WebHelper.GetFromSession<User>();
            //RecoverySession(filterContext.HttpContext.User);

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
        }

        #region 私有方法

        /// <summary>
        /// 从Session中获取用户信息。
        /// </summary>
        /// <param name="user">用户对象</param>
        private void RecoverySession(IPrincipal user)
        {
            if (user != null && user.Identity.IsAuthenticated)
            {
                if (this._user == null)
                {
                    var registerUserService = AutofacConfig.Container.Resolve<IUserService>();

                    if (registerUserService != null)
                    {
                        var current = registerUserService.GetUser(WebHelper.GetLogOnUserId());

                        if (current.IsSuccess)
                        {
                            WebHelper.AddToSession(current.Data);
                        }
                    }
                }
            }
        }

        #endregion
    }
}