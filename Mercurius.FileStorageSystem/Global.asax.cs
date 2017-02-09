using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Mercurius.Sparrow.Autofac;

namespace Mercurius.FileStorageSystem
{
    /// <summary>
    /// 应用程序公共请求处理。
    /// </summary>
    public class MvcApplication : HttpApplication
    {
        /// <summary>
        /// 应用程序启动处理。
        /// </summary>
        protected void Application_Start()
        {
            // 移除Web Form视图引擎。
            RemoveWebFormEngines();

            // Web API配置
            GlobalConfiguration.Configure(WebApiConfig.Register);

            // Web API文档工具配置。
            GlobalConfiguration.Configure(SwaggerConfig.Register);

            // Asp.Net MVC区域注册.
            AreaRegistration.RegisterAllAreas();

            // Asp.Net MVC过滤器配置.
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            // Asp.Net MVC路由配置.
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            // css/js压缩合并配置.
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // 设置Asp.Net MVC依赖解析。
            DependencyResolver.SetResolver(new AutofacDependencyResolver(AutofacConfig.Container));
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

        #endregion
    }
}
