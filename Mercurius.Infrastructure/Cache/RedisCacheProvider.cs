using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
//using ServiceStack.Redis;

namespace Mercurius.Infrastructure.Cache
{
    /// <summary>
    /// 基于Redis的缓存提供者。
    /// </summary>
    //public class RedisCacheProvider : ICacheProvider
    //{
    //    #region 字段

    //    private object _locker = new object();
    //    private readonly RedisClient _redisClient;

    //    #endregion

    //    #region 构造方法

    //    /// <summary>
    //    /// 构造方法。
    //    /// </summary>
    //    /// <param name="host">主机地址</param>
    //    /// <param name="port">端口号</param>
    //    public RedisCacheProvider(string host, int port = 6379)
    //    {
    //        this._redisClient = new RedisClient(host, port);
    //    }

    //    #endregion

    //    public void Add(string key, object value, TimeSpan? timeSpan = null)
    //    {
    //        if (value is DataTable)
    //        {
    //            var b = timeSpan.HasValue
    //            ? this._redisClient.Set(key, value.AsJson(), timeSpan.Value)
    //            : this._redisClient.Set(key, value.AsJson());
    //        }
    //        else {
    //            var b = timeSpan.HasValue
    //                ? this._redisClient.Set(key, value, timeSpan.Value)
    //                : this._redisClient.Set(key, value);
    //        }
    //    }

    //    public void Clear()
    //    {
    //        this._redisClient.RemoveByRegex("*");
    //    }

    //    public T Get<T>(string key)
    //    {
    //        lock (this._locker)
    //        {
    //            return typeof(T) == typeof(DataTable) ? JsonConvert.DeserializeObject<T>(this._redisClient.Get<string>(key)) : this._redisClient.Get<T>(key);
    //        }
    //    }

    //    public void Remove(string key)
    //    {
    //        this._redisClient.Remove(key);
    //    }

    //    public void RemoveStarts(string key)
    //    {
    //        this._redisClient.RemoveByRegex($"{key}*");
    //    }
    //}
}
