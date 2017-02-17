using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Mercurius.Kernel.WebCores.OAuth2
{
    /// <summary>
    /// 基于OAuth2的用户认证服务器提供者。
    /// </summary>
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        /// <summary>
        /// 分配资源拥有者凭证。
        /// </summary>
        /// <param name="context">分配资源拥有者凭证上下文对象</param>
        /// <returns>异步任务</returns>
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

        /// <summary>
        /// 验证客户端凭证。
        /// </summary>
        /// <param name="context">验证客户端凭证上下文对象</param>
        /// <returns></returns>
        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();

            return Task.FromResult(0);
        }

        /// <summary>
        /// 分配刷新令牌。
        /// </summary>
        /// <param name="context">分配刷新令牌的上下文对象</param>
        /// <returns></returns>
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
