using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StackExchange.Redis;

namespace Mercurius.Prime.Core.Configuration.Redis
{
    /// <summary>
    /// redis客户端
    /// </summary>
    public class RedisClient
    {
        #region 字段

        private ConnectionMultiplexer _connectionMultiplexer;

        #endregion

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        internal RedisClient()
        {
        }

        public RedisClient(string name)
        {
            var redisConfig = PlatformSection.Instance.Redis[name];

            var config = new ConfigurationOptions
            {
                Password = redisConfig.Password,
                Ssl = false,
                AllowAdmin = false,
                DefaultDatabase = redisConfig.Database
            };

            config.EndPoints.Add(redisConfig.Host, redisConfig.Port);

            this._connectionMultiplexer = ConnectionMultiplexer.Connect(config);
        }

        public IDatabase GetDatabase()
        {
            return this._connectionMultiplexer.GetDatabase();
        }

        /// <summary>
        /// 设置值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="expiry"></param>
        public void Set<T>(string key, T value, TimeSpan? expiry)
        {
            var database = this.GetDatabase();

            database.StringSet(key, value?.AsJson(), expiry);
        }

        public T Get<T>(string key)
        {
            var database = this.GetDatabase();
            string cacheValue = database.StringGet(key);

            return cacheValue.AsObject<T>();
        }

        public void Remove(string key)
        {
            this.GetDatabase()?.KeyDelete(key);
        }

        public void ExpireEntryAt(string key, TimeSpan expiry)
        {
            this.GetDatabase()?.KeyExpire(key, expiry);
        }
    }
}
