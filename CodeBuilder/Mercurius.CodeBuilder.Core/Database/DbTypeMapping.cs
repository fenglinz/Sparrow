using System.Collections.Generic;
using System.IO;

namespace Mercurius.CodeBuilder.Core.Database
{
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

        private Dictionary<string, Dictionary<string, string>> _sqlTypeConvertors;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public DbTypeMapping()
        {
            this._sqlTypeConvertors = new Dictionary<string, Dictionary<string, string>>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取数据库类型在相应语言下的基本类型。
        /// </summary>
        /// <param name="language">语言</param>
        /// <param name="dbType">数据库类型</param>
        /// <returns>对应指定语言的基本类型</returns>
        public string GetBasicType(string language, string dbType)
        {
            var key = dbType.ToLower();
            var result = key;

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
                Dictionary<string, string> dict = null;
                if (this._sqlTypeConvertors.ContainsKey(language))
                {
                    dict = this._sqlTypeConvertors[language];
                }
                else
                {
                    dict = new Dictionary<string, string>();
                    this._sqlTypeConvertors.Add(language, dict);
                }

                using (var reader = new StreamReader(stream))
                {
                    var temp = string.Empty;

                    dict.Clear();
                    while (!string.IsNullOrWhiteSpace(temp = reader.ReadLine()))
                    {
                        var arrays = temp.Split(',');
                        
                        dict.Add(arrays[0].ToLower(), arrays[1]);
                    }
                }
            }
        }

        #endregion
    }
}
