﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using Mercurius.Prime.Boot.Autofac;
using Mercurius.Prime.Core.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Serialization;
using NLog.Extensions.Logging;
using Serilog;
using Serilog.Exceptions;
using Serilog.Sinks.Elasticsearch;
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

        /// <summary>
        /// 应用程序IoC容器
        /// </summary>
        public IContainer ApplicationContainer { get; private set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="configuration">配置信息</param>
        public NetCoreStartup(IConfiguration configuration)
        {
            Configuration = configuration;

            PlatformSection.Initialize(configuration);

            if (string.CompareOrdinal(PlatformSection.Instance.Log?.Type, "ecsearch") == 0)
            {
                Log.Logger = new LoggerConfiguration()
                   .Enrich.FromLogContext()
                   .Enrich.WithExceptionDetails()
                   .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri(PlatformSection.Instance.Log.ElasticSearchUrl))
                   {
                       AutoRegisterTemplate = true,
                   }).CreateLogger();
            }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 配置net core服务
        /// </summary>
        /// <param name="services">服务集合</param>
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            // 替换默认依赖注入框架
            services.Replace(ServiceDescriptor.Transient<IControllerActivator, ServiceBasedControllerActivator>());

            services.AddAuthorization(options =>
            {
                options.AddPolicy("Client", policy => policy.RequireRole("Client").Build());
                options.AddPolicy("Admin", policy => policy.RequireRole("Admin").Build());
                options.AddPolicy("SystemOrAdmin", policy => policy.RequireRole("Admin", "System"));
            });

            // 认证处理
            services.AddAuthentication(x =>
            {
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = PlatformSection.Instance.OAuth?.Issuer,
                    ValidAudience = "wr",
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(PlatformSection.Instance.OAuth?.IssuerKey))
                };

                options.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            context.Response.Headers.Add("Token-Expired", "true");
                        }

                        return Task.CompletedTask;
                    }
                };
            });

            // 配置cookie规则
            services.Configure<CookiePolicyOptions>(options =>
            {
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            // 添加跨域访问支持
            services.AddCors(options => options.AddPolicy("AllowAllOrigin",
                corsBuilder => corsBuilder.AllowAnyOrigin() // 允许所有请求主机
                    .AllowAnyMethod() // 允许所有请求方式
                    .AllowAnyHeader()
                    .AllowCredentials() // 允许处理cookie 
                )
            );

            // 添加mvc支持
            services.AddMvc(options =>
            {
            })
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
            .AddJsonOptions(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";

                // JSON首字母小写解决
                options.SerializerSettings.ContractResolver = new DefaultContractResolver();
            })
            .AddControllersAsServices();

            // 添加swagger支持
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Info
                {
                    Version = "v1",
                    Title = PlatformSection.Instance.Swagger?.Title,
                    Description = PlatformSection.Instance.Swagger?.Description
                });

                options.AddSecurityDefinition("Bearer", new ApiKeyScheme
                {
                    In = "header",
                    Description = "认证信息格式为：Bearer+空格+access token值",
                    Name = "Authorization",
                    Type = "apiKey"
                });
                options.AddSecurityRequirement(new Dictionary<string, IEnumerable<string>> {
                    { "Bearer", Enumerable.Empty<string>() }
                });

                // 设置swagger文档位置  
                var xmlPath = Path.Combine(Directory.GetCurrentDirectory(), "docs.xml");

                options.IncludeXmlComments(xmlPath);
            });

            // autofac初始化
            ContainerManager.Initialize(build => build.Populate(services), this.GetDependencyAssemblies()?.ToArray());

            this.ApplicationContainer = ContainerManager.Container;

            // 调用自定义扩展
            this.OnConfigureServices(services);

            return new AutofacServiceProvider(ContainerManager.Container);
        }

        /// <summary>
        /// net core http请求处理配置
        /// </summary>
        /// <param name="app">应用程序构建器</param>
        /// <param name="env">主机环境信息</param>
        /// <param name="loggerFactory">日志工厂</param>
        public void Configure(IApplicationBuilder app,
            IHostingEnvironment env,
            ILoggerFactory loggerFactory,
            IApplicationLifetime appLifetime)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            // 日志处理
            if (string.CompareOrdinal(PlatformSection.Instance.Log?.Type, "ecsearch") == 0)
            {
                loggerFactory.AddSerilog();
            }
            else
            {
                loggerFactory.AddNLog();
            }

            // 文件缓存时间
            var cachePeriod = env.IsDevelopment() ? "600" : "604800";

            if (!Directory.Exists($"{env.ContentRootPath}/uploads"))
            {
                Directory.CreateDirectory($"{env.ContentRootPath}/uploads");
            }

            // 使用静态资源服务
            app.UseStaticFiles();
            app.UseStaticFiles(new StaticFileOptions
            {
                FileProvider = new PhysicalFileProvider(Path.Combine(Environment.CurrentDirectory, PlatformSection.Instance.SavedUploadFilesRoot)),
                RequestPath = "/uploads",
                OnPrepareResponse = ctx =>
                {
                    ctx.Context.Response.Headers.Append("Cache-Control", $"public, max-age={cachePeriod}");
                }
            });

            // 使用cookie策略
            app.UseCookiePolicy();

            // 使用跨域访问
            app.UseCors("AllowAllOrigin");

            // 使用权限认证
            app.UseAuthentication();

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
                c.DocumentTitle = PlatformSection.Instance.Swagger?.Title;
                c.SwaggerEndpoint("/swagger/v1/swagger.json", PlatformSection.Instance.Swagger?.Description);
            });

            this.OnConfigure(app, env, loggerFactory);
        }

        #endregion

        #region Abstract Methods

        /// <summary>
        /// 获取参与依赖注入的程序集.
        /// </summary>
        /// <returns>程序集集合</returns>
        protected abstract IEnumerable<Assembly> GetDependencyAssemblies();

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

        #endregion
    }
}
