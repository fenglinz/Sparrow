using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Sparrow.Autofac;
using Microsoft.Owin.Security.Infrastructure;
using Autofac;
using Mercurius.Infrastructure.Cache;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 刷新OAuth令牌的提供者。
    /// </summary>
    public class RefreshTokenProvider : AuthenticationTokenProvider
    {
        /// <summary>
        /// 创建OAuth令牌。
        /// </summary>
        /// <param name="context">令牌创建上下文</param>
        public override void Create(AuthenticationTokenCreateContext context)
        {
            var tokenValue = Guid.NewGuid().ToString("n");

            context.Ticket.Properties.IssuedUtc = DateTime.UtcNow;
            context.Ticket.Properties.ExpiresUtc = DateTime.UtcNow.AddDays(60);

            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                var cache = container.Resolve<CacheProvider>();

                cache?.Add(tokenValue, context.SerializeTicket(), TimeSpan.FromDays(60));
            }

            context.SetToken(tokenValue);
        }

        /// <summary>
        /// 恢复OAuth令牌。
        /// </summary>
        /// <param name="context">令牌恢复上下文</param>
        public override void Receive(AuthenticationTokenReceiveContext context)
        {
            using (var container = AutofacConfig.Container.BeginLifetimeScope())
            {
                var cache = container.Resolve<CacheProvider>();
                var tokenKey = cache?.Get<string>(context.Token);

                if (string.IsNullOrWhiteSpace(tokenKey))
                {
                    context.DeserializeTicket(tokenKey);
                }
            }
        }
    }
}