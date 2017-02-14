using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Mercurius.Kernel.WebCores.OAuth2
{
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            using (var container = AutofacServiceLocator.Container.BeginLifetimeScope())
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
                                identity.AddClaim(new Claim(ClaimTypes.Role, "WebApi"));
                                identity.AddClaim(new Claim("sub", account.Data.Id.ToString()));

                                context.Validated(identity);
                                context.Request.Context.Authentication.SignIn(identity);
                            }
                        }
                    }
                }

                return Task.FromResult(0);
            }
        }

        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();

            return Task.FromResult(0);
        }

        public override Task GrantRefreshToken(OAuthGrantRefreshTokenContext context)
        {
            var newIdentity = new ClaimsIdentity(context.Ticket.Identity);
            var newClaim = newIdentity.Claims.Where(c => c.Type == "newClaim").FirstOrDefault();

            if (newClaim != null)
            {
                newIdentity.RemoveClaim(newClaim);
            }

            newIdentity.AddClaim(new Claim("newClaim", "newValue"));

            var newTicket = new AuthenticationTicket(newIdentity, context.Ticket.Properties);

            context.Validated(newTicket);

            return Task.FromResult(0);
        }
    }
}
