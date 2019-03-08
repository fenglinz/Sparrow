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
    // Token: 0x0200000A RID: 10
    public static class ContainerManager
    {
        #region 字段

        private static readonly object _locker = new object();

        #endregion

        #region 属性

        public static bool IsOnWebEnvironment { get; set; } = true;

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
        static ContainerManager()
        {
            if (Builder == null)
            {
                lock (_locker)
                {
                    Builder = new ContainerBuilder();

                    // 注册缓存。
                    Builder.RegisterType<DefaultCacheProvider>()
                        .As<CacheProvider>()
                        .InstancePerLifetimeScope();

                    //Builder.Register(c => new DefaultCacheProvider())
                    //    .As<CacheProvider>()
                    //    .InstancePerLifetimeScope();

                    // 注册动态查询
                    Builder.RegisterType<Persistence>()
                        .OnActivated(p =>
                        {
                            var flag3 = p.Instance.CommandTextBuilder != null;

                            if (flag3)
                            {
                                using (var scope = ContainerManager.LifetimeScope)
                                {
                                    p.Instance.CommandTextBuilder.Logger = scope.Resolve<AbstractLogger>();
                                }
                            }
                        })
                        .InstancePerLifetimeScope();

                    // 注册Logger。
                    Builder.Register(c => new NLogLogger())
                        .As<AbstractLogger>()
                        .InstancePerLifetimeScope();

                    // 注册web api控制器拦截器。
                    Builder.Register(c => new LoggingActionFilter(c.Resolve<AbstractLogger>()))
                        .AsWebApiActionFilterFor<ApiController>()
                        .InstancePerRequest();

                    // 当前执行代码的程序集。
                    var appDomainAssemblies = BuildManager.GetReferencedAssemblies().Cast<Assembly>().ToArray();

                    // 注册服务拦截器。
                    Builder.RegisterType<ServiceInterceptor>()
                        .PropertiesAutowired()
                        .InstancePerLifetimeScope();

                    // 注册服务。
                    Builder.RegisterAssemblyTypes(appDomainAssemblies)
                        .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                        .PropertiesAutowired() // 启用属性注入
                        .AsImplementedInterfaces()
                        .InstancePerLifetimeScope()
                        .EnableInterfaceInterceptors() // 启用接口拦截
                        .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

                    if (IsOnWebEnvironment)
                    {



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
                            .OnActivated(c =>
                            {

                            })
                            .PropertiesAutowired()
                            .InstancePerRequest();

                        // 注册web api过滤器提供者
                        Builder.RegisterWebApiFilterProvider(GlobalConfiguration.Configuration);

                        // 注册web api模型绑定者
                        Builder.RegisterWebApiModelBinderProvider();
                    }

                    Container = Builder.Build();
                }
            }
        }

        #endregion

        #region 属性

        public static ILifetimeScope LifetimeScope
        {
            get => Container?.BeginLifetimeScope();
        }

        public static T GetObject<T>(this ILifetimeScope scope)
        {
            return scope.Resolve<T>();
        }

        #endregion
    }
}
