using System.IO;
using Autofac;
using Mercurius.Prime.Boot.Autofac;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Core.Log;
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
using Serilog;
using Swashbuckle.AspNetCore.Swagger;

namespace Mercurius.Prime.Boot
{
    public abstract class NetCoreStartup
    {
        #region Properties

        public IConfiguration Configuration { get; private set; }

        #endregion

        public NetCoreStartup(IConfiguration configuration)
        {
            Configuration = configuration;

            PlatformConfig.Initialize(configuration);
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.Replace(ServiceDescriptor.Transient<IControllerActivator, ServiceBasedControllerActivator>());

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
                             .AddJsonOptions(options =>
                                // JSON首字母小写解决
                                options.SerializerSettings.ContractResolver = new DefaultContractResolver()
            );

            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Info
                {
                    Version = "v1",
                    Title = PlatformConfig.Instance.Swagger?.Title
                });

                //Set the comments path for the swagger json and ui.  
                var xmlPath = Path.Combine(Directory.GetCurrentDirectory(), "docs.xml");
                options.IncludeXmlComments(xmlPath);
            });

            this.OnConfigureServices(services);
        }

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

            app.UseStaticFiles();
            app.UseCookiePolicy();

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

            Log.Logger = new SerilogLogger().Logger;

            loggerFactory.AddSerilog();

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
        protected abstract void  OnConfigureServices(IServiceCollection services);

        /// <summary>
        /// 扩展启动配置
        /// </summary>
        /// <param name="app">用用程序创建对象</param>
        /// <param name="env">寄宿环境对象</param>
        /// <param name="loggerFactory">日志对象</param>
        protected abstract void OnConfigure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory);

    }
}
