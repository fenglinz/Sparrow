using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace Mercurius.Prime.Boot
{
    public class Bootstrapper
    {
        #region Fields

        private IWebHost webHost;

        #endregion

        public Bootstrapper()
        {
            // 注册编码提供程序
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        }

        public void Run<T>(string[] args) where T : NetCoreStartup
        {
            this.webHost = WebHost.CreateDefaultBuilder(args)
                   //.UseKestrel()
                   .UseContentRoot(Directory.GetCurrentDirectory())
                   //.UseIISIntegration()
                   .UseStartup<T>()
                   .Build();

            this.webHost.Run();
        }
    }
}
