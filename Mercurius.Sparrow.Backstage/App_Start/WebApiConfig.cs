using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// Web API配置。
    /// </summary>
    public static class WebApiConfig
    {
        /// <summary>
        /// Web API路由注册。
        /// </summary>
        /// <param name="config">配置对象</param>
        public static void Register(HttpConfiguration config)
        {
            // 启用路由特性。
            config.MapHttpAttributeRoutes();

            // 允许跨域访问。
            config.EnableCors();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional });
        }
    }
}
