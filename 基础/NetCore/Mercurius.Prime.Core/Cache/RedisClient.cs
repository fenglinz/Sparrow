using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Configuration;
using StackExchange.Redis;

namespace Mercurius.Prime.Core.Cache
{
    /// <summary>
    /// redis客户端
    /// </summary>
    public class RedisClient
    {
        #region Fields

        private ConnectionMultiplexer _connectionMultiplexer;

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public RedisClient()
        {
            ConnectRedis();
        }

        #endregion

        /// <summary>
        /// 获取redis数据库
        /// </summary>
        /// <returns>redis数据库</returns>
        public IDatabase GetDatabase()
        {
            if (this._connectionMultiplexer == null)
            {
                this.ConnectRedis();
            }

            return this._connectionMultiplexer?.GetDatabase();
        }

        /// <summary>
        /// 设置值
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="expiry">过期时间</param>
        public void Set<T>(string key, T value, TimeSpan? expiry = null)
        {
            var database = this.GetDatabase();

            database?.StringSet(key, value?.AsJson(), expiry);
        }

        /// <summary>
        /// 获取缓存值。
        /// </summary>
        /// <typeparam name="T">缓存数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public T Get<T>(string key)
        {
            var database = this.GetDatabase();
            string cacheValue = database?.StringGet(key);

            return cacheValue.AsObject<T>();
        }

        /// <summary>
        /// 获取缓存，当缓存中不存在时创建。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="dataFunc">缓存不存在创建缓存时的数据</param>
        /// <param name="expiry">缓存过期时间</param>
        /// <returns>值</returns>
        public T GetIfNotSet<T>(string key, Func<T> dataFunc, TimeSpan? expiry = null)
        {
            var data = this.Get<T>(key);

            if (data == null)
            {
                data = dataFunc();

                this.Set(key, data, expiry);
            }

            return data;
        }

        /// <summary>
        /// 删除缓存信息
        /// </summary>
        /// <param name="key">键</param>
        public void Remove(string key)
        {
            this.GetDatabase()?.KeyDelete(key);
        }

        /// <summary>
        /// 设置缓存过期时间
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="expiry">值</param>
        public void ExpireEntryAt(string key, TimeSpan expiry)
        {
            this.GetDatabase()?.KeyExpire(key, expiry);
        }

        #region Private Methods

        /// <summary>
        /// 连接redis服务
        /// </summary>
        private void ConnectRedis()
        {
            try
            {
                var redisConfig = PlatformConfig.Instance.Redis;

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
            catch { }
        }

        #endregion
    }
}
