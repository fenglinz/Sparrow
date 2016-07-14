using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Autofac;
using Mercurius.FileStorageSystem.Apis.Core.Controllers;
using Mercurius.FileStorageSystem.Extensions;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.Core;
using Microsoft.AspNet.SignalR;

namespace Mercurius.FileStorageSystem.SignalRHubs
{
    /// <summary>
    /// 清理未垃圾文件集线器。
    /// </summary>
    public class ClearRubbishFiles : Hub
    {
        /// <summary>
        /// 清理。
        /// </summary>
        public void Clear()
        {
            this.SendMessage("--start--");

            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                var client = context.Resolve<FileStorageController>();
                var fileStorageService = context.Resolve<IFileStorageService>();

                this.SendMessage("开始扫描已删除的残余文件...");

                while (true)
                {
                    var rsp = fileStorageService.GetInvalidFiles();

                    if (!rsp.IsSuccess || rsp.Datas.IsEmpty())
                    {
                        this.SendMessage("已删除的残余文件清理完成！");

                        break;
                    }

                    FileManager.Remove(rsp.Datas);
                    this.SendMessage($"已经清理{rsp.Datas}个垃圾文件！");
                }
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