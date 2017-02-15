using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Microsoft.VisualBasic;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// 系统配置项信息。
    /// </summary>
    public static class SystemConfiguration
    {
        #region 字段

        private static readonly XDocument document;
        private static readonly Dictionary<string, object> settingDictionary;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static SystemConfiguration()
        {
            settingDictionary = new Dictionary<string, object>();
            document = XDocument.Load($@"{AppDomain.CurrentDomain.BaseDirectory}\App_Data\properties.config");
        }

        #endregion

        #region 属性

        /// <summary>
        /// 数据库类型。
        /// </summary>
        public static string DatabaseType => Get("DatabaseType", "MSSQL");

        /// <summary>
        /// 默认分页大小。
        /// </summary>
        public static int DefaultPageSize => Get("DefaultPageSize", 15);

        /// <summary>
        /// Redis服务器地址。
        /// </summary>
        public static string RedisHost => Get("Cache.Redis.Host", "127.0.0.1");

        /// <summary>
        /// Redis服务器端口号。
        /// </summary>
        public static int RedisPort => Get("Cache.Redis.Por", 6379);

        /// <summary>
        /// Redis服务器密码。
        /// </summary>
        public static string RedisPassword => Get("Cache.Redis.Password", "");

        /// <summary>
        /// Redis数据库编号(0~15)。
        /// </summary>
        public static int RedisDatabase => Get("Cache.Redis.Database", 0);

        /// <summary>
        /// 文件系统地址。
        /// </summary>
        public static string FileStorageRomoteUrl => Get("FileStorage.RomoteUrl", "http://127.0.0.1/FileStorageSystem/");

        /// <summary>
        /// 文件系统Web Api账户。
        /// </summary>
        public static string FileStorageTokenAccount => Get("FileStorage.Token.Account", "nebula");

        /// <summary>
        /// 文件系统Web Api账户的密码。
        /// </summary>
        public static string FileStorageTokenPassword => Get("FileStorage.Token.Password", "nebula@xyzbchina.com");

        /// <summary>
        /// 文件系统Web Api token认证获取地址。
        /// </summary>
        public static string FileStorageTokenTokenEndpointPath => FileStorageRomoteUrl + Get("FileStorage.Token.TokenEndpointPath", "api/token");

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取配置文件的值。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="defaultValue">默认值</param>
        /// <returns>值</returns>
        public static T Get<T>(string key, T defaultValue = default(T))
        {
            if (settingDictionary.ContainsKey(key))
            {
                return (T)settingDictionary[key];
            }

            try
            {
                var attrValue = (
                    from n in document.Root.Descendants("add")
                    where
                        n.Attribute("key").Value == key
                    select n.Attribute("value").Value).FirstOrDefault();
                var value = attrValue == null ? defaultValue : Conversion.CTypeDynamic<T>(attrValue);

                settingDictionary.Add(key, value);
            }
            catch (Exception)
            {
                settingDictionary.Add(key, defaultValue);
            }

            return (T)settingDictionary[key];
        }

        #endregion
    }
}
