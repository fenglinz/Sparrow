using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Mercurius.Prime.Boot.Autofac;

namespace Mercurius.Architecture.WebUI
{
    public class MvcApplication : AutofacHttpApplication
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="routes"></param>
        protected override void ConfigureWebMvc(RouteCollection routes)
        {
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
