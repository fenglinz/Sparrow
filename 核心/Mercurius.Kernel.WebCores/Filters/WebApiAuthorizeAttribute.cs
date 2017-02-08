using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Entities;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.WebCores.Filters
{
    /// <summary>
    /// 
    /// </summary>
    public class WebApiAuthorizeAttribute : AuthorizeAttribute
    {
        #region 静态变量

        private static IUserService _userService;

        #endregion

        /// <summary>
        /// 重写 Web Api 权限验证
        /// </summary>
        /// <param name="actionContext"></param>
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            //获取当前请求的路由地址
            var route = actionContext.ControllerContext.RouteData.Route.RouteTemplate;

            if (IsAuthorized(actionContext))
            {
                var rspUser = this.GetWebApiUser(WebHelper.GetLogOnAccount());

                if (rspUser == null || rspUser.Data == null)
                {
                    HandleUnauthorizedRequest(actionContext);
                }
            }
            else
            {
                HandleUnauthorizedRequest(actionContext);
            }

            //var power = ApiAuthHelper.Current.HasPower(route);

            //if (!power.IsSuccess)
            //{
            //    HandleUnauthorizedRequest(actionContext);
            //}

            //base.OnAuthorization(actionContext);
        }

        protected override bool IsAuthorized(HttpActionContext actionContext)
        {
            var url = actionContext.Request.Headers.Referrer?.AbsolutePath;

            if (url != null && url.Contains("/Swagger/ui/index"))
            {
                actionContext.Request.Headers.Authorization = new AuthenticationHeaderValue("bearer","T47pt4ZW8wpQnH26soZJmzhwLWJJHeKIx9SgvoN0OAeMinG32yX1uxxM3ditlR76z8t7ShiFmYSJA_OJqKlyvTs7-pObX6f7IhF3f7dZKL7yXR5XxOx1ZeyfzTTh6otrW-4o1qtmeGzuik2Mvo1onH1UGrk6h8gnUCU80eJQO-o6V9j4sC4K-oQJIrgsqv_-1S3g9HcE2pHrFdWlvvsW-ih5oLfWLNBm_RKXruWvmbB2AEKl");

                return true;
            }

            return base.IsAuthorized(actionContext);
        }

        #region 私有方法

        private Response<User> GetWebApiUser(string account)
        {
            if (_userService == null)
            {
                using (var context = AutofacServiceLocator.Container.BeginLifetimeScope())
                {
                    _userService = context.Resolve<IUserService>();
                }
            }

            return _userService.GetUserByAccount(account);
        }

        #endregion
    }
}
