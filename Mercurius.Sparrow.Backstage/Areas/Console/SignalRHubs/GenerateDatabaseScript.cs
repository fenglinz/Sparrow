using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using Autofac;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Microsoft.AspNet.SignalR;

namespace Mercurius.Sparrow.Backstage.Areas.Console.SignalRHubs
{
    /// <summary>
    /// 生成数据库脚本的SignalR集线器。
    /// </summary>
    public class GenerateDatabaseScript : Hub
    {
        /// <summary>
        /// 
        /// </summary>
        public void Generate()
        {
            this.SendMessage("--start--");

            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                var utilityService = context.Resolve<IUtilityService>();

                var tablesDdl = utilityService.GetTablesDefinition();

                if (tablesDdl.HasData())
                {
                    this.SendMessage("开始导出用户自定义表...");

                    using (var writer = this.GetScriptWriter("02-tables"))
                    {
                        foreach (var item in tablesDdl.Datas)
                        {
                            writer.WriteLine(item);
                        }
                    }

                    this.SendMessage("用户自定义表导出完毕！");
                }

                var procdures = utilityService.GetProcedures();

                if (procdures.HasData())
                {
                    this.SendMessage("开始导出用户自定义过程...");

                    using (var writer = this.GetScriptWriter("03-procedures"))
                    {
                        foreach (var item in procdures.Datas)
                        {
                            var p = utilityService.GetProcedureDefinition(item);

                            foreach (var d in p.Datas)
                            {
                                writer.Write(d);
                            }

                            writer.WriteLine("GO");
                        }
                    }

                    this.SendMessage("用户自定义过程导出完毕！");
                }
            }

            this.SendMessage("--end--");
        }

        private StreamWriter GetScriptWriter(string fileName)
        {
            var fullName = $@"{HttpContext.Current.Server.MapPath("~/App_Data/Scripts/MSSQL")}\{fileName}.sql";

            return new StreamWriter(fullName, false, Encoding.UTF8);
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