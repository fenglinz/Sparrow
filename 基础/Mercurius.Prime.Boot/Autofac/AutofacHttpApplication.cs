using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Boot.Web;

namespace Mercurius.Prime.Boot.Autofac
{
    /// <summary>
    /// 基于autofac的asp.net应用程序启动类
    /// </summary>
    public abstract class AutofacHttpApplication : HttpApplication
    {
        /// <summary>
        /// 应用程序启动设置。
        /// </summary>
        protected override void OnApplicationStart()
        {
            base.OnApplicationStart();

            // Autofac容器初始化
            ContainerManager.Initialize();

            // 使用Autofac替换Asp.Net MVC默认依赖解析器
            DependencyResolver.SetResolver(new AutofacDependencyResolver(ContainerManager.Container));
        }

        /// <summary>
        /// web api配置
        /// </summary>
        /// <param name="config">http配置信息</param>
        protected override void ConfigureWebApi(HttpConfiguration config)
        {
            // autofac容器初始化
            ContainerManager.Initialize();

            // 使用Autofac替换Asp.Net Web Api默认依赖解析器
            config.DependencyResolver = new AutofacWebApiDependencyResolver(ContainerManager.Container);
        }
    }
}
