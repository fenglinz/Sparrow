using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Autofac;
using Mercurius.FileStorageSystem.Extensions;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.Storage;
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
                var fileStorageService = context.Resolve<IFileService>();

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
                    this.SendMessage($"<span style=\"margin-left:25px;\">已经清理{rsp.Datas}个垃圾文件！</span>");
                }

                // 删除未管理的文件
                this.SendMessage("扫描未管理的文件。");

                var fileSavedDirectory = FileManager.UploadFileSavedDirectory;

                if (Directory.Exists(fileSavedDirectory))
                {
                    var directories = Directory.GetDirectories(fileSavedDirectory);

                    foreach (var item in directories)
                    {
                        this.SendMessage($"<span style=\"margin-left:25px;\">扫描{item.ConvertToWebSitePath()}目录...</span>");

                        var files = from f in Directory.GetFiles(item) select f.ConvertToWebSitePath();
                        var unmanagedFiles = fileStorageService.GetUnmanagedFiles(files.Contract());

                        if (unmanagedFiles.IsSuccess && !unmanagedFiles.Datas.IsEmpty())
                        {
                            FileManager.Remove(unmanagedFiles.Datas);
                            this.SendMessage($"<span style=\"margin-left:25px;\">已成功清理{unmanagedFiles.Datas.Count}条未管理的文件！</span>");
                        }
                    }
                }

                this.SendMessage("清理完成！");
                this.SendMessage("--end--");
            }
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