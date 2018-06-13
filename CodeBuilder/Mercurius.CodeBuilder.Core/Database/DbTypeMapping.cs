using System.Collections.Generic;
using System.IO;

namespace Mercurius.CodeBuilder.Core.Database
{
    public class MappingItem
    {
        #region 属性

        /// <summary>
        /// 对应的jdbc类型
        /// </summary>
        public string JdbcType { get; set; }

        /// <summary>
        /// 语言类型
        /// </summary>
        public string LanguageType { get; set; }

        /// <summary>
        /// 参数类型
        /// </summary>
        public string ParameterType { get; set; }

        #endregion
    }

    /// <summary>
    /// <para>
    /// 数据库类型映射工具。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-10
    /// </para>
    /// </summary>
    public abstract class DbTypeMapping
    {
        #region 字段

        private Dictionary<string, Dictionary<string, MappingItem>> _sqlTypeConvertors;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public DbTypeMapping()
        {
            this._sqlTypeConvertors = new Dictionary<string, Dictionary<string, MappingItem>>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取数据库类型在相应语言下的基本类型。
        /// </summary>
        /// <param name="language">语言</param>
        /// <param name="dbType">数据库类型</param>
        /// <returns>对应指定语言的基本类型</returns>
        public MappingItem GetBasicType(string language, string dbType)
        {
            var key = dbType.ToLower();
            var result = new MappingItem { LanguageType = key, JdbcType = key, ParameterType = key };

            if (this._sqlTypeConvertors.ContainsKey(language))
            {
                if (this._sqlTypeConvertors[language].ContainsKey(key))
                {
                    result = this._sqlTypeConvertors[language][key];
                }
            }

            return result;
        }

        #endregion

        #region 受保护方法

        /// <summary>
        /// 加载数据库映射文件。
        /// </summary>
        /// <param name="language">对应语言</param>
        /// <param name="stream">映射文件流</param>
        protected void LoadMappingFile(string language, Stream stream)
        {
            if (stream != null)
            {
                Dictionary<string, MappingItem> dict = null;
                if (this._sqlTypeConvertors.ContainsKey(language))
                {
                    dict = this._sqlTypeConvertors[language];
                }
                else
                {
                    dict = new Dictionary<string, MappingItem>();

                    this._sqlTypeConvertors.Add(language, dict);
                }

                using (var reader = new StreamReader(stream))
                {
                    var temp = string.Empty;

                    dict.Clear();
                    while (!string.IsNullOrWhiteSpace(temp = reader.ReadLine()))
                    {
                        var arrays = temp.Split(',');

                        dict.Add(arrays[0].ToLower(), new MappingItem
                        {
                            LanguageType = arrays[1],
                            JdbcType = arrays.Length > 2 ? arrays[2] : arrays[0],
                            ParameterType = arrays.Length > 3 ? arrays[3] : arrays[0].ToLower()
                        });
                    }
                }
            }
        }

        #endregion
    }
}
