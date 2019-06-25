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
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="bucket"></param>
        /// <param name="key"></param>
        /// <param name="value"></param>
        public void Set<T>(string bucket, string key, T value)
        {
            var database = this.GetDatabase();

            database?.HashSet(bucket, key, value?.AsJson());
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
        /// 获取缓存值
        /// </summary>
        /// <typeparam name="T">缓存类型</typeparam>
        /// <param name="bucket">hash表名称</param>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public T Get<T>(string bucket, string key)
        {
            var database = this.GetDatabase();

            string cacheValue = database?.HashGet(bucket, key);

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
        public void Delete(string key)
        {
            this.GetDatabase()?.KeyDelete(key);
        }

        /// <summary>
        /// 删除缓存信息
        /// </summary>
        /// <param name="bucket">hash表名称</param>
        /// <param name="key">键</param>
        public void Delete(string bucket, string key)
        {
            this.GetDatabase()?.HashDelete(bucket, key);
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

        /// <summary>
        /// redis锁
        /// </summary>
        /// <param name="key">锁键</param>
        /// <param name="handler">业务处理委托</param>
        /// <param name="expiry">锁过期时间(单位：秒)</param>
        public void Lock(string key, Action handler, double expiry = 10)
        {
            var database = this.GetDatabase();

            if (database != null)
            {
                var lockerKey = $"____locker|{key}";
                var token = Environment.MachineName;

                if (database.LockTake(lockerKey, token, TimeSpan.FromSeconds(expiry)))
                {
                    try
                    {
                        handler?.Invoke();
                    }
                    finally
                    {
                        database.LockRelease(lockerKey, token);
                    }
                }
            }
        }

        #region Private Methods

        /// <summary>
        /// 连接redis服务
        /// </summary>
        private void ConnectRedis()
        {
            try
            {
                var redisConfig = PlatformSection.Instance.Redis;

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
