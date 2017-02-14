using System;
using Mercurius.Kernel.WebCores.OAuth2;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Backstage;
using Microsoft.Owin;
using Microsoft.Owin.Infrastructure;
using Microsoft.Owin.Security.OAuth;
using Owin;

[assembly: OwinStartup(typeof(Startup))]
namespace Mercurius.Sparrow.Backstage
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
            app.UseAutofacMiddleware(AutofacConfig.Container);
            
            var oauthServerOptions = new OAuthAuthorizationServerOptions
            {
                Provider = new AuthorizationServerProvider(),
                RefreshTokenProvider = new RefreshTokenProvider(),
                AllowInsecureHttp = true,
                SystemClock = new SystemClock(),
                ApplicationCanDisplayErrors = true, // 显示错误信息。
                TokenEndpointPath = new PathString("/api/token"),
                AuthorizeEndpointPath = new PathString("/OAuth/Authorize"),
                AccessTokenExpireTimeSpan = TimeSpan.FromDays(365), // 默认Token过期时间为365天
                AuthorizationCodeExpireTimeSpan = TimeSpan.FromDays(365)
            };

            app.UseOAuthAuthorizationServer(oauthServerOptions);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}