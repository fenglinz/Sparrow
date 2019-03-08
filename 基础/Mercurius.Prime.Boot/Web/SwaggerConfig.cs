using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Filters;
using Swagger.Net;
using Swagger.Net.Application;

namespace Mercurius.Prime.Boot.Web
{
	// Token: 0x02000008 RID: 8
	public class SwaggerConfig
	{
		// Token: 0x06000039 RID: 57 RVA: 0x00002BA0 File Offset: 0x00000DA0
		public static void Register(HttpConfiguration configuration)
		{
			Assembly thisAssembly = typeof(SwaggerConfig).Assembly;
			configuration.EnableSwagger(delegate(SwaggerDocsConfig c)
			{
				c.SingleApiVersion("v1", "传世数据层接口文档");
				c.AccessControlAllowOrigin("*");
				c.IncludeXmlComments(AppDomain.CurrentDomain.BaseDirectory + "\\bin\\docs.xml");
				c.IgnoreIsSpecifiedMembers();
				c.DescribeAllEnumsAsStrings(false);
			}).EnableSwaggerUi(delegate(SwaggerUiConfig c)
			{
				c.ShowExtensions(true);
				c.SetValidatorUrl("https://online.swagger.io/validator");
				c.UImaxDisplayedTags(100);
				c.UIfilter("''");
				c.DocumentTitle("传世数据层 | Swagger UI文档");
			});
		}

		// Token: 0x0600003A RID: 58 RVA: 0x00002C08 File Offset: 0x00000E08
		public static bool ResolveVersionSupportByRouteConstraint(ApiDescription apiDesc, string targetApiVersion)
		{
			return apiDesc.Route.RouteTemplate.ToLower().Contains(targetApiVersion.ToLower());
		}

		// Token: 0x0200000D RID: 13
		private class ApplyDocumentVendorExtensions : IDocumentFilter
		{
			// Token: 0x06000053 RID: 83 RVA: 0x000038B7 File Offset: 0x00001AB7
			public void Apply(SwaggerDocument swaggerDoc, SchemaRegistry schemaRegistry, IApiExplorer apiExplorer)
			{
			}
		}

		// Token: 0x0200000E RID: 14
		public class AssignOAuth2SecurityRequirements : IOperationFilter
		{
			// Token: 0x06000055 RID: 85 RVA: 0x000038C4 File Offset: 0x00001AC4
			public void Apply(Operation operation, SchemaRegistry schemaRegistry, ApiDescription apiDescription)
			{
				IEnumerable<string> scopes = (from filterInfo in apiDescription.ActionDescriptor.GetFilterPipeline()
				select filterInfo.Instance).OfType<AuthorizeAttribute>().SelectMany((AuthorizeAttribute attr) => attr.Roles.Split(new char[]
				{
					','
				})).Distinct<string>();
				bool flag = scopes.Any<string>();
				if (flag)
				{
					bool flag2 = operation.security == null;
					if (flag2)
					{
						operation.security = new List<IDictionary<string, IEnumerable<string>>>();
					}
					Dictionary<string, IEnumerable<string>> oAuthRequirements = new Dictionary<string, IEnumerable<string>>
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

		// Token: 0x0200000F RID: 15
		private class ApplySchemaVendorExtensions : ISchemaFilter
		{
			// Token: 0x06000057 RID: 87 RVA: 0x00003980 File Offset: 0x00001B80
			public void Apply(Schema schema, SchemaRegistry schemaRegistry, Type type)
			{
				bool flag = schema.properties != null;
				if (flag)
				{
					foreach (KeyValuePair<string, Schema> p in schema.properties)
					{
						string format = p.Value.format;
						string text = format;
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
