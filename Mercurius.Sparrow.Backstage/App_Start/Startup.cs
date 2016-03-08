using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Sparrow.Backstage;
using Microsoft.Owin;
using Owin;

[assembly:OwinStartup(typeof(Startup), "Configuration")]
namespace Mercurius.Sparrow.Backstage
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}