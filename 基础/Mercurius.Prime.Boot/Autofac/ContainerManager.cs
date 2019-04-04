using System;
using System.Linq;
using System.Reflection;
using System.Web.Compilation;
using System.Web.Http;
using Autofac;
using Autofac.Builder;
using Autofac.Core;
using Autofac.Extras.DynamicProxy;
using Autofac.Features.Scanning;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Boot.Autofac.Interceptor;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Service;

namespace Mercurius.Prime.Boot.Autofac
{
    /// <summary>
    /// Autofac容器管理器。
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
        public static void Initialize(bool onWebEnvironment = true)
        {
            lock (_locker)
            {
                if (Container == null)
                {
                    Builder = new ContainerBuilder();

                    // 注册缓存。
                    Builder.RegisterType<DefaultCacheProvider>().As<CacheProvider>().InstancePerLifetimeScope();

                    // 注册动态查询
                    Builder.RegisterType<Persistence>().InstancePerLifetimeScope().OnActivated(p =>
                        {
                            if (p.Instance.CommandTextBuilder != null)
                            {
                                using (var scope = LifetimeScope)
                                {
                                    p.Instance.CommandTextBuilder.Logger = scope.Resolve<AbstractLogger>();
                                }
                            }
                        });

                    // 注册Logger。
                    Builder.Register(c => new NLogLogger()).As<AbstractLogger>().InstancePerLifetimeScope();

                    // 当前执行代码的程序集。
                    var appDomainAssemblies = onWebEnvironment ? BuildManager.GetReferencedAssemblies().Cast<Assembly>().ToArray() : AppDomain.CurrentDomain.GetAssemblies();

                    // 注册服务拦截器。
                    Builder.RegisterType<ServiceInterceptor>().PropertiesAutowired().InstancePerLifetimeScope();

                    // 注册服务。
                    Builder.RegisterAssemblyTypes(appDomainAssemblies)
                                    .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                                    .PropertiesAutowired() // 启用属性注入
                                    .InstancePerLifetimeScope()
                                    .EnableClassInterceptors() // 启用类拦截
                                    .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

                    if (onWebEnvironment)
                    {
                        // 注册web api控制器拦截器。
                        Builder.Register(c => new LoggingActionFilter(c.Resolve<AbstractLogger>()))
                               .AsWebApiActionFilterFor<ApiController>()
                               .InstancePerRequest();

                        // 注册MVC控制器。
                        Builder.RegisterControllers(appDomainAssemblies).PropertiesAutowired().InstancePerRequest();

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
                               .InstancePerRequest().OnActivated(c =>
                               {

                               });

                        // 注册web api过滤器提供者
                        Builder.RegisterWebApiFilterProvider(GlobalConfiguration.Configuration);

                        // 注册web api模型绑定者
                        Builder.RegisterWebApiModelBinderProvider();
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
