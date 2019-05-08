using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Xml.Linq;
using Mercurius.Prime.Core;

namespace Mercurius.Prime.Data.Parser
{
    /// <summary>
    /// 基于XML文件的命令解析器。
    /// <para>将添加的xml文件生成属性设置为“嵌入的资源”</para>  
    /// </summary>
    /// <summary>
    /// SQL命令获取器。
    /// <para>将添加的xml文件生成属性设置为“嵌入的资源”</para>  
    /// </summary>
    internal static class XmlCommandTextParser
    {
        #region 静态字段

        private static readonly XNamespace XNamespace = "http://www.mercurius.com/CommandText.xsd";

        private static readonly object _locker = new object();
        private static readonly IDictionary<string, CommandText> XCommandDictionaries;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static XmlCommandTextParser()
        {
            XCommandDictionaries = new Dictionary<string, CommandText>();

            var assemblies = AppDomain.CurrentDomain.GetAssemblies();

            foreach (var item in assemblies)
            {
                if (item.IsDynamic)
                {
                    continue;
                }

                var resources =
                from r in item.GetManifestResourceNames()
                where
                  r.EndsWith(".xml") || r.EndsWith(".config")
                select r;

                foreach (var resource in resources)
                {
                    var res = item.GetManifestResourceStream(resource);
                    var xmlDocument = XDocument.Load(res);

                    ParseCommandText(xmlDocument);
                }
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 解析命令信息。
        /// </summary>
        /// <param name="ns">命令所在的命名空间</param>
        /// <param name="commandName">命令名称</param>
        /// <returns>命令信息</returns>
        public static CommandText GetXCommand(this StatementNamespace ns, string commandName)
        {
            var statementId = ns.GetStatementId(commandName);
            var command = XCommandDictionaries.ContainsKey(statementId) ? XCommandDictionaries[statementId] : null;
            
            return command;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 解析命令信息。
        /// </summary>
        /// <param name="type">数据访问对象</param>
        /// <param name="commandName">命令名称</param>
        /// <param name="connection">数据库连接对象</param>
        /// <param name="providerName">数据库类型(默认:MySQL)</param>
        /// <returns>命令信息</returns>
        private static void ParseCommandText(XDocument xdocument)
        {
            var xcommands = (
                from c in xdocument.Descendants(XNamespace + "commandText")
                let ns = xdocument.Root.Attribute("namespace")?.Value
                let attachs = c.HasElements ? c.Elements(XNamespace + "attach") : null
                let textNode = c.FirstNode as XText ?? c.FirstNode.NextNode as XText
                select new CommandText
                {
                    Name = $"{(ns.IsNullOrEmpty() ? "" : ns + ".")}{c.Attribute("name").Value}",
                    Type = c.Attribute("commandType") == null ? CommandType.Text : (CommandType)Enum.Parse(typeof(CommandType), c.Attribute("commandType").Value),
                    Text = textNode.Value.Replace(Environment.NewLine, " ").Replace("\n", " ").Replace("\t", " ").TrimStart(' '),
                    Attachs = attachs == null ? null : (
                        from a in attachs
                        select new CommandText
                        {
                            Name = a.Attribute("name")?.Value,
                            Type = a.Attribute("commandType") == null ? CommandType.Text : (CommandType)Enum.Parse(typeof(CommandType), a.Attribute("commandType").Value),
                            Mode = a.Attribute("mode") == null ? ExecuteMode.Execute : (ExecuteMode)Enum.Parse(typeof(ExecuteMode), a.Attribute("mode").Value),
                            Text = a.Value?.Replace(Environment.NewLine, " ").Replace("\n", " ").Replace("\t", " ").TrimStart(' ')
                        }
                    ).ToList()
                }
            );

            if (!xcommands.IsEmpty())
            {
                foreach (var item in xcommands)
                {
                    if (!XCommandDictionaries.ContainsKey(item.Name))
                    {
                        XCommandDictionaries.Add(item.Name, item);
                    }
                }
            }
        }

        #endregion
    }
}
