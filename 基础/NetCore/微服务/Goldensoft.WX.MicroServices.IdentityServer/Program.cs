
using System.IO;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace Goldensoft.WX.MicroServices.IdentityServer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var webHost = WebHost.CreateDefaultBuilder(args)
                   //.UseKestrel()
                   .UseContentRoot(Directory.GetCurrentDirectory())
                   //.UseIISIntegration()
                   .UseStartup<Startup>()
                   .Build();

            webHost.Run();
        }
    }
}
