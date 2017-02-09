using System;
using System.Collections.Concurrent;
using System.Security.Claims;
using System.Threading.Tasks;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Services;
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

            // 自定义OAuth验证提供者实现。
            var oauthProvider = new OAuthAuthorizationServerProvider
            {
                // Web API用户访问权限认证处理。
                OnGrantResourceOwnerCredentials = context =>
                {
                    using (var container = AutofacConfig.Container.BeginLifetimeScope())
                    {
                        var userService = container.Resolve<IUserService>();

                        if (userService != null)
                        {
                            if (context != null)
                            {
                                var account = userService.ValidateAccount(context.UserName, context.Password);

                                if (!account.IsSuccess)
                                {
                                    context.SetError("未知错误", account.ErrorMessage);
                                }
                                else
                                {
                                    if (account.Data == null)
                                    {
                                        context.SetError("无效账号", "登录账号或者密码错误！");
                                    }
                                    else if (account.Data.Status == 2)
                                    {
                                        context.SetError("无效账号", "您的账户已经被管理员禁用！");
                                    }
                                    else
                                    {
                                        var identity = new ClaimsIdentity(context.Options.AuthenticationType);

                                        identity.AddClaim(new Claim(ClaimTypes.Name, $"{account.Data.Id},{account.Data.Account},{account.Data.Account}"));
                                        identity.AddClaim(new Claim("sub", account.Data.Id.ToString()));
                                        identity.AddClaim(new Claim("role", "user"));

                                        context.Validated(identity);
                                        context.Request.Context.Authentication.SignIn(identity);
                                    }
                                }
                            }
                        }

                        return Task.FromResult(0);
                    }
                },

                // 验证客户端访问权限。
                OnValidateClientAuthentication = context =>
                {
                    context.Validated();

                    return Task.FromResult(0);
                }
            };

            var oauthServerOptions = new OAuthAuthorizationServerOptions
            {
                Provider = oauthProvider,
                AllowInsecureHttp = true,
                SystemClock = new SystemClock(),
                ApplicationCanDisplayErrors = true, // 显示错误信息。
                TokenEndpointPath = new PathString("/api/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromDays(365), // 默认Token过期时间为365天
                AuthorizationCodeExpireTimeSpan = TimeSpan.FromDays(365)
            };

            app.UseOAuthAuthorizationServer(oauthServerOptions);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}