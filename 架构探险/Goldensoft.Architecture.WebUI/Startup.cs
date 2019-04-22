using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercurius.Prime.Boot;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Goldensoft.Architecture.WebUI
{
    public class Startup : NetCoreStartup
    {
        public Startup(IConfiguration configuration) : base(configuration)
        {
        }

        protected override void OnConfigure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {

        }

        protected override void OnConfigureServices(IServiceCollection services)
        {

        }
    }
}
