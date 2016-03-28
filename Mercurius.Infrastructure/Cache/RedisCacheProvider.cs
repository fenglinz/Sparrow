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
    public class RedisCacheProvider : CacheProvider
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

        /// <summary>
        /// Redis登录密码。
        /// </summary>
        private const string PASSWORD_KEY = "Cache.Redis.Password";

        /// <summary>
        /// Redis数据库。
        /// </summary>
        private const string DATABASE_KEY = "Cache.Redis.Database";

        #endregion

        #region 字段

        private static readonly string Host;
        private static readonly int Port;
        private static readonly string Password;
        private static readonly int Database;

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
            Password = ConfigurationManager.AppSettings[PASSWORD_KEY];
            Database = int.Parse(ConfigurationManager.AppSettings[DATABASE_KEY]);

            Password = string.IsNullOrWhiteSpace(Password) ? null : Password;
        }

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public RedisCacheProvider()
        {
            this._redisClient = new RedisClient(Host, Port, Password, Database);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="host">主机地址</param>
        /// <param name="port">端口号</param>
        /// <param name="password">密码</param>
        /// <param name="database">数据库</param>
        public RedisCacheProvider(string host,
            int port = 6379, string password = null, long database = 0)
        {
            this._redisClient = new RedisClient(host, port, password, database);
        }

        #endregion

        #region CacheProvider抽象方法实现

        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        public override void Add(string key, object value, TimeSpan? timeSpan = null)
        {
            lock (this._locker)
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
        }

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        public override void Remove(string key)
        {
            lock (this._locker)
            {
                this._redisClient.Remove(key);
            }
        }

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        public override void RemoveStarts(string key)
        {
            lock (this._locker)
            {
                var keys = this._redisClient.SearchKeys($"{key}*");

                this._redisClient.RemoveAll(keys);
            }
        }

        /// <summary>
        /// 清空缓存。
        /// </summary>
        public override void Clear()
        {
            lock (this._locker)
            {
                var keys = this._redisClient.GetAllKeys();

                this._redisClient.RemoveAll(keys);
            }
        }

        /// <summary>
        /// 获取缓存中的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public override T Get<T>(string key)
        {
            lock (this._locker)
            {
                return typeof(T) == typeof(DataTable) ? JsonConvert.DeserializeObject<T>(this._redisClient.Get<string>(key)) : this._redisClient.Get<T>(key);
            }
        }

        /// <summary>
        /// 获取所有缓存键。
        /// </summary>
        /// <returns>缓存键集合</returns>
        public override IList<string> GetAllKeys()
        {
            return this._redisClient.GetAllKeys();
        }

        #endregion
    }
}
