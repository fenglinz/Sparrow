using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Backstage;
using Microsoft.Owin;
using Owin;

[assembly:OwinStartup(typeof(Startup), "Configuration")]
namespace Mercurius.Backstage
{
    /// <summary>
    /// Web应用程序启动配置。
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// SignalR启动配置。
        /// </summary>
        /// <param name="app">app启动对象</param>
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}