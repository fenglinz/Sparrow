using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using Autofac;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.WebApi;

namespace Mercurius.Sparrow.Portal.Attributes
{
    /// <summary>
    /// 
    /// </summary>
    public class ApiAuthorizeAttribute : AuthorizeAttribute
    {
        /// <summary>
        /// 重写 Web Api 权限验证
        /// </summary>
        /// <param name="actionContext"></param>
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            //获取当前请求的路由地址
            var route = actionContext.ControllerContext.RouteData.Route.RouteTemplate;

            if (!IsAuthorized(actionContext))
            {
                HandleUnauthorizedRequest(actionContext);
            }

            var power = ApiAuthHelper.Current.HasPower(route);

            if (!power.IsSuccess)
            {
                HandleUnauthorizedRequest(actionContext);
            }
        }

        /// <summary>
        /// WebApi权限验证帮助类
        /// </summary>
        public class ApiAuthHelper
        {
            #region WebApi权限验证

            /// <summary>
            /// Web Api用户
            /// </summary>
            private IUserService UserService { get; set; }

            /// <summary>
            /// 构造函数
            /// </summary>
            public ApiAuthHelper()
            {
                UserService = AutofacConfig.Container.Resolve<IUserService>();
            }

            /// <summary>
            /// LogicHelper 对象
            /// </summary>
            private static readonly ApiAuthHelper AuthInstance = null;

            /// <summary>
            /// 单例模式
            /// </summary>
            public static ApiAuthHelper Current => AuthInstance ?? new ApiAuthHelper();

            /// <summary>
            /// 权限验证
            /// </summary>
            /// <param name="route"></param>
            /// <returns></returns>
            public Response HasPower(string route)
            {
                return UserService.HasPower(route);
            }

            #endregion
        }
    }
}