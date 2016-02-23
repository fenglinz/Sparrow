using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using ServiceStack.Redis;
using System.Configuration;

namespace Mercurius.Infrastructure.Cache
{
    /// <summary>
    /// 基于Redis的缓存提供者。
    /// </summary>
    public class RedisCacheProvider : ICacheProvider
    {
        #region 常量

        /// <summary>
        /// 服务器地址配置键。
        /// </summary>
        private const string HOST_KEY = "Cache.Redis.Host";

        /// <summary>
        /// 端口号配置键。
        /// </summary>
        private const string PORT_KEY = "Cache.Redis.Port";

        #endregion

        #region 字段

        private static readonly string Host;
        private static readonly int Port;

        private object _locker = new object();
        private readonly RedisClient _redisClient;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static RedisCacheProvider()
        {
            Host = ConfigurationManager.AppSettings[HOST_KEY];
            Port = int.Parse(ConfigurationManager.AppSettings[PORT_KEY]);
        }

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public RedisCacheProvider()
        {
            this._redisClient = new RedisClient(Host, Port);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="host">主机地址</param>
        /// <param name="port">端口号</param>
        public RedisCacheProvider(string host, int port = 6379)
        {
            this._redisClient = new RedisClient(host, port);
        }

        #endregion

        public void Add(string key, object value, TimeSpan? timeSpan = null)
        {
            if (value is DataTable)
            {
                var b = timeSpan.HasValue
                ? this._redisClient.Set(key, value.AsJson(), timeSpan.Value)
                : this._redisClient.Set(key, value.AsJson());
            }
            else {
                var b = timeSpan.HasValue
                    ? this._redisClient.Set(key, value, timeSpan.Value)
                    : this._redisClient.Set(key, value);
            }
        }

        public void Clear()
        {
            lock (this._locker)
            {
                var keys = this._redisClient.GetAllKeys();

                this._redisClient.RemoveAll(keys);
            }
        }

        public T Get<T>(string key)
        {
            lock (this._locker)
            {
                return typeof(T) == typeof(DataTable) ? JsonConvert.DeserializeObject<T>(this._redisClient.Get<string>(key)) : this._redisClient.Get<T>(key);
            }
        }

        public void Remove(string key)
        {
            lock (this._locker)
            {
                this._redisClient.Remove(key);
            }
        }

        public void RemoveStarts(string key)
        {
            lock (this._locker)
            {
                var keys = this._redisClient.SearchKeys($"{key}*");

                this._redisClient.RemoveAll(keys);
            }
        }
    }
}
