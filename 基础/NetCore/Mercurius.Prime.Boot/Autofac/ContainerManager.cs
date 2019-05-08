using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Autofac;
using Autofac.Extras.DynamicProxy;
using Mercurius.Prime.Boot.Autofac.Interceptor;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Service;
using Microsoft.AspNetCore.Mvc;

namespace Mercurius.Prime.Boot.Autofac
{
    /// <summary>
    /// autofac容器管理
    /// </summary>
    public static class ContainerManager
    {
        #region Fields

        private static readonly object _locker = new object();

        #endregion

        #region Properties

        /// <summary>
        /// 容器对象.
        /// </summary>
        public static IContainer Container { get; private set; }

        /// <summary>
        /// Autofac容器构建器。
        /// </summary>
        public static ContainerBuilder Builder { get; private set; }

        public static ILifetimeScope LifetimeScope
        {
            get => Container?.BeginLifetimeScope();
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 初始化Autofac容器。
        /// </summary>
        public static void Initialize(Action<ContainerBuilder> callback = null, params Assembly[] assemblies)
        {
            lock (_locker)
            {
                if (Container == null)
                {
                    Builder = new ContainerBuilder();

                    callback?.Invoke(Builder);

                    // 注册缓存。
                    Builder.RegisterType<DefaultCacheProvider>().As<CacheProvider>().InstancePerLifetimeScope();

                    // 注册缓存客户端
                    Builder.Register(c => new RedisClient()).SingleInstance();

                    // 注册动态查询
                    Builder.RegisterType<Persistence>().InstancePerLifetimeScope().OnActivated(p =>
                    {
                        if (p.Instance.CommandTextBuilder != null && PlatformConfig.Instance.Log?.Type != null)
                        {
                            using (var scope = LifetimeScope)
                            {
                                p.Instance.CommandTextBuilder.Logger = scope.ResolveKeyed<AbstractLogger>(PlatformConfig.Instance.Log.Type);
                            }
                        }
                    });

                    // 注册Logger。
                    Builder.Register(c => new NLogLogger()).Named<AbstractLogger>("file").InstancePerLifetimeScope();
                    Builder.Register(c => new SerilogLogger()).Named<AbstractLogger>("ecsearch").InstancePerLifetimeScope();

                    // 注册服务拦截器。
                    Builder.RegisterType<ServiceInterceptor>().PropertiesAutowired().InstancePerLifetimeScope();

                    if (!assemblies.IsEmpty())
                    {
                        // 注册服务。
                        Builder.RegisterAssemblyTypes(assemblies)
                                        .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                                        .PropertiesAutowired() // 启用属性注入
                                        .InstancePerLifetimeScope()
                                        .EnableClassInterceptors() // 启用类拦截
                                        .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

                        // 注册MVC控制器。
                        Builder.RegisterAssemblyTypes(assemblies)
                                        .Where(p => p.IsSubclassOf(typeof(ControllerBase)))
                                        .PropertiesAutowired() // 启用属性注入
                                        .InstancePerLifetimeScope();
                    }

                    Container = Builder.Build();
                }
            }
        }

        /// <summary>
        /// 获取autofac容器中的对象.
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="scope">容器生命周期管理器对象</param>
        /// <returns>对象</returns>

        public static T GetObject<T>(this ILifetimeScope scope)
        {
            return scope.Resolve<T>();
        }

        #endregion
    }
}
