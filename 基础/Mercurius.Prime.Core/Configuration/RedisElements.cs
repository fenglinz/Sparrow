using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// redis服务器配置列表
    /// </summary>
    [ConfigurationCollection(typeof(RedisElement), AddItemName = "redis")]
    public class RedisElements : ConfigurationElementCollection
    {
        #region 属性

        /// <summary>
        /// 缓存redis名称
        /// </summary>
        [ConfigurationProperty("cacheRedis", DefaultValue = "cache")]
        public string CacheRedis { get => base["cacheRedis"]?.ToString(); set => base["cacheRedis"] = value; }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 创建配置元素
        /// </summary>
        /// <returns>redis配置元素</returns>
        protected override ConfigurationElement CreateNewElement()
        {
            return new RedisElement();
        }

        /// <summary>
        /// 获取元素key
        /// </summary>
        /// <param name="element">元素对象</param>
        /// <returns>key</returns>
        protected override object GetElementKey(ConfigurationElement element)
        {
            return (element as RedisElement)?.Name;
        }

        #endregion

        #region 公开方法

        public new RedisElement this[string name]
        {
            get
            {
                foreach (var item in this)
                {
                    var redis = item as RedisElement;

                    if (redis?.Name == name)
                    {
                        return redis;
                    }
                }

                return null;
            }
        }

        #endregion

        public override string ToString()
        {
            var builder = new StringBuilder();

            builder.AppendFormat("  缓存Redis名称：{0}\n", this.CacheRedis);

            if (!this.IsEmpty())
            {
                builder.AppendFormat("    redis服务列表：\n");

                foreach (var item in this)
                {
                    var el = item as RedisElement;

                    builder.AppendFormat("      名称：{0}，地址：{1}，端口：{2}，库编号：{3}\n", el.Name, el.Host, el.Port, el.Database);
                }
            }

            return builder.ToString();
        }
    }

    /// <summary>
    /// Redis缓存服务配置项
    /// </summary>
    public class RedisElement : ConfigurationElement
    {
        #region 属性

        /// <summary>
        /// 配置名称
        /// </summary>
        [ConfigurationProperty("name", IsKey = true, IsRequired = true)]
        public string Name { get => base["name"]?.ToString(); set => base["name"] = value; }

        /// <summary>
        /// 服务地址
        /// </summary>
        [ConfigurationProperty("host", IsRequired = true)]
        public string Host { get => base["host"]?.ToString(); set => base["host"] = value; }

        /// <summary>
        /// 端口
        /// </summary>
        [ConfigurationProperty("port", IsRequired = true)]
        public int Port { get => Convert.ToInt32(base["port"]); set => base["port"] = value; }

        /// <summary>
        /// 密码
        /// </summary>
        [ConfigurationProperty("password")]
        public string Password { get => base["password"]?.ToString(); set => base["password"] = value; }

        /// <summary>
        /// 数据库序号
        /// </summary>
        [ConfigurationProperty("database")]
        public int Database { get => Convert.ToInt32(base["database"]); set => base["database"] = value; }

        #endregion
    }
}
