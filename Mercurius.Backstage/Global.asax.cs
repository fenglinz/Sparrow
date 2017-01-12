using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Dispatcher;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Mercurius.Backstage.Autofac;
using Mercurius.Backstage.Plugins;

namespace Mercurius.Backstage
{
    /// <summary>
    /// 
    /// </summary>
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            ControllerBuilder.Current.SetControllerFactory(new PluginControllerFactory());

            PluginManager.RegisterPluginAreas();
            AreaRegistration.RegisterAllAreas();

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            RouteConfig.RegisterRoutes(RouteTable.Routes);

            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // 设置Asp.Net MVC依赖解析。
            DependencyResolver.SetResolver(new AutofacDependencyResolver(AutofacConfig.Container));
        }
    }
}
