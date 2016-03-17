using System;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;
using Autofac;
using Autofac.Integration.WebApi;
using Mercurius.FileStorage.WebUI;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.WebApi;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Infrastructure;
using Microsoft.Owin.Security.OAuth;
using Owin;

[assembly: OwinStartup(typeof(Startup))]
namespace Mercurius.FileStorage.WebUI
{
    /// <summary>
    /// Web API启动配置。
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// Web API配置。
        /// </summary>
        /// <param name="app">应用程序启动对象</param>
        public void Configuration(IAppBuilder app)
        {
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
                TokenEndpointPath = new PathString("/api/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromDays(365), // 默认Token过期时间为365天
                AuthorizationCodeExpireTimeSpan = TimeSpan.FromDays(365)
            };

            app.UseOAuthAuthorizationServer(oauthServerOptions);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());

            var config = new HttpConfiguration
            {
                DependencyResolver = new AutofacWebApiDependencyResolver(AutofacConfig.Container)
            };

            // Web Api配置。
            WebApiConfig.Register(config);

            app.UseWebApi(config);
            app.UseAutofacWebApi(config);
            app.UseCors(CorsOptions.AllowAll);
        }
    }
}