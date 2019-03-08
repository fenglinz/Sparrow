using System;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc;
using System.Web.Routing;

namespace Mercurius.Prime.Boot.Web
{
	public abstract class HttpApplication : System.Web.HttpApplication
	{
		protected void Application_Start()
		{
			this.RemoveWebFormEngines();
			this.OnApplicationStart();
			GlobalConfiguration.Configure(new Action<HttpConfiguration>(this.WebApiConfiguration));
			GlobalConfiguration.Configure(new Action<HttpConfiguration>(SwaggerConfig.Register));
			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			this.MvcConfiguration(RouteTable.Routes);
		}

		// Token: 0x06000010 RID: 16
		protected abstract void ConfigureWebApi(HttpConfiguration config);

		// Token: 0x06000011 RID: 17
		protected abstract void ConfigureWebMvc(RouteCollection routes);

		// Token: 0x06000012 RID: 18 RVA: 0x00002349 File Offset: 0x00000549
		protected virtual void OnApplicationStart()
		{
		}

		// Token: 0x06000013 RID: 19 RVA: 0x0000234C File Offset: 0x0000054C
		private void RemoveWebFormEngines()
		{
			ViewEngineCollection viewEngines = ViewEngines.Engines;
			WebFormViewEngine webFormEngines = viewEngines.OfType<WebFormViewEngine>().FirstOrDefault<WebFormViewEngine>();
			bool flag = webFormEngines != null;
			if (flag)
			{
				viewEngines.Remove(webFormEngines);
			}
		}

		// Token: 0x06000014 RID: 20 RVA: 0x00002380 File Offset: 0x00000580
		private void WebApiConfiguration(HttpConfiguration config)
		{
			config.MapHttpAttributeRoutes();
			config.EnableCors(new EnableCorsAttribute("*", "*", "*"));
			config.Routes.MapHttpRoute("DefaultApi", "api/{controller}/{id}", new
			{
				id = RouteParameter.Optional
			});
			this.ConfigureWebApi(config);
		}

		// Token: 0x06000015 RID: 21 RVA: 0x000023D8 File Offset: 0x000005D8
		private void MvcConfiguration(RouteCollection routes)
		{
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
			routes.MapRoute("Default", "{controller}/{action}/{id}", new
			{
				controller = "Home",
				action = "Index",
				id = UrlParameter.Optional
			});
			this.ConfigureWebMvc(routes);
		}
	}
}
