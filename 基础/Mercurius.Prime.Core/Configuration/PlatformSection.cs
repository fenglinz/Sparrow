using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 平台配置分类信息
    /// </summary>
    public class PlatformSection : ConfigurationSection
    {
        #region 字段

        private const string PageSizeKey = "pageSize";
        private const string LogLevelKey = "logLevel";
        private const string ConnectionStringsKey = "connectionStrings";

        private static PlatformSection _platformSection;

        #endregion

        #region 属性

        /// <summary>
        /// 每页显示的记录数
        /// </summary>
        [ConfigurationProperty(PageSizeKey, DefaultValue = 20)]
        public int PageSize { get => Convert.ToInt32(base[PageSizeKey]); set => base[PageSizeKey] = value; }

        /// <summary>
        /// 日志的级别(Debug、Info、Warn、Fatal)
        /// </summary>
        [ConfigurationProperty(LogLevelKey, DefaultValue = "Debug")]
        public string LogLevel { get => base[LogLevelKey]?.ToString(); set => base[LogLevelKey] = value; }

        /// <summary>
        /// 
        /// </summary>
        [ConfigurationProperty(ConnectionStringsKey)]
        public ConnectionStringElements ConnectionStrings => base[ConnectionStringsKey] as ConnectionStringElements;

        /// <summary>
        /// 获取redis配置信息
        /// </summary>
        [ConfigurationProperty("redisServers")]
        public RedisElements Redis => base["redisServers"] as RedisElements;

        [ConfigurationProperty("redisSession")]
        public RedisSessionElement RedisSession => base["redisSession"] as RedisSessionElement;

        /// <summary>
        /// 
        /// </summary>
        [ConfigurationProperty("settings")]
        public SettingElements Settings => base["settings"] as SettingElements;

        #endregion

        #region 业务属性
        
        /// <summary>
        /// 获取配置实例
        /// </summary>
        /// <param name="sectionName">section名称</param>
        /// <returns>配置实例</returns>
        public static PlatformSection Instance
        {
            get
            {
                return _platformSection = _platformSection ?? ConfigurationManager.GetSection("platform") as PlatformSection;
            }
        }

        #endregion

        #region 公开方法



        #endregion

        public override string ToString()
        {
            var builder = new StringBuilder();

            if (this.Redis != null)
            {
                builder.Append(this.Redis.ToString());
            }

            if (this.Settings != null)
            {
                builder.Append(this.Settings);
            }

            if (this.ConnectionStrings != null)
            {
                builder.Append(this.ConnectionStrings);
            }

            return builder.ToString();
        }
    }
}
