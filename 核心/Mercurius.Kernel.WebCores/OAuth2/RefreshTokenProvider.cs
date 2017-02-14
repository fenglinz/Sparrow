using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Mercurius.Prime.Core;
using Microsoft.Owin.Security.Infrastructure;

namespace Mercurius.Kernel.WebCores.OAuth2
{
    /// <summary>
    /// 刷新令牌提供者。
    /// </summary>
    public class RefreshTokenProvider : IAuthenticationTokenProvider
    {
        #region IAuthenticationTokenProvider接口实现

        /// <summary>
        /// 同步创建刷新令牌。
        /// </summary>
        /// <param name="context">用户认证令牌创建上下文对象</param>
        public void Create(AuthenticationTokenCreateContext context)
        {
        }

        /// <summary>
        /// 异步创建刷新令牌。
        /// </summary>
        /// <param name="context">用户认证令牌创建上下文对象</param>
        /// <returns>异步任务</returns>
        public Task CreateAsync(AuthenticationTokenCreateContext context)
        {
            var refreshToken = Guid.NewGuid().ToString("n");

            using (var scope = AutofacServiceLocator.Container.BeginLifetimeScope())
            {
                context.Ticket.Properties.IssuedUtc = DateTime.UtcNow;
                context.Ticket.Properties.ExpiresUtc = DateTime.UtcNow.AddMinutes(30);

                var token = context.SerializeTicket();
                var userService = scope.Resolve<IUserService>();
                var webApiUserName = context.Ticket.Identity.Name.Split(',')?[1];

                // 将令牌保存到用户信息中。
                var result = userService.SetRefreshToken(webApiUserName, refreshToken.GetHash(), token);

                if (result.IsSuccess)
                {
                    context.SetToken(refreshToken);
                }

                return Task.FromResult(0);
            }
        }

        /// <summary>
        /// 恢复令牌。
        /// </summary>
        /// <param name="context">用户认证令牌恢复上下文对象</param>
        public void Receive(AuthenticationTokenReceiveContext context)
        {
        }

        /// <summary>
        /// 异步恢复令牌。
        /// </summary>
        /// <param name="context">用户认证令牌创建上下文对象</param>
        /// <returns>异步任务</returns>
        public Task ReceiveAsync(AuthenticationTokenReceiveContext context)
        {
            string refreshToken = context.Token.GetHash();

            using (var scope = AutofacServiceLocator.Container.BeginLifetimeScope())
            {
                var userService = scope.Resolve<IUserService>();

                // 从数据库获取保存的令牌。
                var rspToken = userService.GetToken(refreshToken);

                if (rspToken?.Data != null)
                {
                    context.DeserializeTicket(rspToken.Data);
                }
            }

            return Task.FromResult(0);
        }

        #endregion
    }
}
