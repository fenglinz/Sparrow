﻿using System;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Configuration;
using System.Web.Http;
using Mercurius.FileStorage.WebUI;
using Mercurius.Infrastructure;
using Swashbuckle.Application;

namespace Mercurius.FileStorage.WebUI
{
    /// <summary>
    /// Swagger UI配置。
    /// </summary>
    public class SwaggerConfig
    {
        /// <summary>
        /// Swagger UI设置。
        /// </summary>
        /// <param name="httpConfig">HttpServer对象</param>
        public static void Register(HttpConfiguration httpConfig)
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;

            httpConfig.EnableSwagger(c =>
            {
                c.Schemes(new[] { "http", "https" });
                c.SingleApiVersion("v1", "Web API 帮助中心");
                c.IncludeXmlComments(GetXmlCommentsPath());
                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
            })
            .EnableSwaggerUi(c =>
            {
                c.DisableValidator();
                c.DocExpansion(DocExpansion.List);
                c.EnableDiscoveryUrlSelector();
            });
        }

        private static string GetXmlCommentsPath() => $@"{AppDomain.CurrentDomain.BaseDirectory}\bin\WebApiDocument.XML";
    }
}
