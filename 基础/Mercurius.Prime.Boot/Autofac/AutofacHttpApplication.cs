using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Boot.Web;

namespace Mercurius.Prime.Boot.Autofac
{
	// Token: 0x02000009 RID: 9
	public abstract class AutofacHttpApplication : HttpApplication
	{
		// Token: 0x0600003C RID: 60 RVA: 0x00002C3E File Offset: 0x00000E3E
		protected override void OnApplicationStart()
		{
			base.OnApplicationStart();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(ContainerManager.Container));
		}

		// Token: 0x0600003D RID: 61 RVA: 0x00002C58 File Offset: 0x00000E58
		protected override void ConfigureWebApi(HttpConfiguration config)
		{
			config.DependencyResolver = new AutofacWebApiDependencyResolver(ContainerManager.Container);
		}

		// Token: 0x0600003E RID: 62 RVA: 0x00002C6C File Offset: 0x00000E6C
		protected override void ConfigureWebMvc(RouteCollection routes)
		{
		}
	}
}
