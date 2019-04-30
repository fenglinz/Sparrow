using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Autofac;
using Goldensoft.WX.Service.Services;
using Mercurius.Prime.Boot;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace Goldensoft.WX.WebApp
{
    public class Startup : NetCoreStartup
    {
        public Startup(IConfiguration configuration) : base(configuration)
        {
        }

        protected override IEnumerable<Assembly> GetDependencyAssemblies()
        {
            var assemblies = new List<Assembly>();

            assemblies.Add(Assembly.GetExecutingAssembly());
            assemblies.Add(typeof(SysParameterService).Assembly);

            return assemblies;
        }

        protected override void OnConfigure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {

        }

        protected override void OnConfigureServices(IServiceCollection services)
        {

        }
    }
}
