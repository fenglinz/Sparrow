using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.WebPages;
using System.Xml.Linq;
using System.Xml.XPath;
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
        /// <param name="dbName">数据库名称</param>
        public void Initialization(string host, string account, string password, string dbName)
        {
            this.SendMessage("--start--");

            try
            {
                this.CreateDatabase(host, account, password, dbName);

                var dbHelper = DbHelperCreator.Create(DatabaseType.MSSQL, host, dbName, account, password);

                using (dbHelper.OpenSession())
                {
                    var connection = dbHelper.OpenSession();

                    this.SendMessage("开始配置数据库...");
                    var directory = $@"{AppDomain.CurrentDomain.BaseDirectory}\App_Data\Scripts\MSSQL";
                    var scriptFiles = from f in Directory.GetFiles(directory, "*.sql")
                                      let file = Path.GetFileName(f).Replace(".sql", "")
                                      let sort = file.Substring(file.IndexOf("-")).AsInt(0)
                                      orderby sort ascending
                                      select file;

                    foreach (var script in scriptFiles)
                    {
                        this.ExecuteScript(connection, script);
                    }

                    this.SendMessage("数据库配置完成！");
                }

                this.ResetConfigSettings(host, account, password, dbName);

                this.RemarkInstalled();

                this.SendMessage("--end--");
            }
            catch (Exception e)
            {
                this.SendMessage("出现错误，错误详情：" + e.Message);
            }
        }

        #region 私有方法

        #region 配置数据库

        /// <summary>
        /// 配置数据库。
        /// </summary>
        /// <param name="host">数据库服务器地址</param>
        /// <param name="account">数据库登录账号</param>
        /// <param name="password">数据库登录密码</param>
        /// <param name="dbName">数据库名称</param>
        private void CreateDatabase(string host, string account, string password, string dbName)
        {
            var dbHelper = DbHelperCreator.Create(DatabaseType.MSSQL, host, "master", account, password);
            var sql = $"IF NOT EXISTS(SELECT * FROM sys.databases WHERE name='{dbName}') CREATE DATABASE {dbName}";

            using (var connection = dbHelper.OpenSession())
            {
                var command = connection.CreateCommand();

                command.CommandText = sql;

                connection.SafeOpen();
                command.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// 创建数据库架构。
        /// </summary>
        /// <param name="connection">数据库连接对象</param>
        /// <param name="script">脚本名称</param>
        private void ExecuteScript(DbConnection connection, string script)
        {
            this.SendMessage($"<span style=\"margin-left:25px;\">开始导入{script}脚本...</span>");

            var command = connection.CreateCommand();
            var commandTexts = this.ResolveScripts(script);

            connection.SafeOpen();

            foreach (var commandText in commandTexts)
            {
                command.CommandText = commandText;
                command.ExecuteNonQuery();
            }

            this.SendMessage($"<span style=\"margin-left:25px;\">{script}脚本导入成功！</span>");
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
                        commandText.AppendFormat("{0}{1}", temp, Environment.NewLine);
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

        #region 修改配置文件

        /// <summary>
        /// 重设数据库连接配置。
        /// </summary>
        /// <param name="host"></param>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <param name="dbName"></param>
        private void ResetConfigSettings(string host, string account, string password, string dbName)
        {
            var databaseConfigFile = $@"{AppDomain.CurrentDomain.BaseDirectory}\App_Data\properties.config";
            var document = XDocument.Load(databaseConfigFile);

            document.XPathSelectElement("//add[@key='rhost']")?.Attribute("value")?.SetValue(host);
            document.XPathSelectElement("//add[@key='rsid']")?.Attribute("value")?.SetValue(dbName);
            document.XPathSelectElement("//add[@key='rusername']")?.Attribute("value")?.SetValue(account);
            document.XPathSelectElement("//add[@key='rpassword']")?.Attribute("value")?.SetValue(password);

            document.XPathSelectElement("//add[@key='whost']")?.Attribute("value")?.SetValue(host);
            document.XPathSelectElement("//add[@key='wsid']")?.Attribute("value")?.SetValue(dbName);
            document.XPathSelectElement("//add[@key='wusername']")?.Attribute("value")?.SetValue(account);
            document.XPathSelectElement("//add[@key='wpassword']")?.Attribute("value")?.SetValue(password);

            document.Save(databaseConfigFile);
        }

        private void RemarkInstalled()
        {
            var webConfigFile = $@"{AppDomain.CurrentDomain.BaseDirectory}\Web.config";
            var xdocument = XDocument.Load(webConfigFile);

            var element = xdocument.XPathSelectElement("//appSettings/add[@key='Installation.Flag']");

            if (element != null)
            {
                element.Attribute("value")?.SetValue(false);

                this.SendMessage("--end--");

                xdocument.Save(webConfigFile);
            }
        }

        #endregion

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