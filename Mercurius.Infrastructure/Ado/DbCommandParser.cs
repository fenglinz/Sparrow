using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Xml.Linq;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// SQL命令获取器。
    /// <para>使用要求：</para>
    /// <para>1、针对每个表的操作，必须创建一个该表的实体类。</para>
    /// <para>2、必须在实体类所在命名空间的根目录下创建一个CommandText目录。</para>
    /// <para>3、针对每个实体类，必须在CommandText目录中添加一个与实体类名称相同的xml文件。</para>
    /// <para>4、将添加的xml文件生成属性设置为“嵌入的资源”</para>  
    /// </summary>
    public static class DbCommandParser
    {
        #region 内部类

        /// <summary>
        /// CommandText配置节点类型。
        /// </summary>
        public class XCommand
        {
            #region 属性

            /// <summary>
            /// SQL命令类型。
            /// </summary>
            public CommandType CommandType { get; set; }

            /// <summary>
            /// SQL命令。
            /// </summary>
            public string CommandText { get; set; }

            #endregion
        }

        #endregion

        #region 静态字段

        private static readonly XNamespace XNamespace = "http://www.mercurius.com/CommandText.xsd";

        private static readonly Dictionary<string, XDocument> XDocumentDictionary;
        private static readonly Dictionary<string, XCommand> CommandTextDictionary;

        private static object _locker = new object();

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static DbCommandParser()
        {
            XDocumentDictionary = new Dictionary<string, XDocument>();
            CommandTextDictionary = new Dictionary<string, XCommand>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 根据资源文件创建SQL命令执行对象。
        /// </summary>
        /// <typeparam name="T">数据访问对象类型</typeparam>
        /// <param name="dbHelper"></param>
        /// <param name="name">CommandTexe名称</param>
        /// <returns>SQL命令执行对象</returns>
        public static DbCommand CreateCommand<T>(this DbHelper dbHelper, string name)
        {
            var typeInfo = typeof(T);

            return CreateCommand(dbHelper, typeInfo.Namespace, typeInfo.Name, name, typeInfo.Assembly);
        }

        /// <summary>
        /// 根据资源文件创建SQL命令执行对象。
        /// </summary>
        /// <param name="dbHelper">数据库访问对象</param>
        /// <param name="ns">命名空间</param>
        /// <param name="file">Command命令文件名</param>
        /// <param name="name">CommandTexe名称</param>
        /// <param name="embeddedAssembly">配置文件嵌入的程序集</param>
        /// <returns>SQL命令执行对象</returns>
        public static DbCommand CreateCommand(
            this DbHelper dbHelper,
            string ns,
            string file,
            string name,
            Assembly embeddedAssembly = null)
        {
            if (dbHelper == null)
            {
                throw new ArgumentNullException(nameof(dbHelper));
            }

            var xcommand = ParseCommandText(dbHelper.Database, ns, file, name, embeddedAssembly);

            if (xcommand == null)
            {
                return null;
            }

            var command = dbHelper.CreateCommand();

            command.CommandText = xcommand.CommandText;
            command.CommandType = xcommand.CommandType;

            return command;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 解析命令信息。
        /// </summary>
        /// <typeparam name="T">数据访问对象类型</typeparam>
        /// <param name="database">数据库类型</param>
        /// <param name="name">命令名</param>
        /// <returns>命令信息</returns>
        private static XCommand ParseCommandText<T>(DatabaseType database, string name)
        {
            var typeInfo = typeof(T);

            return ParseCommandText(database, typeInfo.Namespace, typeInfo.Name, name, typeInfo.Assembly);
        }

        /// <summary>
        /// 解析命令信息。
        /// </summary>
        /// <param name="database">数据库类型</param>
        /// <param name="ns">命名空间</param>
        /// <param name="file">命令文件名</param>
        /// <param name="name">命令名称</param>
        /// <param name="embeddedAssembly">配置文件嵌入的程序集</param>
        /// <returns>命令信息</returns>
        private static XCommand ParseCommandText(DatabaseType database, string ns, string file, string name, Assembly embeddedAssembly = null)
        {
            XCommand xcommand;

            var documentKey = $"{ns}.{file}";
            var commandTextKey = $"{documentKey}.{name}";

            embeddedAssembly = embeddedAssembly ?? typeof(DbCommandParser).Assembly;

            if (CommandTextDictionary.ContainsKey(commandTextKey))
            {
                xcommand = CommandTextDictionary[commandTextKey];
            }
            else
            {
                lock (_locker)
                {
                    if (!XDocumentDictionary.ContainsKey(documentKey))
                    {
                        Stream stream = null;

                        try
                        {
                            stream = embeddedAssembly.GetManifestResourceStream($"{ns}.CommandText.{database}.{file}.xml");
                        }
                        catch { }

                        if (stream == null)
                        {
                            stream = embeddedAssembly.GetManifestResourceStream($"{ns}.CommandText.{file}.xml");
                        }

                        XDocumentDictionary.Add(documentKey, XDocument.Load(stream));
                    }


                    var xdocment = XDocumentDictionary[documentKey];

                    xcommand = (from c in xdocment.Descendants(XNamespace + "CommandText")
                                where c.Attribute("name").Value == name
                                select new XCommand
                                {
                                    CommandType = (CommandType)Enum.Parse(typeof(CommandType), c.Attribute("commandType").Value),
                                    CommandText = c.Value.Replace(Environment.NewLine, " ").Replace("\n", " ")
                                }).FirstOrDefault();

                    if (xcommand != null)
                    {
                        CommandTextDictionary.Add(commandTextKey, xcommand);
                    }
                }
            }

            return xcommand;
        }

        #endregion
    }
}
