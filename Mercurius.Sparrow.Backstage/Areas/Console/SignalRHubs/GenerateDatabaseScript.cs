using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using Autofac;
using Mercurius.Sparrow.Autofac;
using Microsoft.AspNet.SignalR;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Sparrow.Backstage.Areas.Console.SignalRHubs
{
    /// <summary>
    /// 生成数据库脚本的SignalR集线器。
    /// </summary>
    public class GenerateDatabaseScript : Hub
    {
        /// <summary>
        /// 生成SQL脚本。
        /// </summary>
        public void Generate()
        {
            this.SendMessage("--start--");

            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                var utilityService = context.Resolve<IUtilityService>();

                // 导出架构
                var schemas = utilityService.GetSchemas();

                if (schemas.HasData())
                {
                    this.SendMessage("开始导出数据库架构...");

                    using (var writer = this.GetScriptWriter("02-Schemas"))
                    {
                        foreach (var item in schemas.Datas)
                        {
                            writer.WriteLine($"IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='{item}')");
                            writer.WriteLine($"  EXEC sys.sp_executesql N'CREATE SCHEMA [{item}] Authorization [dbo]';");

                            writer.WriteLine("GO");
                        }
                    }

                    this.SendMessage("数据库架构导出完毕！");
                }

                // 导出表定义。
                var tablesDdl = utilityService.GetTablesDefinition();

                if (tablesDdl.HasData())
                {
                    this.SendMessage("开始导出表结构...");

                    using (var writer = this.GetScriptWriter("03-Tables"))
                    {
                        foreach (var item in tablesDdl.Datas)
                        {
                            writer.WriteLine(item);
                        }
                    }

                    this.SendMessage("表结构导出完毕！");
                }

                // 导出过程或函数定义。
                var procdures = utilityService.GetProcedures();

                if (procdures.HasData())
                {
                    this.SendMessage("开始导出用户自定义过程...");

                    using (var writer = this.GetScriptWriter("04-Procedures"))
                    {
                        foreach (var item in procdures.Datas)
                        {
                            var p = utilityService.GetProcedureDefinition(item);

                            foreach (var d in p.Datas)
                            {
                                writer.Write(d.Replace("\t", "  "));
                            }

                            writer.WriteLine("GO\r\n");
                        }
                    }

                    this.SendMessage("用户自定义过程导出完毕！");
                }

                var tables = utilityService.GetTables();

                if (tables.HasData())
                {
                    this.SendMessage("开始导出表数据...");

                    using (var writer = this.GetScriptWriter("05-Datas"))
                    {
                        foreach (var item in tables.Datas)
                        {
                            var fullName = $"[{item.Schema}].[{item.Name}]";
                            var datas = utilityService.GetAddDatasScript(fullName);

                            if (!datas.HasData())
                            {
                                continue;
                            }

                            this.SendMessage($"&nbsp;&nbsp;&nbsp;&nbsp;正在导出{fullName}表数据...");

                            if (item.HasIdentityColumn == true)
                            {
                                writer.WriteLine($"SET IDENTITY_INSERT {fullName} ON;\r\nGO");
                            }

                            foreach (var d in datas.Datas)
                            {
                                writer.WriteLine($"{d}\r\nGO");
                            }

                            if (item.HasIdentityColumn == true)
                            {
                                writer.WriteLine($"SET IDENTITY_INSERT {fullName} OFF;\r\nGO");
                            }
                        }
                    }

                    this.SendMessage("表数据导出完成！");
                }
            }

            this.SendMessage("--end--");
        }

        #region 私有方法

        /// <summary>
        /// 获取脚本写入对象。
        /// </summary>
        /// <param name="fileName">脚本名称</param>
        /// <returns>脚本写入流</returns>
        private StreamWriter GetScriptWriter(string fileName)
        {
            var fullName = $@"{HttpContext.Current.Server.MapPath("~/App_Data/Scripts/MSSQL")}\{fileName}.sql";
            var result = new StreamWriter(fullName, false, Encoding.UTF8);

            File.SetAttributes(fullName, FileAttributes.Normal);

            return result;
        }

        /// <summary>
        /// 发送消息。
        /// </summary>
        /// <param name="message">消息内容</param>
        private void SendMessage(string message)
        {
            this.Clients.Caller.Message(message);
        }

        #endregion
    }
}