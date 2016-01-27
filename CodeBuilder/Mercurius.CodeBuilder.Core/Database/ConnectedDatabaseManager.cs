using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Mercurius.CodeBuilder.Core.Database
{
    public static class ConnectedDatabaseManager
    {
        #region 公开方法

        /// <summary>
        /// 初始化数据库连接信息：默认从当前目录下的Config\ConnectedDatabase.xml配置文件中获取。
        /// <para>
        /// 如指定的配置文件不存在，则返回一个空的数据库连接信息集合。
        /// </para>
        /// </summary>
        /// <param name="file">保存数据库连接信息的文件</param>
        /// <returns>数据库连接信息集合</returns>
        public static ConnectedDatabaseCollection GetConnectedDatabases(string file = null)
        {
            var xdocument = CreateXDocument(file);

            if (xdocument != null)
            {
                var databases = (from x in xdocument.Descendants("database")
                                 select new ConnectedDatabase
                                 {
                                     Name = x.Attribute("name").Value,
                                     Type = (DatabaseType)Enum.Parse(typeof(DatabaseType), x.Attribute("type").Value, true),
                                     ServerUri = x.Element("logon").Attribute("server").Value,
                                     Account = x.Element("logon").Attribute("account").Value,
                                     Password = x.Element("logon").Attribute("password").Value
                                 }).ToList();

                return (ConnectedDatabaseCollection)databases;
            }

            return new ConnectedDatabaseCollection();
        }

        /// <summary>
        /// 添加或者更新指定文件中的数据库连接信息。
        /// </summary>
        /// <param name="item">数据库连接信息</param>
        /// <param name="file">保存到的文件路径</param>
        public static void SaveOrUpdate(ConnectedDatabase item, string file = null)
        {
            if (item != null)
            {
                var collections = GetConnectedDatabases(file);
                var xdoument = CreateXDocument(file) ?? XDocument.Parse("<root></root>");

                if (collections[item.Type, item.Name] != null)
                {
                    var elements = (from x in xdoument.Descendants("database")
                                    where
                                        x.Attribute("type").Value == item.Type.ToString() && x.Attribute("name").Value == item.Name
                                    select x);

                    foreach (var element in elements)
                    {
                        element.Element("logon").Attribute("server").Value = item.ServerUri;
                        element.Element("logon").Attribute("account").Value = item.Account;
                        element.Element("logon").Attribute("password").Value = item.Password;
                    }
                }
                else
                {
                    var element = new XElement("database");
                    var logonElement = new XElement("logon");

                    element.SetAttributeValue("name", item.Name);
                    element.SetAttributeValue("type", item.Type);
                    logonElement.SetAttributeValue("server", item.ServerUri);
                    logonElement.SetAttributeValue("account", item.Account);
                    logonElement.SetAttributeValue("password", item.Password);

                    element.Add(logonElement);

                    if (xdoument.Root.LastNode != null)
                    {
                        xdoument.Root.LastNode.AddAfterSelf(element);
                    }
                    else
                    {
                        xdoument.Root.Add(element);
                    }
                }

                xdoument.Save(GetFullFilePath(file));
            }
        }

        /// <summary>
        /// 从指定文件中删除数据库连接信息。
        /// </summary>
        /// <param name="type">数据库类型</param>
        /// <param name="databaseName">数据库名称</param>
        /// <param name="file">文件路径</param>
        public static void Remove(DatabaseType type, string databaseName, string file = null)
        {
            var xdoument = CreateXDocument(file);

            if (xdoument != null)
            {
                var element = (from x in xdoument.Descendants("database")
                               where
                                   x.Attribute("type").Value == type.ToString() && x.Attribute("name").Value == databaseName
                               select x).FirstOrDefault();

                if (element != null)
                {
                    element.Remove();
                    xdoument.Save(GetFullFilePath(file));
                }
            }
        }

        #endregion

        #region 私有方法

        private static string GetFullFilePath(string file = null)
        {
            var result = string.IsNullOrWhiteSpace(file) ? Environment.CurrentDirectory + @"\Config\ConnectedDatabase.xml" : file;

            if (!File.Exists(result))
            {
                if (!Directory.Exists(Environment.CurrentDirectory + "\\Config"))
                {
                    Directory.CreateDirectory(Environment.CurrentDirectory + "\\Config");
                }

                File.Create(result);
            }

            return result;
        }

        private static XDocument CreateXDocument(string file = null)
        {
            file = GetFullFilePath(file);

            if (File.Exists(file))
            {
                return XDocument.Load(file);
            }

            return null;
        }

        #endregion
    }
}
