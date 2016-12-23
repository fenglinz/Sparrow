using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Mercurius.Backstage.Autofac;
using Mercurius.Backstage.Extensions;

// 插件注册。
[assembly: PreApplicationStartMethod(typeof(PluginManager), "RegisterPlugins")]

namespace Mercurius.Backstage
{
    /// <summary>
    /// 
    /// </summary>
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            if (PluginManager.Routes != null)
            {
                foreach (var route in PluginManager.Routes)
                {
                    RouteTable.Routes.Add(route);
                }
            }

            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // 设置Asp.Net MVC依赖解析。
            DependencyResolver.SetResolver(new AutofacDependencyResolver(AutofacConfig.Container));

        }
    }
}
