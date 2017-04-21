using System.Linq;
using System.Reflection;
using System.Web.Compilation;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Castle.DynamicProxy;
using Autofac.Extras.DynamicProxy;
using Mercurius.Kernel.Implementations.Core;
using Mercurius.Kernel.Implementations.Storage.WebApi;
using Mercurius.Kernel.WebCores;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.WebApi;
using Mercurius.Prime.Data.IBatisNet;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Sparrow.Autofac
{
    /// <summary>
    /// Autofac配置。
    /// </summary>
    public static class AutofacConfig
    {
        #region 字段

        private static object _locker = new object();

        #endregion

        #region 属性

        /// <summary>
        /// Autofac容器构建器。
        /// </summary>
        public static ContainerBuilder Builder { get; private set; }

        /// <summary>
        /// Autofac容器。
        /// </summary>
        public static IContainer Container { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 初始化Autofac容器。
        /// </summary>
        static AutofacConfig()
        {
            if (Builder == null)
            {
                lock (_locker)
                {
                    Builder = new ContainerBuilder();

                    // 注册IBatisNet配置模块。
                    Builder.RegisterModule<IBatisNetModule>();

                    // 注册缓存。
                    Builder.RegisterType<DefaultCacheProvider>()
                        .As<CacheProvider>()
                        .InstancePerLifetimeScope();
                    //Builder.Register(c => new RedisCacheProvider())
                    //    .As<CacheProvider>()
                    //    .InstancePerLifetimeScope();

                    // 注册Logger。
                    Builder.Register(c => new Logger { Cache = c.Resolve<CacheProvider>(), Persistence = c.Resolve<Persistence>() })
                           .As<ILogger>()
                           .InstancePerLifetimeScope();

                    // 注册拦截器。
                    Builder.RegisterType<ServiceInterceptor>()
                           .PropertiesAutowired()
                           .InstancePerLifetimeScope();

                    Builder.Register(c => new FileStorageClient()).InstancePerLifetimeScope();

                    // 当前执行代码的程序集。
                    var appDomainAssemblies = BuildManager.GetReferencedAssemblies().Cast<Assembly>().ToArray();

                    // Web Api客户端对象。
                    Builder.RegisterAssemblyTypes(appDomainAssemblies)
                           .Where(p => p.IsSubclassOf(typeof(WebApiClientSupport)))
                           .PropertiesAutowired()  // 启用属性注入
                           .SingleInstance();

                    // 注册服务。
                    Builder.RegisterAssemblyTypes(appDomainAssemblies)
                           .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                           .PropertiesAutowired()  // 启用属性注入
                           .AsImplementedInterfaces()
                           .InstancePerLifetimeScope()
                           .EnableInterfaceInterceptors() // 启用接口拦截
                           .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

                    // 注册MVC控制器。
                    Builder.RegisterControllers(appDomainAssemblies)
                           .PropertiesAutowired()
                           .InstancePerRequest();

                    // 注册Model Binder。
                    Builder.RegisterModelBinders(appDomainAssemblies);
                    Builder.RegisterModelBinderProvider();

                    // 注册Web抽象模块。
                    Builder.RegisterModule<AutofacWebTypesModule>();

                    // 注册ViewPage。
                    Builder.RegisterSource(new ViewRegistrationSource());

                    // 启用ActionFilter属性注入。
                    Builder.RegisterFilterProvider();

                    // WebApi注册。
                    Builder.RegisterApiControllers(appDomainAssemblies)
                           .PropertiesAutowired()
                           .InstancePerRequest();

                    Container = Builder.Build();

                    AutofacServiceLocator.Container = Container;
                }
            }
        }

        #endregion
    }
}