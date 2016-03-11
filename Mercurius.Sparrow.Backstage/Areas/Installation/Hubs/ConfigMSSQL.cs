using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Mercurius.Infrastructure.Ado;
using Microsoft.AspNet.SignalR;

namespace Mercurius.Sparrow.Backstage.Areas.Installation.Hubs
{
    /// <summary>
    /// Microsoft SQL Server配置。
    /// </summary>
    public class ConfigMSSQL : Hub
    {
        /// <summary>
        /// 初始化应用程序。
        /// </summary>
        /// <param name="host">数据库服务器地址</param>
        /// <param name="account">数据库登录账号</param>
        /// <param name="password">数据库登录密码</param>
        /// <param name="dbname">数据库名称</param>
        public void Initialization(string host, string account, string password, string dbname)
        {
            this.SendMessage("--start--");

            var dbHelper = DbHelperCreator.Create(DatabaseType.MSSQL, host, dbname, account, password);

            try
            {
                using (dbHelper.OpenSession())
                {
                    var connection = dbHelper.OpenSession();

                    this.SendMessage("数据库连接正常！");

                    this.SendMessage("开始创建架构...");
                    this.ExecuteScript(connection, "schemas");
                    this.SendMessage("架构创建完成！");

                    this.SendMessage("开始导入表结构和数据...");
                    this.ExecuteScript(connection, "RBAC");
                    this.SendMessage("<span style=\"margin-left:25px;\">权限控制相关表和数据导入完成！</span>");

                    this.ExecuteScript(connection, "Dynamic");
                    this.SendMessage("<span style=\"margin-left:25px;\">动态查询相关的表和数据导入完成！</span>");

                    this.ExecuteScript(connection, "WebApi");
                    this.SendMessage("<span style=\"margin-left:25px;\">相关的表和数据导入完成！</span>");

                    this.ExecuteScript(connection, "dbo");
                    this.SendMessage("表结构和数据导入完成！");
                }
            }
            catch (Exception e)
            {
                this.SendMessage("出现错误，错误详情：" + e.Message);
            }

            this.SendMessage("--end--");
        }

        #region 私有方法

        /// <summary>
        /// 发送消息。
        /// </summary>
        /// <param name="message">消息内容</param>
        private void SendMessage(string message)
        {
            this.Clients.Caller.Message(message);
        }

        /// <summary>
        /// 创建数据库架构。
        /// </summary>
        /// <param name="connection">数据库连接对象</param>
        /// <param name="script">脚本名称</param>
        private void ExecuteScript(DbConnection connection, string script)
        {
            var command = connection.CreateCommand();
            var commandTexts = this.ResolveScripts(script);
            
            connection.SafeOpen();

            foreach (var commandText in commandTexts)
            {
                command.CommandText = commandText;
                command.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 解析数据库脚本。
        /// </summary>
        /// <param name="script">脚本名称</param>
        /// <returns>脚本命令集合</returns>
        private IList<string> ResolveScripts(string script)
        {
            var result = new List<string>();
            var realPath = $@"{AppDomain.CurrentDomain.BaseDirectory}\App_Data\Scripts\MSSQL\{script}.sql";

            using (var stream = new StreamReader(realPath, Encoding.UTF8))
            {
                var temp = string.Empty;
                var commandText = new StringBuilder();

                while ((temp = stream.ReadLine()) != null)
                {
                    if (temp.Trim().ToUpper() == "GO")
                    {
                        var segment = commandText.ToString();

                        if (!string.IsNullOrWhiteSpace(segment))
                        {
                            result.Add(segment);

                            commandText.Clear();
                        }
                    }
                    else
                    {
                        commandText.AppendFormat("{0} ", temp);
                    }
                }

                if (!string.IsNullOrWhiteSpace(commandText.ToString()))
                {
                    result.Add(commandText.ToString());
                }
            }

            return result;
        }

        #endregion
    }
}