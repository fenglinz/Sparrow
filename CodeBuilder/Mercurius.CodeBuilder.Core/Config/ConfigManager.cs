using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace Mercurius.CodeBuilder.Core.Config
{
    /// <summary>
    /// Orm中间件。
    /// </summary>
    public enum OrmMiddleware
    {
        Dapper,

        IBatisNet
    }

    public static class ConfigManager
    {
        #region 字段

        private static readonly Dictionary<OrmMiddleware, ItemCollection> dictItems;

        private static ItemCollection _sections = null;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static ConfigManager()
        {
            dictItems = new Dictionary<OrmMiddleware, ItemCollection>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取所有的配置信息。
        /// </summary>
        /// <param name="orm">Orm中间件</param>
        /// <returns>配置信息集合</returns>
        public static ItemCollection GetItems(OrmMiddleware orm)
        {
            if (dictItems.ContainsKey(orm))
            {
                return dictItems[orm];
            }

            var configFile = $@"{Environment.CurrentDirectory}\Template\CSharp\{orm}\init.xml";

            if (File.Exists(configFile))
            {
                _sections = (ItemCollection)
                    (from s in XDocument.Load(configFile).Descendants("item")
                     select new Item
                     {
                         Name = s.Attribute("name").Value,
                         Dependencys = s.Attribute("dependency")?.Value.Split(','),
                         TemplateFile = $@"{Environment.CurrentDirectory}\Template\CSharp\{s.Attribute("template").Value}",
                         Module = s.Attribute("module")?.Value,
                         FileFormat = s.Attribute("fileFormat").Value,
                         Extension = s.Attribute("extension").Value,
                         Project = s.Attribute("project").Value,
                         IgnoreView = s.Attribute("ignoreView") != null && Convert.ToBoolean(s.Attribute("ignoreView").Value),
                         SubFolder = s.Attribute("subFolder")?.Value,
                         Handler = s.Attribute("handler")?.Value,
                         Parameters = s.Attribute("parameter")?.Value.AsDictionary()
                     }).ToList();

                dictItems.Add(orm, _sections);
            }

            return _sections;
        }
        
        /// <summary>
        /// 获取配置项信息索引。
        /// </summary>
        /// <param name="name">配置项名称</param>
        /// <returns>配置项信息</returns>
        public static Item GetItem(this ItemCollection items, string name)
        {
            return (from s in items where s.Name == name select s).FirstOrDefault();
        }

        #endregion

        #region 私有方法

        private static Dictionary<string, string> AsDictionary(this string parameter)
        {
            if (string.IsNullOrWhiteSpace(parameter))
            {
                return null;
            }

            var arrays = parameter.Split(';').Where(s => !string.IsNullOrWhiteSpace(s));
            var result = new Dictionary<string, string>();

            foreach (var item in arrays)
            {
                var keyValue = item.Split(':');

                result.Add(keyValue[0], keyValue[1]);
            }

            return result;
        }

        #endregion
    }
}
