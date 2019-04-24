using System.IO;
using Autofac;
using Mercurius.Prime.Boot.Autofac;
using Mercurius.Prime.Core.Configuration;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Serialization;
using Swashbuckle.AspNetCore.Swagger;

namespace Mercurius.Prime.Boot
{
    /// <summary>
    /// Net Core通用启动类
    /// </summary>
    public abstract class NetCoreStartup
    {
        #region Properties

        /// <summary>
        /// 配置信息对象
        /// </summary>
        public IConfiguration Configuration { get; private set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="configuration">配置信息</param>
        public NetCoreStartup(IConfiguration configuration)
        {
            Configuration = configuration;

            PlatformConfig.Initialize(configuration);
        }

        #endregion

        /// <summary>
        /// 配置net core服务
        /// </summary>
        /// <param name="services">服务集合</param>
        public void ConfigureServices(IServiceCollection services)
        {
            // 配置cookie规则
            services.Configure<CookiePolicyOptions>(options =>
            {
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            // 替换默认依赖注入框架
            services.Replace(ServiceDescriptor.Transient<IControllerActivator, ServiceBasedControllerActivator>());

            // 添加跨域访问支持
            services.AddCors(options => options.AddPolicy("AllowAllOrigin",
                builder => builder.AllowAnyOrigin() // 允许所有请求主机
                                  .AllowAnyMethod() // 允许所有请求方式
                                  .AllowCredentials() // 允许处理cookie 
                )
            );

            // 添加mvc支持
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
                             .AddJsonOptions(options =>
                                // JSON首字母小写解决
                                options.SerializerSettings.ContractResolver = new DefaultContractResolver()
                             );

            // 添加swagger支持
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Info
                {
                    Version = "v1",
                    Title = PlatformConfig.Instance.Swagger?.Title,
                    Description = PlatformConfig.Instance.Swagger?.Description
                });

                // 设置swagger文档位置  
                var xmlPath = Path.Combine(Directory.GetCurrentDirectory(), "docs.xml");

                options.IncludeXmlComments(xmlPath);
            });

            // 调用自定义扩展
            this.OnConfigureServices(services);
        }

        /// <summary>
        /// net core http请求处理配置
        /// </summary>
        /// <param name="app">应用程序构建器</param>
        /// <param name="env">主机环境信息</param>
        /// <param name="loggerFactory">日志工厂</param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            // 使用静态资源服务
            app.UseStaticFiles();

            // 使用cookie策略
            app.UseCookiePolicy();

            // 使用跨域访问
            app.UseCors("AllowAllOrigin");

            // 使用mvc
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.DocumentTitle = PlatformConfig.Instance.Swagger?.Title;
                c.SwaggerEndpoint("/swagger/v1/swagger.json", PlatformConfig.Instance.Swagger?.Description);
            });

            //Log.Logger = new SerilogLogger().Logger;

            //loggerFactory.AddSerilog();

            this.OnConfigure(app, env, loggerFactory);
        }

        /// <summary>
        /// 配置autofac容器。
        /// </summary>
        /// <param name="builder">autofac容器对象</param>
        public void ConfigureContainer(ContainerBuilder builder)
        {
            builder.RegisterModule(new AutofacModule());
        }

        /// <summary>
        /// 扩展ConfigureServices：在此方法中添加更多的服务配置
        /// </summary>
        /// <param name="services">服务配置集合</param>
        protected abstract void OnConfigureServices(IServiceCollection services);

        /// <summary>
        /// 扩展启动配置
        /// </summary>
        /// <param name="app">用用程序创建对象</param>
        /// <param name="env">寄宿环境对象</param>
        /// <param name="loggerFactory">日志对象</param>
        protected abstract void OnConfigure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory);
    }
}
