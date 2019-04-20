using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Description;
using Mercurius.Prime.Core.Configuration;
using Swagger.Net;
using Swagger.Net.Application;

namespace Mercurius.Prime.Boot.Web
{
    /// <summary>
    /// Swagger UI设置
    /// </summary>
    public class SwaggerConfig
    {
        /// <summary>
        /// 配置Swagger
        /// </summary>
        /// <param name="configuration">http配置信息</param>
        public static void Register(HttpConfiguration configuration)
        {
            var thisAssembly = typeof(SwaggerConfig).Assembly;

            configuration.EnableSwagger(c =>
            {
                c.SingleApiVersion("v1", PlatformSection.Instance.Swagger.Description);
                c.AccessControlAllowOrigin("*");
                c.IncludeXmlComments(AppDomain.CurrentDomain.BaseDirectory + "\\bin\\docs.xml");
                c.IgnoreIsSpecifiedMembers();
                c.DescribeAllEnumsAsStrings(false);
            }).EnableSwaggerUi(c =>
            {
                c.ShowExtensions(true);
                c.SetValidatorUrl("https://online.swagger.io/validator");
                c.UImaxDisplayedTags(100);
                c.UIfilter("''");
                c.DocumentTitle(PlatformSection.Instance.Swagger.Title);
                c.DocExpansion(DocExpansion.Full);
            });
        }

        public static bool ResolveVersionSupportByRouteConstraint(ApiDescription apiDesc, string targetApiVersion)
        {
            return apiDesc.Route.RouteTemplate.ToLower().Contains(targetApiVersion.ToLower());
        }

        private class ApplyDocumentVendorExtensions : IDocumentFilter
        {
            public void Apply(SwaggerDocument swaggerDoc, SchemaRegistry schemaRegistry, IApiExplorer apiExplorer)
            {
            }
        }

        public class AssignOAuth2SecurityRequirements : IOperationFilter
        {
            public void Apply(Operation operation, SchemaRegistry schemaRegistry, ApiDescription apiDescription)
            {
                var scopes = (from filterInfo in apiDescription.ActionDescriptor.GetFilterPipeline()
                              select filterInfo.Instance).OfType<AuthorizeAttribute>().SelectMany((AuthorizeAttribute attr) => attr.Roles.Split(new char[]
                              {
                                ','
                              })).Distinct();

                if (scopes.Any())
                {
                    if (operation.security == null)
                    {
                        operation.security = new List<IDictionary<string, IEnumerable<string>>>();
                    }

                    var oAuthRequirements = new Dictionary<string, IEnumerable<string>>
                    {
                        {
                            "oauth2",
                            scopes
                        }
                    };

                    operation.security.Add(oAuthRequirements);
                }
            }
        }

        private class ApplySchemaVendorExtensions : ISchemaFilter
        {
            public void Apply(Schema schema, SchemaRegistry schemaRegistry, Type type)
            {
                if (schema.properties != null)
                {
                    foreach (var p in schema.properties)
                    {
                        var format = p.Value.format;
                        var text = format;

                        if (text != null)
                        {
                            if (!(text == "int32"))
                            {
                                if (text == "double")
                                {
                                    p.Value.example = 9858.216;
                                }
                            }
                            else
                            {
                                p.Value.example = 123;
                            }
                        }
                    }
                }
            }
        }
    }
}
