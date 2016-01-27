﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Mercurius.Sparrow.Autofac;

namespace Mercurius.Sparrow.Portal
{
    /// <summary>
    /// 应用程序启动处理。
    /// </summary>
    public class MvcApplication : HttpApplication
    {
        /// <summary>
        /// 应用程序启动。
        /// </summary>
        protected void Application_Start()
        {
            // 移除Web Form视图引擎。
            RemoveWebFormEngines();

            // Asp.Net MVC区域注册.
            AreaRegistration.RegisterAllAreas();
            
            // 过滤器配置.
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            // Asp.Net MVC路由配置.
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            // css/js压缩合并配置.
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // 设置Asp.Net MVC依赖解析。
            DependencyResolver.SetResolver(new AutofacDependencyResolver(AutofacConfig.Container));
        }

        /// <summary>
        /// 移除Web Form视图引擎。
        /// </summary>
        protected void RemoveWebFormEngines()
        {
            var viewEngines = ViewEngines.Engines;
            var webFormEngines = viewEngines.OfType<WebFormViewEngine>().FirstOrDefault();
            if (webFormEngines != null)
            {
                viewEngines.Remove(webFormEngines);
            }
        }
    }
}
