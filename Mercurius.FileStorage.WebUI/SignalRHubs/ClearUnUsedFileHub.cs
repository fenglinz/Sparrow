using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Autofac;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Autofac;
using Microsoft.AspNet.SignalR;

namespace Mercurius.FileStorage.WebUI.SignalRHubs
{
    /// <summary>
    /// 清理未使用的文件集线器。
    /// </summary>
    public class ClearUnUsedFileHub : Hub
    {
        /// <summary>
        /// 清理。
        /// </summary>
        public void Clear()
        {
            this.SendMessage("--start--");

            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                var query = context.Resolve<DynamicQuery>();

                this.SendMessage("准备扫描...");
                query.Update<Sparrow.Entities.Core.FileStorage>(new { ScanStatus = 1 });


            }

            this.SendMessage("--end--");
        }

        /// <summary>
        /// 发送消息。
        /// </summary>
        /// <param name="message">消息内容</param>
        private void SendMessage(string message)
        {
            this.Clients.Caller.Message(message);
        }
    }
}