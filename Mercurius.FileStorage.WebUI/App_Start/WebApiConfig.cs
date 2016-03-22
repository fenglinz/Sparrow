using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Mercurius.FileStorageSystem
{
    /// <summary>
    /// Web API配置。
    /// </summary>
    public static class WebApiConfig
    {
        /// <summary>
        /// Web API相关设置。
        /// </summary>
        /// <param name="config">HttpServer实例对象</param>
        public static void Register(HttpConfiguration config)
        {
            // 启用路由特性。
            config.MapHttpAttributeRoutes();

            // 允许跨域访问。
            config.EnableCors();

            // 路由规则。
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}