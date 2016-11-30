using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// 应用程序入口类。
    /// </summary>
    public class Startup
    {
        #region 属性

        /// <summary>
        /// 配置信息根节点。
        /// </summary>
        public IConfigurationRoot Configuration { get; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 应用程序初始化设置。
        /// </summary>
        /// <param name="env">寄宿服务器环境变量</param>
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();

            if (env.IsDevelopment())
            {
                // This will push telemetry data through Application Insights pipeline faster, 
                // allowing you to view results immediately.
                builder.AddApplicationInsightsSettings(developerMode: true);
            }

            Configuration = builder.Build();
        }

        #endregion

        /// <summary>
        /// 向Ioc容器中添加服务(本方法由运行时调用)。
        /// </summary>
        /// <param name="services">服务集合</param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddApplicationInsightsTelemetry(Configuration);

            services.AddMvc();
        }

        /// <summary>
        /// 配置Http请求管道(本方法由运行时调用)。
        /// </summary>
        /// <param name="app">应用程序生成器(用于配置应用程序请求管道)</param>
        /// <param name="env">寄宿服务器环境变量</param>
        /// <param name="loggerFactory">日志记录类工厂</param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            app.UseApplicationInsightsRequestTelemetry();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseApplicationInsightsExceptionTelemetry();

            app.UseStaticFiles();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }

    }
}
