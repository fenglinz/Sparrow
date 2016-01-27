using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Mercurius.CodeBuilder.Core.Config
{
    public static class ConfigManager
    {
        #region 字段

        private static ItemCollection _sections = null;

        #endregion

        #region 属性

        /// <summary>
        /// 获取所有配置项。
        /// </summary>
        public static ItemCollection Items
        {
            get
            {
                if (_sections != null)
                {
                    return _sections;
                }

                var configFile = $@"{Environment.CurrentDirectory}\Template\CSharp\init.xml";

                if (File.Exists(configFile))
                {
                    _sections = (ItemCollection)
                        (from s in XDocument.Load(configFile).Descendants("item")
                         select new Item
                         {
                             Name = s.Attribute("name").Value,
                             Dependencys = s.Attribute("dependency") != null ? s.Attribute("dependency").Value.Split(',') : null,
                             TemplateFile = $@"{Environment.CurrentDirectory}\Template\CSharp\{s.Attribute("template").Value}",
                             FileFormat = s.Attribute("fileFormat").Value,
                             Extension = s.Attribute("extension").Value,
                             Project = s.Attribute("project").Value,
                             IgnoreView = s.Attribute("ignoreView") != null && Convert.ToBoolean(s.Attribute("ignoreView").Value),
                             SubFolder = s.Attribute("subFolder") != null ? s.Attribute("subFolder").Value : null,
                             Handler = s.Attribute("handler") != null ? s.Attribute("handler").Value : null,
                             Parameters = s.Attribute("parameter") != null ? s.Attribute("parameter").Value.AsDictionary() : null
                         }).ToList();
                }

                return _sections;
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取配置项信息索引。
        /// </summary>
        /// <param name="name">配置项名称</param>
        /// <returns>配置项信息</returns>
        public static Item GetItem(string name)
        {
            return (from s in Items where s.Name == name select s).FirstOrDefault();
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
