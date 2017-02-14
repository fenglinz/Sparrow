using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Microsoft.Owin.Security.Infrastructure;

namespace Mercurius.Kernel.WebCores.OAuth2
{
    public class RefreshTokenProvider : IAuthenticationTokenProvider
    {
        public void Create(AuthenticationTokenCreateContext context)
        {
            this.CreateAsync(context);
        }

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

                var result = userService.SetRefreshToken(webApiUserName, refreshToken, token);

                if (result.IsSuccess)
                {
                    context.SetToken(refreshToken);
                }

                return Task.FromResult(0);
            }
        }

        public void Receive(AuthenticationTokenReceiveContext context)
        {
            this.ReceiveAsync(context);
        }

        public Task ReceiveAsync(AuthenticationTokenReceiveContext context)
        {
            string refreshToken = context.Token;

            using (var scope = AutofacServiceLocator.Container.BeginLifetimeScope())
            {
                var userService = scope.Resolve<IUserService>();
                var rspToken = userService.GetToken(refreshToken);

                if (rspToken?.Data != null)
                {
                    context.DeserializeTicket(rspToken.Data);
                }
            }

            return Task.FromResult(0);
        }
    }
}
