using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 基于Redis的session配置信息
    /// </summary>
    public class RedisSessionElement : ConfigurationElement
    {
        #region 属性

        /// <summary>
        /// 应用程序名称(多应用程序共享session需要name值相同)
        /// </summary>
        [ConfigurationProperty("name")]
        public string Name { get => base["name"]?.ToString(); set => base["name"] = value; }

        /// <summary>
        /// redis引用
        /// </summary>
        [ConfigurationProperty("redis", IsRequired = true)]
        public string RedisName { get => base["redis"]?.ToString(); set => base["redis"] = value; }

        /// <summary>
        /// 请求过期时间(单位：秒)
        /// </summary>
        [ConfigurationProperty("requestTimeOut", DefaultValue = 30)]
        public int RequestTimeOut { get => Convert.ToInt32(base["requestTimeOut"]); set => base["requestTimeOut"] = value; }

        /// <summary>
        /// session过期时间(单位：分钟)
        /// </summary>
        [ConfigurationProperty("timeOut", DefaultValue = 30)]
        public int SessionTimeOut { get => Convert.ToInt32(base["timeOut"]); set => base["timeOut"] = value; }

        #endregion
    }
}
