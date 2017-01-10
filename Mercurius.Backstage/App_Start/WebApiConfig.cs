using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Mercurius.Backstage
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
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional });
        }
    }
}
