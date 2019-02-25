using System;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web.Compilation;
using System.Web.Http;
using Autofac;
using Autofac.Core;
using Autofac.Extras.DynamicProxy;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Parser.Builder;
using Mercurius.Prime.Data.Service;
using Mercurius.Prime.Boot.Autofac.Interceptor;
using Mercurius.Prime.Core.Configuration;

namespace Mercurius.Prime.Boot.Autofac
{
    /// <summary>
    /// Autofac管理类
    /// </summary>
    public static class ContainerManager
    {
        #region 字段

        private static readonly object _locker = new object();

        private static IContainer _container;

        #endregion

        #region 属性

        /// <summary>
        /// 是否处于Web环境中.
        /// </summary>
        public static bool IsOnWebEnvironment { get; set; } = true;

        /// <summary>
        /// 向autofac容器注册组件的回调
        /// </summary>
        public static Action<ContainerBuilder> RegisterAction;

        /// <summary>
        /// Autofac容器。
        /// </summary>
        public static IContainer Container
        {
            get
            {
                lock (_locker)
                {
                    if (_container == null)
                    {
                        var builder = new ContainerBuilder();

                        // 注册缓存。
                        builder.RegisterType<DefaultCacheProvider>()
                            .As<CacheProvider>()
                            .InstancePerLifetimeScope();

                        // 注册持久化对象
                        builder.RegisterType<Persistence>()
                               .PropertiesAutowired()
                               .OnActivated(p =>
                               {
                                   if (p.Instance.CommandTextBuilder != null)
                                   {
                                       using (var scope = LifetimeScope)
                                       {
                                           p.Instance.CommandTextBuilder.Logger = scope.GetObject<AbstractLogger>();
                                       }
                                   }
                               })
                               .InstancePerLifetimeScope();

                        // 注册Logger。
                        builder.Register(c => new NLogLogger())
                            .As<AbstractLogger>()
                            .InstancePerLifetimeScope();

                        // 注册web api控制器拦截器。
                        builder.Register(c => new LoggingActionFilter(c.Resolve<AbstractLogger>()))
                            .AsWebApiActionFilterFor<ApiController>()
                            .InstancePerRequest();

                        // 当前执行代码的程序集。
                        var appDomainAssemblies = IsOnWebEnvironment ? BuildManager.GetReferencedAssemblies().Cast<Assembly>().ToArray() : AppDomain.CurrentDomain.GetAssemblies();

                        // 注册服务拦截器。
                        builder.RegisterType<ServiceInterceptor>()
                            .PropertiesAutowired()
                            .InstancePerLifetimeScope();

                        // 注册服务。
                        builder.RegisterAssemblyTypes(appDomainAssemblies)
                            .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                            .PropertiesAutowired() // 启用属性注入
                            .AsImplementedInterfaces()
                            .InstancePerLifetimeScope()
                            .EnableInterfaceInterceptors() // 启用接口拦截
                            .InterceptedBy(typeof(ServiceInterceptor)); // 设置连接器

                        // 注册MVC控制器。
                        builder.RegisterControllers(appDomainAssemblies)
                            .PropertiesAutowired()
                            .InstancePerRequest();

                        // 注册Model Binder。
                        builder.RegisterModelBinders(appDomainAssemblies);
                        builder.RegisterModelBinderProvider();

                        // 注册Web抽象模块。
                        builder.RegisterModule<AutofacWebTypesModule>();

                        // 注册ViewPage。
                        builder.RegisterSource(new ViewRegistrationSource());

                        // 启用ActionFilter属性注入。
                        builder.RegisterFilterProvider();

                        // WebApi注册。
                        builder.RegisterApiControllers(appDomainAssemblies)
                            .OnActivated(c =>
                            {

                            })
                            .PropertiesAutowired()
                            .InstancePerRequest();

                        // 注册web api过滤器提供者
                        builder.RegisterWebApiFilterProvider(GlobalConfiguration.Configuration);

                        // 注册web api模型绑定者
                        builder.RegisterWebApiModelBinderProvider();

                        // 设置回调
                        RegisterAction?.Invoke(builder);

                        _container = builder.Build();
                    }

                    return _container;
                }
            }
        }

        #endregion

        #region 公开方法

        public static ILifetimeScope LifetimeScope => Container.BeginLifetimeScope();

        public static T GetObject<T>(this ILifetimeScope scope, params Parameter[] parameters)
        {
            return scope.Resolve<T>(parameters);
        }

        public static T GetObject<T>(this ILifetimeScope scope, string serviceName)
        {
            return scope.ResolveNamed<T>(serviceName);
        }

        #endregion
    }
}
