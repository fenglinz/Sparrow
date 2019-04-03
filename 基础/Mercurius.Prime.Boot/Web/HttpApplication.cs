using System;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc;
using System.Web.Routing;
using Mercurius.Prime.Core.Configuration;

namespace Mercurius.Prime.Boot.Web
{
    /// <summary>
    /// 自定义asp.net应用程序启动类。
    /// </summary>
    public abstract class HttpApplication : System.Web.HttpApplication
    {
        /// <summary>
        /// 应用程序启动处理
        /// </summary>
        protected void Application_Start()
        {
            // 移除WebForm视图引擎
            this.RemoveWebFormEngines();

            // 执行扩展
            this.OnApplicationStart();

            // web api配置
            GlobalConfiguration.Configure(this.WebApiConfiguration);

            // swagger配置
            GlobalConfiguration.Configure(SwaggerConfig.Register);

            // 注册区域
            AreaRegistration.RegisterAllAreas();

            // 添加错误处理过滤器
            GlobalFilters.Filters.Add(new HandleErrorAttribute());

            // web mvc配置
            this.MvcConfiguration(RouteTable.Routes);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var path = HttpContext.Current.Request.Path;

            if (path == PlatformSection.Instance.Swagger.Path)
            {
                HttpContext.Current.Response.Redirect("~/swagger/ui/index", true);
            }
        }

        #region Protected Methods

        /// <summary>
        /// 应用程序启动扩展
        /// </summary>
        protected virtual void OnApplicationStart()
        {
        }

        /// <summary>
        /// web api配置
        /// </summary>
        /// <param name="config">配置信息</param>
        protected abstract void ConfigureWebApi(HttpConfiguration config);

        /// <summary>
        /// web mvc配置
        /// </summary>
        /// <param name="routes">路由表</param>
        protected abstract void ConfigureWebMvc(RouteCollection routes);

        #endregion

        #region Private Methods

        /// <summary>
        /// 移除WebForm视图引擎。
        /// </summary>
        private void RemoveWebFormEngines()
        {
            var viewEngines = ViewEngines.Engines;
            var webFormEngines = viewEngines.OfType<WebFormViewEngine>().FirstOrDefault();

            if (webFormEngines != null)
            {
                viewEngines.Remove(webFormEngines);
            }
        }

        /// <summary>
        /// WebApi默认配置。
        /// </summary>
        /// <param name="config">配置信息</param>
        private void WebApiConfiguration(HttpConfiguration config)
        {
            // 启用特性路由
            config.MapHttpAttributeRoutes();

            // 启用跨域访问
            config.EnableCors(new EnableCorsAttribute("*", "*", "*"));

            // 默认路由
            config.Routes.MapHttpRoute("DefaultApi", "api/{controller}/{id}", new
            {
                id = RouteParameter.Optional
            });

            // 扩展配置
            this.ConfigureWebApi(config);
        }

        /// <summary>
        /// web mvc默认配置
        /// </summary>
        /// <param name="routes">路由表</param>
        private void MvcConfiguration(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute("Default", "{controller}/{action}/{id}", new
            {
                controller = "Home",
                action = "Index",
                id = UrlParameter.Optional
            });

            // 扩展配置
            this.ConfigureWebMvc(routes);
        }

        #endregion
    }
}
