using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using Autofac;
using Autofac.Extras.DynamicProxy;
using Mercurius.Prime.Boot.Autofac.Interceptor;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyModel;
using AModule = Autofac.Module;

namespace Mercurius.Prime.Boot.Autofac
{
    /// <summary>
    /// Autofac容器管理器。
    /// </summary>
    public class AutofacModule : AModule
    {
        #region Fields

        private static readonly object _locker = new object();

        #endregion

        #region Public Methods

        protected override void Load(ContainerBuilder builder)
        {
            // 注册缓存。
            //Builder.RegisterType<DefaultCacheProvider>().As<CacheProvider>().InstancePerLifetimeScope();

            // 注册动态查询
            builder.RegisterType<Persistence>().InstancePerLifetimeScope().OnActivated(p =>
            {
                if (p.Instance.CommandTextBuilder != null)
                {
                    p.Instance.CommandTextBuilder.Logger = new SerilogLogger();
                }
            });

            // 注册Logger。
            builder.Register(c => new NLogLogger()).Named<AbstractLogger>("file").InstancePerLifetimeScope();
            builder.Register(c => new SerilogLogger()).Named<AbstractLogger>("ecsearch").InstancePerLifetimeScope();

            // 当前执行代码的程序集。
            var appDomainAssemblies = AppDomain.CurrentDomain.GetAssemblies();

            // 注册服务拦截器。
            builder.RegisterType<ServiceInterceptor>().PropertiesAutowired().InstancePerLifetimeScope();

            // 注册服务。
            builder.RegisterAssemblyTypes(appDomainAssemblies)
                            .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                            .PropertiesAutowired() // 启用属性注入
                            .InstancePerLifetimeScope()
                            .EnableClassInterceptors() // 启用类拦截
                            .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

            // 注册MVC控制器。
            builder.RegisterAssemblyTypes(appDomainAssemblies)
                            .Where(p => p.IsSubclassOf(typeof(ControllerBase)))
                            .PropertiesAutowired() // 启用属性注入
                            .InstancePerLifetimeScope();
        }

        #endregion
    }
}
