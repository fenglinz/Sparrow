using System.Web.Http;
using Autofac.Integration.WebApi;
using Mercurius.Sparrow.Autofac;

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

            // Web Api路由。
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional });

            // 依赖解析切换成基于Autofac。
            config.DependencyResolver = new AutofacWebApiDependencyResolver(AutofacConfig.Container);

            AutofacConfig.Builder.RegisterWebApiFilterProvider(config);

            // 添加过滤器。
            config.Filters.Add(new AuthorizeAttribute());
        }
    }
}