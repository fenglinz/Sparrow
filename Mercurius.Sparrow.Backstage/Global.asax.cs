using System;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.WebPages;
using Autofac.Integration.Mvc;
using Mercurius.Kernel.WebExtensions;
using Mercurius.Sparrow.Autofac;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// 应用程序启动处理。
    /// </summary>
    public class MvcApplication : HttpApplication
    {
        #region 常量

        private const string ReturnUrlRegexPattern = @"\?ReturnUrl=.*$";

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        protected MvcApplication()
        {
            this.PreSendRequestHeaders += (sender, e) =>
            {
                var redirectUrl = this.Response.RedirectLocation;

                if (string.IsNullOrWhiteSpace(redirectUrl) ||
                    !Regex.IsMatch(redirectUrl, ReturnUrlRegexPattern))
                {
                    return;
                }

                this.Response.RedirectLocation =
                    Regex.Replace(redirectUrl, ReturnUrlRegexPattern, string.Empty);
            };
        }

        #endregion

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
        
        #region 私有方法

        /// <summary>
        /// 移除Web Form视图引擎。
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