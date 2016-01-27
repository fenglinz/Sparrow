using System.Linq;
using System.Reflection;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Infrastructure.Cache;
using Mercurius.Infrastructure.Log;
using Mercurius.Siskin.Repositories;
using Mercurius.Siskin.Repositories.Core;
using Mercurius.Siskin.Services.Support;

namespace Mercurius.Siskin.Autofac
{
    /// <summary>
    /// Autofac配置。
    /// </summary>
    public static class AutofacConfig
    {
        #region 字段

        private static ContainerBuilder _builder;
        private static object _locker = new object();

        #endregion

        #region 属性

        public static IContainer Container { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 初始化Autofac容器。
        /// </summary>
        static AutofacConfig()
        {
            if (_builder == null)
            {
                lock (_locker)
                {
                    _builder = new ContainerBuilder();

                    // 注册IBatisNet配置模块。
                    _builder.RegisterModule<IBatisNetModule>();

                    // 注册缓存。
                    _builder.RegisterType<DefaultCacheProvider>()
                        .As<ICacheProvider>()
                        .InstancePerLifetimeScope();
                    //_builder.Register(c => new RedisCacheProvider("127.0.0.1"))
                    //    .As<ICacheProvider>()
                    //    .InstancePerLifetimeScope();

                    // 注册Logger。
                    _builder.Register(c => new Logger { Cache = c.Resolve<ICacheProvider>(), SqlMapperManager = c.Resolve<SqlMapperManager>() })
                        .As<ILogger>()
                        .InstancePerLifetimeScope();

                    // 注册服务。
                    _builder.RegisterAssemblyTypes(typeof(ServiceSupport).Assembly)
                             .Where(p => p.IsSubclassOf(typeof(ServiceSupport)))
                             .PropertiesAutowired()  // 启用属性注入
                             .AsImplementedInterfaces()
                             .InstancePerLifetimeScope();

                    // 注册MVC控制器。
                    _builder.RegisterControllers(typeof(AutofacConfig).Assembly)
                        .PropertiesAutowired()
                        .InstancePerRequest();

                    // 注册Model Binder。
                    _builder.RegisterModelBinders(Assembly.GetExecutingAssembly());
                    _builder.RegisterModelBinderProvider();

                    // 注册Web抽象模块。
                    _builder.RegisterModule<AutofacWebTypesModule>();

                    // 注册ViewPage。
                    _builder.RegisterSource(new ViewRegistrationSource());

                    // 启用ActionFilter属性注入。
                    _builder.RegisterFilterProvider();

                    // WebApi注册。
                    _builder.RegisterApiControllers(typeof(AutofacConfig).Assembly)
                        .PropertiesAutowired()
                        .InstancePerRequest();

                    Container = _builder.Build();
                }
            }
        }

        #endregion
    }
}