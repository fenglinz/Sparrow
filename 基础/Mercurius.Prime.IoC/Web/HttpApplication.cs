using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.SessionState;

namespace Mercurius.Prime.Boot.Web
{
    public abstract class HttpApplication : System.Web.HttpApplication
    {
        /// <summary>
        /// 应用程序启动时执行的方法。
        /// </summary>
        protected void Application_Start()
        {
            // 移除asp.net mvc的web form引擎
            RemoveWebFormEngines();

            // 应用程序启动处理
            this.OnApplicationStart();

            // web api配置
            GlobalConfiguration.Configure(WebApiConfiguration);

            // 集成swagger ui
            GlobalConfiguration.Configure(SwaggerConfig.Register);

            // asp.net mvc区域注册
            AreaRegistration.RegisterAllAreas();

            // asp.net mvc全局过滤器配置
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            // asp.net mvc路由配置
            MvcConfiguration(RouteTable.Routes);
        }

        protected abstract void ConfigureWebApi(HttpConfiguration config);

        protected abstract void ConfigureWebMvc(RouteCollection routes);

        protected virtual void OnApplicationStart()
        {
        }

        #region 私有方法

        /// <summary>
        /// 移除Web Form视图引擎
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

        private void WebApiConfiguration(HttpConfiguration config)
        {
            // Web API 路由
            config.MapHttpAttributeRoutes();

            // Web API跨域访问设置
            config.EnableCors(new EnableCorsAttribute("*", "*", "*"));

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            this.ConfigureWebApi(config);
        }

        private void MvcConfiguration(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            this.ConfigureWebMvc(routes);
        }

        #endregion
    }
}