using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc;
using System.Web.Routing;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Mercurius.Prime.Boot.Web;

namespace Mercurius.Prime.Boot.Autofac
{
    public abstract class AutofacHttpApplication : HttpApplication
    {
        protected override void OnApplicationStart()
        {
            base.OnApplicationStart();

            // 重置asp.net mvc依赖解析器：使用autofac代替
            DependencyResolver.SetResolver(new AutofacDependencyResolver(ContainerManager.Container));
        }
 
        protected override void ConfigureWebApi(HttpConfiguration config)
        {
            // 将web api依赖解析器替换为autofac
            config.DependencyResolver = new AutofacWebApiDependencyResolver(ContainerManager.Container);
        }

        protected override void ConfigureWebMvc(RouteCollection routes)
        {
            
        }
    }
}
